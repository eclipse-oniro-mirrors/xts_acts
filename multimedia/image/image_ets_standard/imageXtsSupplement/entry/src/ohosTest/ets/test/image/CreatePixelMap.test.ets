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
import { BusinessError } from '@ohos.base';
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import common from '@ohos.app.ability.common';
import ImageGetImagePropertySyncEnumFrontCamera from './ImageGetImagePropertySyncEnumFrontCamera.test';
import { application } from '@kit.AbilityKit';

const TAG = 'ImageXts.CreatePixelMap'

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

async function createPixelMapFromImage(pathUri: string, sourceDensity: number = 98): Promise<image.PixelMap> {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let array = new ArrayBuffer(30000);
  let path = `file://${testContext.filesDir}/${pathUri}`;
  const fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  let readLength = await fs.read(fd.fd, array);
  await fs.close(fd);
  console.info(TAG, `readLength: ${readLength}`);
  let ops: image.SourceOptions = {
    sourceDensity: sourceDensity,
  };
  let imageSource: image.ImageSource = image.createImageSource(array, ops);
  let pixelmap = await imageSource.createPixelMap();
  await imageSource.release();
  return pixelmap;
}

async function imageArray(): Promise<[Uint8Array, Uint8Array, Uint8Array]> {
  let appContext: Context= AppStorage.get('testContext') as common.UIAbilityContext;
  let testContext = await application.createModuleContext(appContext, "entry_test");
  let imageArray = testContext.resourceManager.getMediaContentSync($r('app.media.startIcon').id);
  let splitBuff1 = imageArray.slice(0, imageArray.byteLength / 2);
  let splitBuff2 = imageArray.slice(imageArray.byteLength / 2);
  return [splitBuff1,splitBuff2,imageArray]
}

export default function CreatePixelMapSupp() {
  const CROP_FIRST = image.CropAndScaleStrategy.CROP_FIRST;
  describe('CreatePixelMapSupp', () => {
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
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_001';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_002';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_003';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_004';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_005';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_006';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_007';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_008';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009
     * @tc.desc       createPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_009';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(null as ESObject);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010
     * @tc.desc       createPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_010';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(undefined);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011
     * @tc.desc       createPixelMap cover ' '
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_011';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap();
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012
     * @tc.desc       createPixelMap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_012';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          editable: false
        };
        imageSourceApi = await getImageSource('test_exif_v2.jpg');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'SUCCEED', pixelMap.isEditable);
        console.info(TAG, testName, 'SUCCEED', pixelMap.isStrideAlignment);
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_014';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_015';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_016';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_017';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();

      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_018';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_019';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_020';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_021';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022
     * @tc.desc       createPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_022';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(null as ESObject);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023
     * @tc.desc       createPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_023';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(undefined);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024
     * @tc.desc       createPixelMap cover ' '
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_024';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap();
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025
     * @tc.desc       createPixelMap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_025';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          editable: false
        };
        imageSourceApi = await getImageSource('test_exif_v2.png');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'SUCCEED', pixelMap.isEditable);
        console.info(TAG, testName, 'SUCCEED', pixelMap.isStrideAlignment);
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027
     * @tc.desc       createPixelMap cover UNKNOWN
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_027';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028
     * @tc.desc       createPixelMap cover ARGB_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_028';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ARGB_8888,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029
     * @tc.desc       createPixelMap cover BGRA_8888
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_029';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.BGRA_8888,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030
     * @tc.desc       createPixelMap cover ALPHA_8
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_030';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect().assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect(error.code).assertUndefined();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031
     * @tc.desc       createPixelMap cover RGBA_F16
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_031';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.RGBA_F16,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032
     * @tc.desc       createPixelMap cover YCRCB_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_032';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.YCRCB_P010,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033
     * @tc.desc       createPixelMap cover YCBCR_P010
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_033';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.YCBCR_P010,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034
     * @tc.desc       createPixelMap cover ASTC_4x4
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_034';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          sampleSize: 1,
          editable: false,
          desiredSize: { width: 198, height: 202 },
          desiredRegion: { x: 0, y: 0, size: { width: 124, height: 100 } },
          cropAndScaleStrategy: CROP_FIRST,
          rotate: 0,
          desiredPixelFormat: image.PixelMapFormat.ASTC_4x4,
          index: 0,
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap !== undefined).assertTrue();
        await pixelMap?.release();
      }catch (error) {
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035
     * @tc.desc       createPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_035';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(null as ESObject);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036
     * @tc.desc       createPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_036';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(undefined);
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037
     * @tc.desc       createPixelMap cover ' '
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_037';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap();
        console.info(TAG, testName, 'Succeeded in creating pixelMap object through image decoding parameters.', pixelMap);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038
     * @tc.name       SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038
     * @tc.desc       createPixelMap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_PIXELMAP_TEST_038';
      let imageSourceApi: image.ImageSource | null = null;
      try{
        let decodeOpts: image.DecodingOptions = {
          editable: false
        };
        imageSourceApi = await getImageSource('test_exif_v2.webp');
        const pixelMap = await imageSourceApi.createPixelMap(decodeOpts);
        console.info(TAG, testName, 'SUCCEED', pixelMap.isEditable);
        console.info(TAG, testName, 'SUCCEED', pixelMap.isStrideAlignment);
        expect(pixelMap.isEditable).assertFalse();
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to create pixelMap object through image decoding parameters, error.code ${error.code}, error.message ${error.message}`);
        expect().assertFail();
      }
      await imageSourceApi?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_040
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_040
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_040', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_040';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfo();
        console.info(TAG, testName, `imageInfo.size.height: `+ imageInfo.size.height);
        console.info(TAG, testName, `imageInfo.size.weidth: `+ imageInfo.size.width);
        expect(imageInfo.size.height).assertEqual(226);
        expect(imageInfo.size.width).assertEqual(472);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_041
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_041
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_041', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_041';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfo();
        console.info(TAG, testName, `imageInfo.size.height: `+ imageInfo.size.height);
        console.info(TAG, testName, `imageInfo.size.weidth: `+ imageInfo.size.width);
        expect(imageInfo.size.height).assertEqual(75);
        expect(imageInfo.size.width).assertEqual(472);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_042
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_042
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_042', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_042';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        const imageInfo = await pixelMap.getImageInfo();
        console.info(TAG, testName, `imageInfo.size.height: `+ imageInfo.size.height);
        console.info(TAG, testName, `imageInfo.size.weidth: `+ imageInfo.size.width);
        expect(imageInfo.size.height).assertEqual(221);
        expect(imageInfo.size.width).assertEqual(286);
      }catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_043
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_043
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_043', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_043';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.getImageInfo(async (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, `imageInfo.size.height: `+ imageInfo.size.height);
            console.info(TAG, testName, `imageInfo.size.weidth: `+ imageInfo.size.width);
            expect(imageInfo.size.height).assertEqual(226);
            expect(imageInfo.size.width).assertEqual(472);
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_048
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_048
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_048', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_048';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.getImageInfo(async (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, `imageInfo.size.height: `+ imageInfo.size.height);
            console.info(TAG, testName, `imageInfo.size.weidth: `+ imageInfo.size.width);
            expect(imageInfo.size.height).assertEqual(75);
            expect(imageInfo.size.width).assertEqual(472);
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_GET_IMAGE_INFO_TEST_050
     * @tc.name       SUB_MEDIA_GET_IMAGE_INFO_TEST_050
     * @tc.desc       getImageInfo cover size
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_GET_IMAGE_INFO_TEST_050', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_GET_IMAGE_INFO_TEST_050';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.getImageInfo(async (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            console.error(TAG, testName,
              `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, `imageInfo.size.height: `+ imageInfo.size.height);
            console.info(TAG, testName, `imageInfo.size.weidth: `+ imageInfo.size.width);
            expect(imageInfo.size.height).assertEqual(221);
            expect(imageInfo.size.width).assertEqual(286);
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_052
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_052
     * @tc.desc       createAlphaPixelmap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_052', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_052';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        let alphaPixelMap = await pixelMap.createAlphaPixelmap();
        console.info(TAG, testName, 'SUCCEED', alphaPixelMap.isEditable);
        console.info(TAG, testName, 'SUCCEED', alphaPixelMap.isStrideAlignment);
        expect(alphaPixelMap.isEditable).assertFalse();
        expect(alphaPixelMap.isStrideAlignment).assertFalse();
        await alphaPixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_054
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_054
     * @tc.desc       createAlphaPixelmap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_054', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_054';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        let alphaPixelMap = await pixelMap.createAlphaPixelmap();
        console.info(TAG, testName, 'SUCCEED', alphaPixelMap.isEditable);
        console.info(TAG, testName, 'SUCCEED', alphaPixelMap.isStrideAlignment);
        expect(alphaPixelMap.isEditable).assertFalse();
        expect(alphaPixelMap.isStrideAlignment).assertFalse();
        await alphaPixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_056
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_056
     * @tc.desc       createAlphaPixelmap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_056', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_056';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try{
        let alphaPixelMap = await pixelMap.createAlphaPixelmap();
        console.info(TAG, testName, 'SUCCEED', alphaPixelMap.isEditable);
        console.info(TAG, testName, 'SUCCEED', alphaPixelMap.isStrideAlignment);
        expect(alphaPixelMap.isEditable).assertFalse();
        expect(alphaPixelMap.isStrideAlignment).assertFalse();
        await alphaPixelMap?.release();
      }catch (error){
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_058
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_058
     * @tc.desc       createAlphaPixelmap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_058', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_058';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.createAlphaPixelmap(async (err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'SUCCEED ', alphaPixelMap.isEditable);
            console.info(TAG, testName, 'SUCCEED ', alphaPixelMap.isStrideAlignment);
            expect(alphaPixelMap.isEditable).assertFalse();
            expect(alphaPixelMap.isStrideAlignment).assertFalse();
            await alphaPixelMap?.release();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_060
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_060
     * @tc.desc       createAlphaPixelmap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_060', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_060';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.createAlphaPixelmap(async (err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isEditable);
            console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isStrideAlignment);
            expect(alphaPixelMap.isEditable).assertFalse();
            expect(alphaPixelMap.isStrideAlignment).assertFalse();
            await alphaPixelMap?.release();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_062
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_062
     * @tc.desc       createAlphaPixelmap cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_062', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_062';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.createAlphaPixelmap(async (err: BusinessError, alphaPixelMap: image.PixelMap) => {
          if (alphaPixelMap == undefined) {
            console.error(TAG, testName, `Failed to obtain new pixel map. code is ${err.code}, message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isEditable);
            console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isStrideAlignment);
            expect(alphaPixelMap.isEditable).assertFalse();
            expect(alphaPixelMap.isStrideAlignment).assertFalse();
            await alphaPixelMap?.release();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_064
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_064
     * @tc.desc       createAlphaPixelmapSync cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_064', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_064';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        if (pixelMap != undefined) {
          let alphaPixelMap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isEditable);
          console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isStrideAlignment);
          expect(alphaPixelMap.isEditable).assertFalse();
          expect(alphaPixelMap.isStrideAlignment).assertFalse();
          await alphaPixelMap?.release();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_066
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_066
     * @tc.desc       createAlphaPixelmapSync cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_066', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_066';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        if (pixelMap != undefined) {
          let alphaPixelMap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isEditable);
          console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isStrideAlignment);
          expect(alphaPixelMap.isEditable).assertFalse();
          expect(alphaPixelMap.isStrideAlignment).assertFalse();
          await alphaPixelMap?.release();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_068
     * @tc.name       SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_068
     * @tc.desc       createAlphaPixelmapSync cover isEditable&isStrideAlignment
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_068', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_ALPHA_PIXELMAP_TEST_068';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        if (pixelMap != undefined) {
          let alphaPixelMap : image.PixelMap = pixelMap.createAlphaPixelmapSync();
          console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isEditable);
          console.info(TAG, testName, 'SUCCEED',alphaPixelMap.isStrideAlignment);
          expect(alphaPixelMap.isEditable).assertFalse();
          expect(alphaPixelMap.isStrideAlignment).assertFalse();
          await alphaPixelMap?.release();
        }
      } catch (error) {
        console.error(TAG, testName,
          `Failed to obtain the image pixel map information. code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_070
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_070
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_070', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_070';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(null, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_071
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_071
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_071', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_071';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, null, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_072
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_072
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_072', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_072';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_073
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_073
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_073', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_073';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_074
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_074
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_074', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_074';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_075
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_075
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_075', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_075';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_076
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_076
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_076', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_076';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_077
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_077
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_077', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_077';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(null, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_078
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_078
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_078', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_078';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, null, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_079
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_079
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_079', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_079';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_080
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_080
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_080', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_080';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_081
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_081
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_081', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_081';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_082
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_082
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_082', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_082';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_083
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_083
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_083', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_083';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_084
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_084
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_084', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_084';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(null, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_085
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_085
     * @tc.desc       createScaledPixelMap cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_085', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_085';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, null, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_086
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_086
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_086', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_086';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_087
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_087
     * @tc.desc       createScaledPixelMap cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_087', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_087';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, 'Expected to fail', scaledPixelMap);
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_088
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_088
     * @tc.desc       createScaledPixelMap cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_088', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_088';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_089
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_089
     * @tc.desc       createScaledPixelMap cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_089', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_089';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_090
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_090
     * @tc.desc       createScaledPixelMap cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_090', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_TEST_090';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        const scaledPixelMap = await pixelMap.createScaledPixelMap(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_091
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_091
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_091', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_091';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_092
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_092
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_092', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_092';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_093';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_094';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_095';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_096';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_097';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_098';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_099';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_100';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_101';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_102';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_103';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_104';
      const pathUri = 'test_exif_v2.png';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_105';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106
     * @tc.desc       createScaledPixelMapSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_106';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_107';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108
     * @tc.desc       createScaledPixelMapSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_108';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.info(TAG, testName, 'SUCCEED');
        expect().assertFail();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109
     * @tc.desc       createScaledPixelMapSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_109';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110
     * @tc.desc       createScaledPixelMapSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_110';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_111
     * @tc.name       SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_111
     * @tc.desc       createScaledPixelMapSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_111', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_CREATE_SCALED_PIXELMAP_SYNC_TEST_111';
      const pathUri = 'test_exif_v2.webp';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 2.0;
        let scaledPixelMap = pixelMap.createScaledPixelMapSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.info(TAG, testName, 'SUCCEED');
        expect(scaledPixelMap != undefined).assertTrue();
        await scaledPixelMap?.release();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_TEST_112
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_TEST_112
     * @tc.desc       opacity cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_TEST_112', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_TEST_112';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.opacity(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName,`Failed to set opacity. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in setting opacity.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_TEST_113
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_TEST_113
     * @tc.desc       opacity cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_TEST_113', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_TEST_113';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.opacity(undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName,`Failed to set opacity. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in setting opacity.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName,
          `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_TEST_114
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_TEST_114
     * @tc.desc       opacity cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_TEST_114', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_TEST_114';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let Pixelmap = pixelMap.opacity(null);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_TEST_115
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_TEST_115
     * @tc.desc       opacity cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_TEST_115', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_TEST_115';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let Pixelmap = pixelMap.opacity(undefined);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_116
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_116
     * @tc.desc       opacitySync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_116', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_116';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.opacitySync(null);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_117
     * @tc.name       SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_117
     * @tc.desc       opacitySync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_117', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_OPACITY_SYNC_TEST_117';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.opacitySync(undefined);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != null).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_118
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_118
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_118', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_118';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scale(null, scaleY, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelmap.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_119
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_119
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_119', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_119';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scale(undefined, scaleY, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelmap.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_120
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_120
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_120', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_120';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scale(scaleX, null, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelmap.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_121
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_121
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_121', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_121';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scale(scaleX, undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to scale pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, "Succeeded in scaling pixelmap.");
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_122
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_122
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_122', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_122';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let Pixelmap = pixelMap.scale(null, scaleY);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_123
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_123
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_123', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_123';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        let Pixelmap = pixelMap.scale(undefined, scaleY);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_124
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_124
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_124', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_124';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let Pixelmap = pixelMap.scale(scaleX, null);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_125
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_125
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_125', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_125';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let Pixelmap = pixelMap.scale(scaleX, undefined);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_126
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_126
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_126', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_126';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scaleSync(null, scaleY);
        console.error(TAG, testName, '未触发预期的错误！',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_127
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_127
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_127', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_127';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scaleSync(undefined, scaleY);
        console.error(TAG, testName, '未触发预期的错误！',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_128
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_128
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_128', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_128';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scaleSync(scaleX, null);
        console.error(TAG, testName, '未触发预期的错误！',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_129
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_129
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_129', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_129';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scaleSync(scaleX, undefined);
        console.error(TAG, testName, '未触发预期的错误！',pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_130
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_130
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_130', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_130';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scale(null, scaleY,image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_131
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_131
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_131', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_131';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scale(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_132
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_132
     * @tc.desc       scale cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_132', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_132';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scale(scaleX, null, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_133
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_133
     * @tc.desc       scale cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_133', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_133';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scale(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_134
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_134
     * @tc.desc       scale cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_134', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_134';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_135
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_135
     * @tc.desc       scale cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_135', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_135';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_TEST_136
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_TEST_136
     * @tc.desc       scale cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_TEST_136', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_TEST_136';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scale(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_137
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_137
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_137', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_137';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scaleSync(null, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_138
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_138
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_138', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_138';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleY: number = 1.0;
        pixelMap.scaleSync(undefined, scaleY, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_139
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_139
     * @tc.desc       scaleSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_139', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_139';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scaleSync(scaleX, null, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_140
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_140
     * @tc.desc       scaleSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_140', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_140';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        pixelMap.scaleSync(scaleX, undefined, image.AntiAliasingLevel.LOW);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_141
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_141
     * @tc.desc       scaleSync cover NONE
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_141', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_141';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.NONE);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_142
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_142
     * @tc.desc       scaleSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_142', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_142';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_143
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_143
     * @tc.desc       scaleSync cover MEDIUM
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_143', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_143';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.MEDIUM);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_144
     * @tc.name       SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_144
     * @tc.desc       scaleSync cover HIGH
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_144', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_SCALE_SYNC_TEST_144';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let scaleX: number = 2.0;
        let scaleY: number = 1.0;
        pixelMap.scaleSync(scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_145
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_145
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_145', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_145';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY: number = 10.0;
        pixelMap.translate(null, translateY, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in translating pixelmap.');
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_146
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_146
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_146', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_146';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY: number = 10.0;
        pixelMap.translate(undefined, translateY, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in translating pixelmap.');
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_147
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_147
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_147', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_147';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX: number = 50.0;
        pixelMap.translate(translateX, null, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in translating pixelmap.');
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_148
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_148
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_148', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_148';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX: number = 50.0;
        pixelMap.translate(translateX, undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to translate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect(err.code).assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in translating pixelmap.');
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_149
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_149
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_149', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_149';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY: number = 10.0;
        let Pixelmap = pixelMap.translate(null, translateY);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_150
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_150
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_150', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_150';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY: number = 10.0;
        let Pixelmap = pixelMap.translate(undefined, translateY);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_151
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_151
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_151', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_151';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX: number = 50.0;
        let Pixelmap = pixelMap.translate(translateX, null);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_165
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_165
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_165', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_TEST_165';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX: number = 50.0;
        let Pixelmap = pixelMap.translate(translateX, undefined);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_152
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_152
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_152', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_152';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY : number = 10.0;
        pixelMap.translateSync(null, translateY);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_153
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_153
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_153', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_153';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateY : number = 10.0;
        pixelMap.translateSync(undefined, translateY);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_154
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_154
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_154', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_154';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX : number = 50.0;
        pixelMap.translateSync(translateX, null);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_155
     * @tc.name       SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_155
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_155', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_TRANSLATE_SYNC_TEST_155';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let translateX : number = 50.0;
        pixelMap.translateSync(translateX, undefined);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_TEST_156
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_TEST_156
     * @tc.desc       rotate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_TEST_156', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_TEST_156';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.rotate(null, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to rotate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in rotating pixelmap.');
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_TEST_157
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_TEST_157
     * @tc.desc       rotate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_TEST_157', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_TEST_157';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.rotate(undefined, (err: BusinessError) => {
          if (err) {
            console.error(TAG, testName, `Failed to rotate pixelmap. code is ${err.code}, message is ${err.message}`);
            expect().assertUndefined();
          } else {
            console.info(TAG, testName, 'Succeeded in rotating pixelmap.');
            expect().assertTrue();
          }
        })
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_TEST_158
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_TEST_158
     * @tc.desc       translate cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_TEST_158', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_TEST_158';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let Pixelmap = pixelMap.rotate(null);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_TEST_159
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_TEST_159
     * @tc.desc       translate cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_TEST_159', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_TEST_159';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        let Pixelmap = pixelMap.rotate(undefined);
        console.error(TAG, testName, '未触发预期的错误！',Pixelmap);
        expect(Pixelmap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_160
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_160
     * @tc.desc       translateSync cover null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_160', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_160';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.rotateSync(null);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_161
     * @tc.name       SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_161
     * @tc.desc       translateSync cover undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_161', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_PIXELMAP_ROTATE_SYNC_TEST_161';
      const pathUri = 'test_exif_v2.jpg';
      const pixelMap = await createPixelMapFromImage(pathUri);
      console.info(TAG, testName, `pixelmap创建成功`);
      try {
        pixelMap.rotateSync(undefined);
        console.error(TAG, testName, '未触发预期的错误！', pixelMap);
        expect(pixelMap != undefined).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `Failed to create scaledPixelMap. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await pixelMap?.release();
      done();
    })
    /**
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_162
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_162
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_162', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_162';
      try {
        let resourceId = $r('app.media.startIcon').id;
        console.info(TAG, testName, 'Resource ID:', resourceId);
        let imageData = await imageArray();
        console.info(TAG, testName, 'Image data loaded, length:', imageData[2].byteLength);
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(
          new ArrayBuffer(imageData[2].byteLength)
        );
        await imageSourceIncrementalSApi.updateData(imageData[0], false, 0, imageData[0].byteLength);
        await imageSourceIncrementalSApi.updateData(imageData[1], true, 0, imageData[1].byteLength);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi.supportedFormats);
        expect(imageSourceIncrementalSApi.supportedFormats != undefined).assertTrue();
        await imageSourceIncrementalSApi.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_163
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_163
     * @tc.desc       CreateIncrementalSource cover sourceDensity,sourcePixelFormat,sourceSize
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_163', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_163';
      try {
        let resourceId = $r('app.media.startIcon').id;
        console.info(TAG, testName, 'Resource ID:', resourceId);
        let imageData = await imageArray();
        console.info(TAG, testName, 'Image data loaded, length:', imageData[2].byteLength);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(
          new ArrayBuffer(imageData[2].byteLength),sourceOptions
        );
        await imageSourceIncrementalSApi.updateData(imageData[0], false, 0, imageData[0].byteLength);
        await imageSourceIncrementalSApi.updateData(imageData[1], true, 0, imageData[1].byteLength);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi);
        expect(imageSourceIncrementalSApi != undefined).assertTrue();
        await imageSourceIncrementalSApi.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.name       SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_164
     * @tc.number     SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_164
     * @tc.desc       CreateIncrementalSource return supportedFormats
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_164', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_SOURCE_CreateIncrementalSource_164';
      try {
        let resourceId = $r('app.media.startIcon').id;
        console.info(TAG, testName, 'Resource ID:', resourceId);
        let imageData = await imageArray();
        console.info(TAG, testName, 'Image data loaded, length:', imageData[2].byteLength);
        let sourceOptions: image.SourceOptions = {
          sourceDensity: 120,
          sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
          sourceSize: {
            height: 100,
            width: 100
          }
        };
        const imageSourceIncrementalSApi: image.ImageSource = image.CreateIncrementalSource(
          new ArrayBuffer(imageData[2].byteLength),sourceOptions
        );
        await imageSourceIncrementalSApi.updateData(imageData[0], false, 0, imageData[0].byteLength);
        await imageSourceIncrementalSApi.updateData(imageData[1], true, 0, imageData[1].byteLength);
        console.info(TAG, testName, 'Succeeded ', imageSourceIncrementalSApi.supportedFormats);
        expect(imageSourceIncrementalSApi.supportedFormats != undefined).assertTrue();
        await imageSourceIncrementalSApi.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Error: ${JSON.stringify(error)}`);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_166
     * @tc.name       SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_166
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_166', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_166';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        creator.dequeueImage((err: BusinessError, img: image.Image) => {
          if (err) {
            console.error(TAG, testName, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
            expect().assertFail();
          } else {
            console.info(TAG ,testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.clipRect));
            console.info(TAG ,testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.size));
            console.info(TAG ,testName, 'Succeeded in dequeuing the Image', img.format);
            console.info(TAG ,testName, 'Succeeded in dequeuing the Image', img.timestamp);
            expect(img.clipRect.size.width).assertEqual(8192);
            expect(img.clipRect.size.height).assertEqual(8192);
            expect(img.clipRect.x).assertEqual(0);
            expect(img.clipRect.y).assertEqual(0);
            expect(img.size.height).assertEqual(8192);
            expect(img.size.width).assertEqual(8192);
            expect(img.format).assertEqual(12);
            expect(img.timestamp).assertEqual(0);
          }
        })
      }catch (error) {
        console.error(TAG, testName, `Failed. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await creator.release();
      done();
    })
    /**
     * @tc.number     SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_167
     * @tc.name       SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_167
     * @tc.desc       dequeueImage return clipRec,size,format,timestamp
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_167', Level.LEVEL1, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATOR_dequeueImage_TEST_167';
      let size: image.Size = {
        height: 8192,
        width: 8192
      }
      let creator: image.ImageCreator = image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        let img = await creator.dequeueImage();
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.clipRect));
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', JSON.stringify(img.size));
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', img.format);
        console.info(TAG, testName, 'Succeeded in dequeuing the Image', img.timestamp);
        expect(img.clipRect.size.width).assertEqual(8192);
        expect(img.clipRect.size.height).assertEqual(8192);
        expect(img.clipRect.x).assertEqual(0);
        expect(img.clipRect.y).assertEqual(0);
        expect(img.size.height).assertEqual(8192);
        expect(img.size.width).assertEqual(8192);
        expect(img.format).assertEqual(12);
        expect(img.timestamp).assertEqual(0);
      } catch (error) {
        console.error(TAG, testName, `Failed. Error code is ${error.code}, error message is ${error.message}`);
        expect().assertFail();
      }
      await creator.release();
      done();
    })

  })
}