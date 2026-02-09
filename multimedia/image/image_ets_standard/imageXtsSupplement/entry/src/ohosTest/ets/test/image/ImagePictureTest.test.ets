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
const TAG = 'Xts.imagePictureTest'
const imagePackerApi = image.createImagePacker();

async function CreatePicture(context: Context){
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let array = new ArrayBuffer(30000);
  let pathUri:string = 'test_exif_v2.jpg'
  let path = `file://${testContext.filesDir}/${pathUri}`;``
  const fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let readLength = await fs.read(fd.fd, array);
  await fs.close(fd);
  let ops: image.SourceOptions = {
    sourceDensity: 98,
  };
  let imageSource: image.ImageSource = image.createImageSource(array, ops);
  let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
  let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
  return pictureObj;
}

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

async function writePixelsFromBufferAbnormalPromiseTest(done: Function, testName: string, path: string,callback:(auxPictureObj?: image.AuxiliaryPicture)=>void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let fullPath = testContext.filesDir + '/' + path
  let imageSource = image.createImageSource(fullPath);
  console.info(TAG, testName, 'imageSource', imageSource)
  let packOpts: image.PackingOption = { format: "image/jpeg", quality: 98 };
  let buffer = await imagePackerApi.packToData(imageSource, packOpts)
  let auxPictureObj: image.AuxiliaryPicture | null =
    image.createAuxiliaryPicture(buffer as ArrayBuffer, { width: 200, height: 300 },
      image.AuxiliaryPictureType.GAINMAP);
  console.info(TAG, testName, 'auxPictureObj', auxPictureObj)
  callback(auxPictureObj);
}

export default function ImagePictureTest() {
  describe('ImagePictureTest', () => {
    beforeAll(async () => {
      AppStorage.setOrCreate('emptyString', '');
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('emptyString');
      console.info(TAG, 'afterAll case.');
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_001
     * @tc.name      SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_001
     * @tc.desc      getMainPixelmap isEditable
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_001";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        let mainPixelmap: image.PixelMap = pictureObj.getMainPixelmap();
        expect(mainPixelmap.isEditable).assertEqual(commodityPixelMap.isEditable);
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_002
     * @tc.name      SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_002
     * @tc.desc      getMainPixelmap isStrideAlignment
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_002";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        let mainPixelmap: image.PixelMap = pictureObj.getMainPixelmap();
        expect(mainPixelmap.isStrideAlignment).assertEqual(commodityPixelMap.isStrideAlignment);
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_001
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_001
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_001";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.jpg';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_002
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_002
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_002";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.jpg';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(null);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_003
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_003
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_003";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.jpg';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_004
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_004
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_004";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.webp';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_005
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_005
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_005";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.webp';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(null);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_006
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_006
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_006";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.webp';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_007
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_007
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_007', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_007";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.png';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_008
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_008
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_008', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_008";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.png';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(null);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_009
     * @tc.name      SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_009
     * @tc.desc      marshalling cover 401
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_009', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_PICTURE_MARSHALLING_009";
      console.info(TAG, `start：${testName}`);
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let path = 'test_exif_v2.png';
      const imageSourceApi = await getImageSource(path);
      let commodityPixelMap: image.PixelMap = await imageSourceApi.createPixelMap();
      let PictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        PictureObj.marshalling(AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_001
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_001
     * @tc.desc      setMetadata cover EXIF_METADATA and null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_001";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, null);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_002
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_002
     * @tc.desc      setMetadata cover EXIF_METADATA and undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_002";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, undefined);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_003
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_003
     * @tc.desc      setMetadata cover FRAGMENT_METADATA and null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_003";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, null);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7600202);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_004
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_004
     * @tc.desc      setMetadata cover FRAGMENT_METADATA and undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_004";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, undefined);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7600202);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_005
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_005
     * @tc.desc      setMetadata cover GIF_METADATA and null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_005";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, null);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_006
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_006
     * @tc.desc      setMetadata cover GIF_METADATA and undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_006";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, undefined);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_007
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_007
     * @tc.desc      setMetadata cover HEIFS_METADATA and null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_007', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_007";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, null);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_008
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_008
     * @tc.desc      setMetadata cover HEIFS_METADATA and undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_008', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_008";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, undefined);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_009
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_009
     * @tc.desc      setMetadata cover EXIF_METADATA and emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_009', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_009";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_010
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_010
     * @tc.desc      setMetadata cover FRAGMENT_METADATA and emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_010', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_010";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7600202);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_011
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_011
     * @tc.desc      setMetadata cover GIF_METADATA and emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_011', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_011";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_012
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_012
     * @tc.desc      setMetadata cover HEIFS_METADATA and emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_012', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_012";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_013
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_013
     * @tc.desc      setMetadata cover EXIF_METADATA and null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_013', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_013";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, null);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_014
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_014
     * @tc.desc      setMetadata cover EXIF_METADATA and undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_014', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_014";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, undefined);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_015
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_015
     * @tc.desc      setMetadata cover FRAGMENT_METADATA and null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_015', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_015";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, null);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7600202);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_016
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_016
     * @tc.desc      setMetadata cover FRAGMENT_METADATA and undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_016', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_016";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, undefined);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7600202);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_017
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_017
     * @tc.desc      setMetadata cover GIF_METADATA and null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_017', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_017";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, null);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_018
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_018
     * @tc.desc      setMetadata cover GIF_METADATA and undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_018', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_018";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, undefined);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_019
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_019
     * @tc.desc      setMetadata cover HEIFS_METADATA and null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_019', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_019";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, null);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_020
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_020
     * @tc.desc      setMetadata cover HEIFS_METADATA and undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_020', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_020";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, undefined);
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_021
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_021
     * @tc.desc      setMetadata cover EXIF_METADATA and emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_021', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_021";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.EXIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_022
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_022
     * @tc.desc      setMetadata cover FRAGMENT_METADATA and emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_022', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_022";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.FRAGMENT_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(7600202);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_023
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_023
     * @tc.desc      setMetadata cover GIF_METADATA and emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_023', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_023";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.webp');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.GIF_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_SET_METADATA_024
     * @tc.name      SUB_IMAGE_PICTURE_SET_METADATA_024
     * @tc.desc      setMetadata cover HEIFS_METADATA and emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_SET_METADATA_024', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_SET_METADATA_024";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let exifPictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        await exifPictureObj.setMetadata(metadataType, AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.info(TAG, testName, error, error.code)
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.number    IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_001
     * @tc.name      IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_001
     * @tc.desc      writePixelsFromBuffer cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_001';
      let auxBuffer: ArrayBuffer = new ArrayBuffer(10000);
      console.info(TAG,'auxBuffer');
      let auxSize: Size = { height: 50, width: 50 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      console.info(TAG,'auxiliaryPicture');
      try {
        await auxiliaryPicture.writePixelsFromBuffer(null);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_002
     * @tc.name      IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_002
     * @tc.desc      writePixelsFromBuffer cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_002';
      let auxBuffer: ArrayBuffer = new ArrayBuffer(10000);
      console.info(TAG,'auxBuffer');
      let auxSize: Size = { height: 50, width: 50 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      try {
        await auxiliaryPicture.writePixelsFromBuffer(undefined);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_003
     * @tc.name      IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_003
     * @tc.desc      writePixelsFromBuffer cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_WRITE_PIXELS_FROM_BUFFER_TEST_003';
      let auxBuffer: ArrayBuffer = new ArrayBuffer(10000);
      console.info(TAG,'auxBuffer');
      let auxSize: Size = { height: 50, width: 50 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      try {
        await auxiliaryPicture.writePixelsFromBuffer(AppStorage.get('emptyString'));
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_001
     * @tc.name      IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_001
     * @tc.desc      setMetadata cover HEIFS_METADATA
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_001';
      let auxBuffer: ArrayBuffer = new ArrayBuffer(10000);
      console.info(TAG,'auxBuffer');
      let auxSize: Size = { height: 50, width: 50 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        auxiliaryPicture.setMetadata(metadataType,null);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_002
     * @tc.name      IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_002
     * @tc.desc      setMetadata cover HEIFS_METADATA
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_002';
      let auxBuffer: ArrayBuffer = new ArrayBuffer(10000);
      console.info(TAG,'auxBuffer');
      let auxSize: Size = { height: 50, width: 50 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        auxiliaryPicture.setMetadata(metadataType,undefined);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_003
     * @tc.name      IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_003
     * @tc.desc      setMetadata cover HEIFS_METADATA
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_SET_METADATA_TEST_003';
      let auxBuffer: ArrayBuffer = new ArrayBuffer(10000);
      console.info(TAG,'auxBuffer');
      let auxSize: Size = { height: 50, width: 50 };
      let auxType: image.AuxiliaryPictureType = image.AuxiliaryPictureType.GAINMAP;
      let auxiliaryPicture: image.AuxiliaryPicture | null = image.createAuxiliaryPicture(auxBuffer, auxSize, auxType);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        auxiliaryPicture.setMetadata(metadataType,AppStorage.get('emptyString'))
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, error, error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
  })
}