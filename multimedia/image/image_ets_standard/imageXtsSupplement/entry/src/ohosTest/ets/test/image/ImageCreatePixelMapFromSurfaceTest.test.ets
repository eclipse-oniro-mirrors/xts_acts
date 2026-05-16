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
import { rpc } from '@kit.IPCKit';

let pixelMap : image.PixelMap
let srcPixelmap : image.PixelMap
let dstPixelMap : image.PixelMap
let fdNumber: number;
let img: image.Image;
let imageReceiver: image.ImageReceiver
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
const TAG = 'xtsCreatePixelMapFromSurfaceTest'
class MySequence implements rpc.Parcelable {
  pixel_map: image.PixelMap;
  constructor(conPixelmap: image.PixelMap) {
    this.pixel_map = conPixelmap;
  }
  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }
  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      this.pixel_map = image.createPixelMapFromParcel(messageSequence);
    } catch(e) {
      let error = e as BusinessError;
      console.error(`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      return false;
    }
    return true;
  }
}

export default function ImageCreatePixelMapFromSurfaceTest() {
  describe('ImageCreatePixelMapFromSurfaceTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      AppStorage.setOrCreate('empty', '')
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
      AppStorage.delete('empty')
    });

    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_001
     * @tc.number IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_001
     * @tc.desc   createPixelMapFromSurfaceWithTransformation null INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_001';
      try {
        console.info(TAG,testName,"start :");
        pixelMap = await image.createPixelMapFromSurfaceWithTransformation(null, true);
        console.info(TAG, testName, "res :", pixelMap);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(error).assertEqual(7600206)
      }
      pixelMap?.release();
      done();
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_002
     * @tc.number IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_002
     * @tc.desc   createPixelMapFromSurfaceWithTransformation undefined INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_002';
      try {
        console.info(TAG,testName,"start :");
        pixelMap = await image.createPixelMapFromSurfaceWithTransformation(undefined, false);
        console.info(TAG, testName, "res :", pixelMap);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(error).assertEqual(7600206)
      }
      pixelMap?.release();
      done();
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_003
     * @tc.number IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_003
     * @tc.desc   createPixelMapFromSurfaceWithTransformation "" INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_003';
      try {
        console.info(TAG,testName,"start :");
        pixelMap = await image.createPixelMapFromSurfaceWithTransformation("", true);
        console.info(TAG, testName, "res :", pixelMap);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(error).assertEqual(7600206)
      }
      pixelMap?.release();
      done();
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_001
     * @tc.number IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_001
     * @tc.desc   createPixelMapFromSurfaceWithTransformationSync null INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_001';
      try {
        console.info(TAG,testName,"start :");
        pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(null, true);
        console.info(TAG, testName, "res :", pixelMap);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(Number(error.code)).assertEqual(7600206)
      }
      pixelMap?.release();
      done();
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_002
     * @tc.number IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_002
     * @tc.desc   createPixelMapFromSurfaceWithTransformationSync undefined INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_002';
      try {
        console.info(TAG,testName,"start :");
        pixelMap = image.createPixelMapFromSurfaceWithTransformationSync(undefined, false);
        console.info(TAG, testName, "res :", pixelMap);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(Number(error.code)).assertEqual(7600206)
      }
      pixelMap?.release();
      done();
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_003
     * @tc.number IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_003
     * @tc.desc   createPixelMapFromSurfaceWithTransformationSync "" INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_FROM_SURFACE_WITH_TRANSFORMATION_SYNC_003';
      try {

        console.info(TAG,testName,"start :");
        pixelMap = image.createPixelMapFromSurfaceWithTransformationSync("", true);
        console.info(TAG, testName, "res :", pixelMap);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect(Number(error.code)).assertEqual(7600206)
      }
      pixelMap?.release();
      done();
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_FROM_PARCEL_TEST_001
     * @tc.number IMAGE_CREATE_PIXELMAP_FROM_PARCEL_TEST_001
     * @tc.desc   createPixelMapFromParcel isEditable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_FROM_PARCEL_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_FROM_PARCEL_TEST_001';
      let pixelMap: image.PixelMap | undefined = undefined;
      let newPixelmap: image.PixelMap | undefined = undefined;
      try {
        console.info(TAG,testName,"start :");
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        }
        pixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,testName,"pixelMap :",pixelMap);
        let data: rpc.MessageSequence = rpc.MessageSequence.create();
        pixelMap.marshalling(data);
        console.info(TAG, 'PixelMap serialized to MessageSequence successfully');
        newPixelmap = image.createPixelMapFromParcel(data);
        console.info(TAG, 'PixelMap deserialized from MessageSequence successfully');
        expect(newPixelmap.isEditable == true).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect().assertFail();
      }
      newPixelmap?.release();
      pixelMap?.release();
      done();
    })
    /**
     * @tc.name   IMAGE_CREATE_PIXELMAP_FROM_PARCEL_TEST_002
     * @tc.number IMAGE_CREATE_PIXELMAP_FROM_PARCEL_TEST_002
     * @tc.desc   createPixelMapFromParcel isEditable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXELMAP_FROM_PARCEL_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXELMAP_FROM_PARCEL_TEST_002';
      let pixelMap: image.PixelMap | undefined = undefined;
      let newPixelmap: image.PixelMap | undefined = undefined;
      try {
        console.info(TAG,testName,"start :");
        const color: ArrayBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.ARGB_8888,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        }
        pixelMap = await image.createPixelMap(color, opts);
        console.info(TAG,testName,"pixelMap :",pixelMap);
        let data: rpc.MessageSequence = rpc.MessageSequence.create();
        pixelMap.marshalling(data);
        console.info(TAG, 'PixelMap serialized to MessageSequence successfully');
        newPixelmap = image.createPixelMapFromParcel(data);
        console.info(TAG, 'PixelMap deserialized from MessageSequence successfully');
        expect(newPixelmap.isEditable == false).assertTrue();
      } catch (error) {
        console.error(TAG, testName, `failed; error: `,error,error.code);
        expect().assertFail();
      }
      newPixelmap?.release();
      pixelMap?.release();
      done();
    })
  })
}