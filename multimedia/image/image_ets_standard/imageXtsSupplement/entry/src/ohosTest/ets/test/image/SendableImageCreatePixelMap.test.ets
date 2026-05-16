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

import { image, sendableImage } from '@kit.ImageKit';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import { isEmpty } from '../common';
import { rpc } from '@kit.IPCKit';
const TAG = 'Xts.ImagePixelMap'

let fdNumber: number;
async function getFd(fileName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let filePath = `file://${testContext.filesDir}/${fileName}`;
  console.info(TAG, 'image case filePath is ' + filePath);
  const fileInfo = await fs.open(filePath);
  fdNumber = fileInfo.fd;
  console.info(TAG, 'case getFd number is: ' + fdNumber);
  return fdNumber;
}

async function getImageSource(path: string): Promise<image.ImageSource> {
  await getFd(path);
  const imageSourceApi = image.createImageSource(fdNumber);
  console.info(TAG, "createImageSource: " + JSON.stringify(imageSourceApi.getImageInfoSync()));
  return imageSourceApi;
}

async function createPictureSUPP(context : Context): Promise<image.Picture> {
  let array = new ArrayBuffer(300000000);
  let pathUri = 'AllAuxiliaryPictures_exclude_fragment.jpg'
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

async function createPixelMapTest(context : Context):Promise<image.PixelMap> {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: true,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;
  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
  console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
  return pixelMap;
}

async function createPixelMapSUPP(context : Context):Promise<image.PixelMap> {
  const param: image.InitializationOptions = {
    alphaType: image.AlphaType.UNKNOWN,
    editable: false,
    srcPixelFormat: image.PixelMapFormat.BGRA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
    size: { height: 50, width: 50 }
  };
  const allocatorType = image.AllocatorType.AUTO;
  let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
  console.info(TAG,'Succeeded in creating pixelMap object.',JSON.stringify(pixelMap));
  return pixelMap;
}

async function createSendAblePixelMapTest(context : Context):Promise<sendableImage.PixelMap> {
  const color: ArrayBuffer = new ArrayBuffer(96);
  let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
  let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
  console.info(TAG,'Succeeded in creating sendablePixelMap object.',JSON.stringify(sendablePixelMap));
  return sendablePixelMap;
}

async function createSendAblePixelMapSUPP(context : Context):Promise<sendableImage.PixelMap> {
  const color: ArrayBuffer = new ArrayBuffer(96);
  let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
  let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
  console.info(TAG,'Succeeded in creating sendablePixelMap object.',JSON.stringify(sendablePixelMap));
  return sendablePixelMap;
}

export default function SendableImagePixelMapTest() {
  describe('SendableImagePixelMapTest', () => {
    let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
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
      AppStorage.delete('emptyString');
      console.info(TAG, 'afterAll case.');
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_001
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_001
     * @tc.desc      createPixelMap-options editable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_001";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        editable: false
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(isEmpty(pixelMap)).assertFalse();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_002
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_002
     * @tc.desc      createPixelMap-options desiredPixelFormat cover UNKNOWN
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_002";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.UNKNOWN
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_003
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_003
     * @tc.desc      createPixelMap-options desiredPixelFormat cover ARGB_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_003";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ARGB_8888
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_004
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_004
     * @tc.desc      createPixelMap-options desiredPixelFormat cover RGB_565
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_004";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.RGB_565).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_005
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_005
     * @tc.desc      createPixelMap-options desiredPixelFormat cover BGRA_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_005";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.BGRA_8888
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.BGRA_8888).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_006
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_006
     * @tc.desc      createPixelMap-options desiredPixelFormat cover RGB_888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_006";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGB_888
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_007
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_007
     * @tc.desc      createPixelMap-options desiredPixelFormat cover ALPHA_8
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_007', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_007";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ALPHA_8
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_008
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_008
     * @tc.desc      createPixelMap-options desiredPixelFormat cover RGBA_F16
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_008', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_008";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_F16
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_009
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_009
     * @tc.desc      createPixelMap-options desiredPixelFormat cover NV21
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_009', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_009";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV21
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.NV21).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_010
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_010
     * @tc.desc      createPixelMap-options desiredPixelFormat cover NV12
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_010', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_010";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.NV12
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        let res = await pixelMap.getImageInfo();
        expect(res.pixelFormat == image.PixelMapFormat.NV12).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_011
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_011
     * @tc.desc      createPixelMap-options desiredPixelFormat cover RGBA_1010102
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_011', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_011";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_012
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_012
     * @tc.desc      createPixelMap-options desiredPixelFormat cover YCBCR_P010
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_012', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_012";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCBCR_P010
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_013
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_013
     * @tc.desc      createPixelMap-options desiredPixelFormat cover YCRCB_P010
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_013', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_013";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.YCRCB_P010
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_014
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_014
     * @tc.desc      createPixelMap-options desiredPixelFormat cover ASTC_4x4
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_014', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_014";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredPixelFormat: image.PixelMapFormat.ASTC_4x4
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_015
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_015
     * @tc.desc      createPixelMap-options desiredDynamicRange cover SDR
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_015', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_015";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.SDR
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_016
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_016
     * @tc.desc      createPixelMap-options desiredDynamicRange cover HDR
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_016', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_016";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        desiredDynamicRange: image.DecodingDynamicRange.HDR
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_017
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_017
     * @tc.desc      createPixelMap-options cropAndScaleStrategy cover SCALE_FIRST
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_017', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_017";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        cropAndScaleStrategy: image.CropAndScaleStrategy.SCALE_FIRST
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_018
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_018
     * @tc.desc      createPixelMap-options cropAndScaleStrategy cover CROP_FIRST
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_018', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_018";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        cropAndScaleStrategy: image.CropAndScaleStrategy.CROP_FIRST
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap != undefined).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_019
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_019
     * @tc.desc      createPixelMap-isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_019', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_019";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        editable: false
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap.isEditable).assertFalse();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_020
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_020
     * @tc.desc      createPixelMap-isEditable cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_020', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_020";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        editable: true
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap.isEditable).assertTrue();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_021
     * @tc.name      SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_021
     * @tc.desc      createPixelMap-options editable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_021', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_SOURCE_CREATE_PIXEL_MAP_021";
      console.info(TAG, `start：${testName}`);
      await getFd('test.jpg');
      const imageSourceApi = sendableImage.createImageSource(fdNumber);
      let options: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGB_565
      }
      try {
        let pixelMap = await imageSourceApi.createPixelMap(options);
        expect(pixelMap.isStrideAlignment).assertFalse();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PICTURE_TEST_001
     * @tc.name      SUB_IMAGE_CREATE_PICTURE_TEST_001
     * @tc.desc      createPicture-isEditable cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PICTURE_TEST_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PICTURE_TEST_001";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let commodityPixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
        expect(commodityPixelMap.isEditable).assertTrue();
        await commodityPixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PICTURE_TEST_002
     * @tc.name      SUB_IMAGE_CREATE_PICTURE_TEST_002
     * @tc.desc      createPicture-isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PICTURE_TEST_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PICTURE_TEST_002";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
      let commodityPixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
        expect(commodityPixelMap.isEditable).assertFalse();
        await commodityPixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PICTURE_TEST_003
     * @tc.name      SUB_IMAGE_CREATE_PICTURE_TEST_003
     * @tc.desc      createPicture-isStrideAlignment cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PICTURE_TEST_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PICTURE_TEST_003";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
      let commodityPixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
        expect(commodityPixelMap.isStrideAlignment).assertFalse();
        await commodityPixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PICTURE_TEST_004
     * @tc.name      SUB_IMAGE_CREATE_PICTURE_TEST_004
     * @tc.desc      createPixelMap-mainPixelmap cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PICTURE_TEST_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PICTURE_TEST_004";
      console.info(TAG, `start：${testName}`);
      try {
        let pictureObj: image.Picture = image.createPicture(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PICTURE_TEST_005
     * @tc.name      SUB_IMAGE_CREATE_PICTURE_TEST_005
     * @tc.desc      createPixelMap-mainPixelmap cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PICTURE_TEST_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PICTURE_TEST_005";
      console.info(TAG, `start：${testName}`);
      try {
        let pictureObj: image.Picture = image.createPicture(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PICTURE_TEST_006
     * @tc.name      SUB_IMAGE_CREATE_PICTURE_TEST_006
     * @tc.desc      createPixelMap-mainPixelmap cover emptyString
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PICTURE_TEST_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PICTURE_TEST_006";
      console.info(TAG, `start：${testName}`);
      try {
        let pictureObj: image.Picture = image.createPicture(AppStorage.get('emptyString'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_001
     * @tc.name      SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_001
     * @tc.desc      createAlphaPixelmap-isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_001";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
      let PixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
      try {
        let result = await PixelMap.createAlphaPixelmap();
        expect(result.isEditable).assertFalse();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_002
     * @tc.name      SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_002
     * @tc.desc      createAlphaPixelmap-isStrideAlignment cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_002";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let PixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
      try {
        let result = await PixelMap.createAlphaPixelmap();
        expect(result.isStrideAlignment).assertFalse();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_001
     * @tc.desc      createAlphaPixelmapSync-isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_001";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
      let PixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
      try {
        let result = PixelMap.createAlphaPixelmapSync();
        expect(result.isEditable).assertFalse();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_002
     * @tc.name      SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_002
     * @tc.desc      createAlphaPixelmap-isStrideAlignment cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CREATE_ALPHA_PIXEL_MAP_SYNC_002";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let PixelMap: sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
      try {
        let result = await PixelMap.createAlphaPixelmap();
        expect(result.isStrideAlignment).assertFalse();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_001
     * @tc.desc      unmarshalling-isEditable cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_001";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let PixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        let data: rpc.MessageSequence = rpc.MessageSequence.create();
        PixelMap.marshalling(data);
        let result = await PixelMap.unmarshalling(data);
        expect(result.isEditable).assertTrue();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_002
     * @tc.name      SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_002
     * @tc.desc      unmarshalling-isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_002";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
      let PixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        let data: rpc.MessageSequence = rpc.MessageSequence.create();
        PixelMap.marshalling(data);
        let result = await PixelMap.unmarshalling(data);
        expect(result.isEditable).assertFalse();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_003
     * @tc.name      SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_003
     * @tc.desc      unmarshalling-isStrideAlignment cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_UNMARSHALLING_003";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } }
      let PixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      try {
        let data: rpc.MessageSequence = rpc.MessageSequence.create();
        PixelMap.marshalling(data);
        let result = await PixelMap.unmarshalling(data);
        expect(result.isStrideAlignment).assertFalse();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_001
     * @tc.name      SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_001
     * @tc.desc      createPixelMapFromSurface surfaceId cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_001";
      console.info(TAG, `start：${testName}`);
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let PixelMap = await sendableImage.createPixelMapFromSurface(null as ESObject, region);
        expect().assertFail();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_002
     * @tc.name      SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_002
     * @tc.desc      createPixelMapFromSurface surfaceId cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_002";
      console.info(TAG, `start：${testName}`);
      let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
      try {
        let PixelMap = await sendableImage.createPixelMapFromSurface(undefined as ESObject, region);
        expect().assertFail();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_003
     * @tc.name      SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_003
     * @tc.desc      createPixelMapFromSurface region cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_003";
      console.info(TAG, `start：${testName}`);
      let surfaceId = 'surfaceId'
      try {
        let PixelMap = await sendableImage.createPixelMapFromSurface(surfaceId, null as ESObject);
        expect().assertFail();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980105);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_004
     * @tc.name      SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_004
     * @tc.desc      createPixelMapFromSurface region cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PIXEL_MAP_SUPP_004";
      console.info(TAG, `start：${testName}`);
      let surfaceId = 'surfaceId'
      try {
        let PixelMap = await sendableImage.createPixelMapFromSurface(surfaceId, undefined as ESObject);
        expect().assertFail();
        await PixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980105);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PICTURE_FROM_PARCEL_001
     * @tc.name      SUB_IMAGE_CREATE_PICTURE_FROM_PARCEL_001
     * @tc.desc      createPictureFromParcel sequence cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PICTURE_FROM_PARCEL_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PICTURE_FROM_PARCEL_001";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        pictureObj.marshalling(null);
        let res = image.createPictureFromParcel(null);
        await commodityPixelMap?.release();
        done();
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_PICTURE_FROM_PARCEL_002
     * @tc.name      SUB_IMAGE_CREATE_PICTURE_FROM_PARCEL_002
     * @tc.desc      createPictureFromParcel sequence cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_PICTURE_FROM_PARCEL_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_PICTURE_FROM_PARCEL_002";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        pictureObj.marshalling(null);
        let res = image.createPictureFromParcel(undefined);
        expect().assertFail();
        await commodityPixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_001
     * @tc.name      SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_001
     * @tc.desc      convertFromPixelMap pixelmap cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_001";
      console.info(TAG, `start：${testName}`);
      try {
        let sendablePixelMap : sendableImage.PixelMap = sendableImage.convertFromPixelMap(null as ESObject);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980104);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_002
     * @tc.name      SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_002
     * @tc.desc      convertFromPixelMap pixelmap cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_002";
      console.info(TAG, `start：${testName}`);
      try {
        let sendablePixelMap : sendableImage.PixelMap = sendableImage.convertFromPixelMap(undefined as ESObject);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980104);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_001
     * @tc.name      SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_001
     * @tc.desc      convertToPixelMap pixelmap cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_001";
      console.info(TAG, `start：${testName}`);
      try {
        let pixelMap : image.PixelMap = sendableImage.convertToPixelMap(null as ESObject);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980104);
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_002
     * @tc.name      SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_002
     * @tc.desc      convertToPixelMap pixelmap cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_002";
      console.info(TAG, `start：${testName}`);
      try {
        let pixelMap : image.PixelMap = sendableImage.convertToPixelMap(undefined as ESObject);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(62980104);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_GET_METADATA_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_GET_METADATA_001
     * @tc.desc      getMetadata key cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_GET_METADATA_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_GET_METADATA_001";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: true, pixelFormat: 3, size: { height: 4, width: 6 } };
      let PixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
      await PixelMap?.release();
      try {
        let res = PixelMap.getMetadata(undefined);
        console.info(`getMetadata:${res}`);
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_SET_METADATA_001
     * @tc.name      SUB_IMAGE_PIXEL_MAP_SET_METADATA_001
     * @tc.desc      setMetadata value cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_SET_METADATA_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_SET_METADATA_001";
      console.info(TAG, `start：${testName}`);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.DMA;
      let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
      try {
        let result = await pixelMap.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, null);
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PIXEL_MAP_SET_METADATA_002
     * @tc.name      SUB_IMAGE_PIXEL_MAP_SET_METADATA_002
     * @tc.desc      setMetadata value cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PIXEL_MAP_SET_METADATA_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PIXEL_MAP_SET_METADATA_002";
      console.info(TAG, `start：${testName}`);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.DMA;
      let pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
      try {
        let result = await pixelMap.setMetadata(image.HdrMetadataKey.HDR_STATIC_METADATA, undefined);
        expect().assertFail();
        await pixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code).assertUndefined();
        done();
       }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_GET_IMAGE_INFO_001
     * @tc.name      SUB_SENDABLE_IMAGE_GET_IMAGE_INFO_001
     * @tc.desc      getImageInfo cover size density stride pixelFormat alphaType mimeType isHdr
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_GET_IMAGE_INFO_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_GET_IMAGE_INFO_001";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
      let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
      try {
        let res = await sendablePixelMap.getImageInfo();
        console.info(TAG, testName, 'succeed in get imageInfo' , JSON.stringify(res));
        expect(res.size.width).assertEqual(6);
        expect(res.size.height).assertEqual(4);
        expect(res.density).assertEqual(0);
        expect(res.stride).assertEqual(24);
        expect(res.pixelFormat).assertEqual(3);
        expect(res.alphaType).assertEqual(2);
        await sendablePixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_GET_IMAGE_INFO_SYNC_001
     * @tc.name      SUB_SENDABLE_IMAGE_GET_IMAGE_INFO_SYNC_001
     * @tc.desc      getImageInfoSync cover size density stride pixelFormat alphaType mimeType isHdr
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_GET_IMAGE_INFO_SYNC_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_GET_IMAGE_INFO_SYNC_001";
      console.info(TAG, `start：${testName}`);
      const color: ArrayBuffer = new ArrayBuffer(96);
      let opts: image.InitializationOptions = { editable: false, pixelFormat: 3, size: { height: 4, width: 6 } }
      let sendablePixelMap : sendableImage.PixelMap = sendableImage.createPixelMapSync(color, opts);
      try {
        let res = sendablePixelMap.getImageInfoSync();
        console.info(TAG, testName, 'succeed in get imageInfo' , JSON.stringify(res));
        expect(res.size.width).assertEqual(6);
        expect(res.size.height).assertEqual(4);
        expect(res.density).assertEqual(0);
        expect(res.stride).assertEqual(24);
        expect(res.pixelFormat).assertEqual(3);
        expect(res.alphaType).assertEqual(2);
        expect(res.mimeType).assertEqual('');
        expect(res.isHdr).assertFalse();
        await sendablePixelMap?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    IMAGE_AUXILIARY_PICTURE_GET_METADATA_TEST_001
     * @tc.name      IMAGE_AUXILIARY_PICTURE_GET_METADATA_TEST_001
     * @tc.desc      setMetadata cover HEIFS_METADATA
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('IMAGE_AUXILIARY_PICTURE_GET_METADATA_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_AUXILIARY_PICTURE_GET_METADATA_TEST_001';
      let auxBuffer: ArrayBuffer = new ArrayBuffer(10000);
      console.info(TAG,'auxBuffer');
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let pix :image.PixelMap = imageSource.createPixelMapSync();
      console.info(TAG,JSON.stringify(pix));
      let PictureObj: image.Picture = image.createPicture(pix);
      let metadataType: image.MetadataType = image.MetadataType.HEIFS_METADATA;
      try {
        let res = await PictureObj.getMetadata(metadataType);
        expect(metadataType).assertEqual(image.MetadataType.HEIFS_METADATA);
        await PictureObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_001
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_001
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover UNKNOWN
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_001', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_001";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.UNKNOWN
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_002
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_002
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover ARGB_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_002', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_002";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.ARGB_8888
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_003
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_003
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover RGB_565
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_003";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.RGB_565
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_004
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_004
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover RGBA_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_004";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.RGBA_8888
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_005
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_005
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover BGRA_8888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_005', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_005";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.BGRA_8888
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_006
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_006
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover RGB_888
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_006', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_006";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.RGB_888
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_007
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_007
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover ALPHA_8
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_007', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_007";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.ALPHA_8
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_008
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_008
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover RGBA_F16
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_008', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_008";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.RGBA_F16
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_009
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_009
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover NV21
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_009', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_009";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.NV21
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_010
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_010
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover NV12
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_010', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_010";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.NV12
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_011
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_011
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover RGBA_1010102
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_011', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_011";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.RGBA_1010102
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_012
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_012
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover YCBCR_P010
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_012', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_012";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.YCBCR_P010
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_013
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_013
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover YCRCB_P010
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_013', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_013";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.YCRCB_P010
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_014
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_014
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover ASTC_4x4
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_014', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_014";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let opt: image.HdrComposeOptions = {
          desiredPixelFormat: image.PixelMapFormat.ASTC_4x4
        };
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(opt);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_015
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_015
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_015', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_015";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_016
     * @tc.name      SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_016
     * @tc.desc      getHdrComposedPixelmapWithOptions options cover undefined
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_016', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_HDR_COMPOSED_PIXEL_MAP_WITH_OPTIONS_016";
      console.info(TAG, `start：${testName}`);
      let picture = await createPictureSUPP(context);
      try {
        let res: image.PixelMap | undefined = await picture.getHdrComposedPixelmapWithOptions(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect(Number(error.code)).assertEqual(7600201);
        await picture?.release();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_010
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_010
     * @tc.desc      createCroppedAndScaledPixelMap isEditable cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_010', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_010";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        let res = await pixelMapObj.createCroppedAndScaledPixelMap(region, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect(res.isEditable).assertTrue();
        expect(res.isStrideAlignment).assertFalse();
        await pixelMapObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_011
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_011
     * @tc.desc      createCroppedAndScaledPixelMap isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_011', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_011";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        let res = await pixelMapObj.createCroppedAndScaledPixelMap(region, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect(res.isEditable).assertFalse();
        await pixelMapObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_010
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_010
     * @tc.desc      createCroppedAndScaledPixelMapSync isEditable cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_010', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_010";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        let res = pixelMapObj.createCroppedAndScaledPixelMapSync(region, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect(res.isEditable).assertTrue();
        expect(res.isStrideAlignment).assertFalse();
        await pixelMapObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_011
     * @tc.name      SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_011
     * @tc.desc      createCroppedAndScaledPixelMapSync isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_011', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_CREATE_CROPPED_AND_SCALED_PIXEL_MAP_SYNC_011";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapSUPP(context);
      const imageInfo = pixelMapObj.getImageInfoSync();
      const region: image.Region = {
        size: { width: imageInfo.size.width / 2, height: imageInfo.size.height / 2 },
        x: imageInfo.size.width / 4,
        y: imageInfo.size.height / 4
      };
      const scaleX: number = 2.0;
      const scaleY: number = 2.0;
      try {
        let res = pixelMapObj.createCroppedAndScaledPixelMapSync(region, scaleX, scaleY, image.AntiAliasingLevel.HIGH);
        expect(res.isEditable).assertFalse();
        await pixelMapObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_003
     * @tc.name      SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_003
     * @tc.desc      convertFromPixelMap isEditable cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapTest(context);
      try {
        let res : sendableImage.PixelMap = sendableImage.convertFromPixelMap(pixelMapObj);
        expect(res.isEditable).assertTrue();
        expect(res.isStrideAlignment).assertFalse();
        await pixelMapObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_004
     * @tc.name      SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_004
     * @tc.desc      convertFromPixelMap isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CONVERT_FROM_PIXEL_MAP_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createPixelMapSUPP(context);
      try {
        let res : sendableImage.PixelMap = sendableImage.convertFromPixelMap(pixelMapObj);
        expect(res.isEditable).assertFalse();
        await pixelMapObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_003
     * @tc.name      SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_003
     * @tc.desc      convertToPixelMap isEditable cover true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_003";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapTest(context);
      try {
        let res = sendableImage.convertToPixelMap(pixelMapObj);
        expect(res.isEditable).assertTrue();
        expect(res.isStrideAlignment).assertFalse();
        await pixelMapObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_004
     * @tc.name      SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_004
     * @tc.desc      convertToPixelMap isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_SENDABLE_IMAGE_CONVERT_TO_PIXEL_MAP_004";
      console.info(TAG, `start：${testName}`);
      let pixelMapObj = await createSendAblePixelMapSUPP(context);
      try {
        let res = sendableImage.convertToPixelMap(pixelMapObj);
        expect(res.isEditable).assertFalse();
        await pixelMapObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_003
     * @tc.name      SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_003
     * @tc.desc      getMainPixelmap isEditable cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_003', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_003";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        let res = pictureObj.getMainPixelmap();
        expect(res.isEditable).assertFalse();
        await pictureObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_004
     * @tc.name      SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_004
     * @tc.desc      getMainPixelmap isStrideAlignment cover false
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_004', Level.LEVEL1, async (done: Function) => {
      const testName = "SUB_IMAGE_PICTURE_GET_MAIN_PIXEL_MAP_004";
      console.info(TAG, `start：${testName}`);
      let imageSource = await getImageSource('test_exif_v2.jpg');
      let commodityPixelMap: image.PixelMap = await imageSource.createPixelMap();
      let pictureObj: image.Picture = image.createPicture(commodityPixelMap);
      try {
        let res = pictureObj.getMainPixelmap();
        expect(res.isStrideAlignment).assertFalse();
        await pictureObj?.release();
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });
  });
}
