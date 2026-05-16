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

const TAG = 'XtsImageCreatePremultipliedPixelMapTest'
let pixelMap : image.PixelMap
let srcPixelmap : image.PixelMap
let dstPixelMap : image.PixelMap
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

export default function ImageCreatePremultipliedPixelMapTest() {;
  describe('ImageCreatePremultipliedPixelMapTest', () => {
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
     * @tc.name   IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_001
     * @tc.number IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_001
     * @tc.desc   createPremultipliedPixelMap srcPixelmap editable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_001';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap, async (error: BusinessError) => {
          if (error) {
            console.error(TAG,testName,`Failed to convert pixelmap, error code is `,error);
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          } else {
            expect(dstPixelMap.isEditable == true).assertTrue();
            console.info(TAG,testName,'Succeeded in converting pixelmap.');
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_002
     * @tc.number IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_002
     * @tc.desc   createPremultipliedPixelMap srcPixelmap editable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_002';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap, async (error: BusinessError) => {
          if (error) {
            console.error(TAG,testName,`Failed to convert pixelmap, error code is `,error);
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          } else {
            expect(dstPixelMap.isEditable == true).assertTrue();
            console.info(TAG,testName,'Succeeded in converting pixelmap.');
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_003
     * @tc.number IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_003
     * @tc.desc   createPremultipliedPixelMap dstPixelMap editable false PixelMap does not allow modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_003';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap, async (error: BusinessError) => {
          if (error) {
            console.error(TAG,testName,`Failed to convert pixelmap, error code is `,error);
            expect(error).assertEqual(62980248);
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          } else {
            expect().assertFail();
            console.info(TAG,testName,'Succeeded in converting pixelmap.');
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_001
     * @tc.number IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_001
     * @tc.desc   createPremultipliedPixelMap srcPixelmap true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_001';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        await image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(dstPixelMap.isEditable == true).assertTrue();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_002
     * @tc.number IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_002
     * @tc.desc   createPremultipliedPixelMap srcPixelmap false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_002';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        await image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(dstPixelMap.isEditable == true).assertTrue();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_003
     * @tc.number IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_003
     * @tc.desc   createPremultipliedPixelMap dstPixelMap editable false PixelMap does not allow modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_003';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        console.info(TAG,testName,'start in  pixelmap.');
        await image.createPremultipliedPixelMap(srcPixelmap, dstPixelMap);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg,error);
        expect(error).assertEqual(62980248);
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })

    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_001
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_001
     * @tc.desc   createUnpremultipliedPixelMap srcPixelmap editable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_001';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, async (error: BusinessError) => {
          if (error) {
            console.error(TAG,testName,`Failed to convert pixelmap, error code is `,error);
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          } else {
            expect(dstPixelMap.isEditable == true).assertTrue();
            console.info(TAG,testName,'Succeeded in converting pixelmap.');
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_002
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_002
     * @tc.desc   createUnpremultipliedPixelMap srcPixelmap editable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_002';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, async (error: BusinessError) => {
          if (error) {
            console.error(TAG,testName,`Failed to convert pixelmap, error code is `,error);
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          } else {
            expect(dstPixelMap.isEditable == true).assertTrue();
            console.info(TAG,testName,'Succeeded in converting pixelmap.');
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_003
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_003
     * @tc.desc   createUnpremultipliedPixelMap dstPixelMap editable false PixelMap does not allow modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_TEST_003';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, async (error: BusinessError) => {
          if (error) {
            console.error(TAG,testName,`Failed to convert pixelmap, error code is`,error);
            expect(error).assertEqual(62980248);
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          } else {
            expect().assertFail();
            console.info(TAG,testName,'Succeeded in converting pixelmap.');
            await srcPixelmap?.release();
            await dstPixelMap?.release();
            done();
          }
        })
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_001
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_001
     * @tc.desc   createUnpremultipliedPixelMap srcPixelmap editable true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_001';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(dstPixelMap.isEditable == true).assertTrue();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_002
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_002
     * @tc.desc   createUnpremultipliedPixelMap srcPixelmap editable false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_002';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(dstPixelMap.isEditable == true).assertTrue();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail();
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_003
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_003
     * @tc.desc   createUnpremultipliedPixelMap dstPixelMap editable false PixelMap does not allow modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_003';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect(error).assertEqual(62980248);
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_004
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_004
     * @tc.desc   createUnpremultipliedPixelMap srcPixelmap null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_004';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        let res = image.createUnpremultipliedPixelMap(null, dstPixelMap);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(res).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail()
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_005
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_005
     * @tc.desc   createUnpremultipliedPixelMap srcPixelmap undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_005';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        let res = image.createUnpremultipliedPixelMap(undefined, dstPixelMap);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(res).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail()
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_006
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_006
     * @tc.desc   createUnpremultipliedPixelMap dstPixelMap null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_006';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        let res = image.createUnpremultipliedPixelMap(srcPixelmap, null);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(res).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail()
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_007
     * @tc.number IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_007
     * @tc.desc   createUnpremultipliedPixelMap dstPixelMap undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_TEST_007';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        let res = image.createUnpremultipliedPixelMap(srcPixelmap, undefined);
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(res).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail()
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_004
     * @tc.number IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_004
     * @tc.desc   createPremultipliedPixelMap dstPixelMap null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_004';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        let res = image.createPremultipliedPixelMap(srcPixelmap, null)
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(res).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail()
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
    /**
     * @tc.name   IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_005
     * @tc.number IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_005
     * @tc.desc   createPremultipliedPixelMap dstPixelMap undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PREMULTIPLIED_PIXELMAP_TEST_005';
      try {
        const color: ArrayBuffer = new ArrayBuffer(16);
        let bufferArr = new Uint8Array(color);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 255;
          bufferArr[i+1] = 255;
          bufferArr[i+2] = 122;
          bufferArr[i+3] = 122;
        }
        let optsForUnpre: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.UNPREMUL
        }
        let srcPixelmap = image.createPixelMapSync(color, optsForUnpre);
        let optsForPre: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 2, width: 2 },
          alphaType: image.AlphaType.PREMUL
        }
        let dstPixelMap = image.createPixelMapSync(optsForPre);
        let res = image.createPremultipliedPixelMap(srcPixelmap, undefined)
        console.info(TAG,testName,'Succeeded in converting pixelmap.');
        expect(res).assertUndefined();
      } catch (error) {
        console.error(TAG, testName, "create failed:", error.code, error.msg);
        expect().assertFail()
      } finally {
        await srcPixelmap?.release();
        await dstPixelMap?.release();
        done();
      }
    })
  })
}