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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

const TAG = 'xts.CreateUnpremultipliedPixelMapSuppTest';

async function createUnpremultipliedPixelMapPromiseTest(done: Function, testName: string,
  pixelFormatPre: image.PixelMapFormat, pixelFormatUnpre: image.PixelMapFormat,
  callback: (errCode: BusinessError) => void) {
  try {
    let color = new ArrayBuffer(16);
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let optsForPre: image.InitializationOptions = {
      editable: true,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.PREMUL
    };
    let optsForUnpre: image.InitializationOptions = {
      editable: true,
      pixelFormat: pixelFormatUnpre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.UNPREMUL
    };
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG, testName, JSON.stringify(srcPixelmap));
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG, testName, JSON.stringify(dstPixelMap));
    await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap)
    console.info(TAG, testName, ' Succeeded in converting pixelmap.');
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, testName, ` Failed to convert pixelmap, error code is`,
      JSON.stringify(error), error.code);
    callback(error);
    done();
  }
}

async function createUnpremultipliedPixelMapPromiseTest1(done: Function, testName: string,
  pixelFormatPre: image.PixelMapFormat, pixelFormatUnpre: image.PixelMapFormat,
  callback: (errCode: BusinessError) => void) {
  try {
    let color = new ArrayBuffer(16);
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let optsForPre: image.InitializationOptions = {
      editable: false,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.PREMUL
    };
    let optsForUnpre: image.InitializationOptions = {
      editable: false,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.UNPREMUL
    };
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG, testName, JSON.stringify(srcPixelmap));
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG, testName, JSON.stringify(dstPixelMap));
    await image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap)
    console.info(TAG, testName, ' Succeeded in converting pixelmap.');
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, testName, ` Failed to convert pixelmap, error code is`,
      JSON.stringify(error), error.code);
    callback(error);
    done();
  }
}

async function createUnpremultipliedPixelMapCallbackTest(done: Function, testName: string,
  pixelFormatPre: image.PixelMapFormat, pixelFormatUnpre: image.PixelMapFormat,
  callback: (err: BusinessError) => void) {
  try {
    let color = new ArrayBuffer(16);
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let optsForPre: image.InitializationOptions = {
      editable: true,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.PREMUL
    };
    let optsForUnpre: image.InitializationOptions = {
      editable: true,
      pixelFormat: pixelFormatUnpre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.UNPREMUL
    };
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG, testName, JSON.stringify(srcPixelmap));
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG, testName, JSON.stringify(dstPixelMap));
    image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
      if (error) {
        console.error(TAG, testName, ` Failed to convert pixelmap, error code is`,
          JSON.stringify(error), error.code);
        callback(error);
        done();
      } else {
        console.info(TAG, testName, ' Succeeded in converting pixelmap.');
        expect().assertFail();
        done();
      }
    })
  } catch (error) {
    console.error(TAG, testName, ` Test failed `, JSON.stringify(error), error.code);
    expect().assertFail();
    done();
  }
}

async function createUnpremultipliedPixelMapCallbackTest1(done: Function, testName: string,
  pixelFormatPre: image.PixelMapFormat, pixelFormatUnpre: image.PixelMapFormat,
  callback: (err: BusinessError) => void) {
  try {
    let color = new ArrayBuffer(16);
    let bufferArr = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i += 4) {
      bufferArr[i] = 255;
      bufferArr[i+1] = 255;
      bufferArr[i+2] = 122;
      bufferArr[i+3] = 122;
    }
    let optsForPre: image.InitializationOptions = {
      editable: false,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.PREMUL
    };
    let optsForUnpre: image.InitializationOptions = {
      editable: false,
      pixelFormat: pixelFormatPre,
      size: { height: 2, width: 2 },
      alphaType: image.AlphaType.UNPREMUL
    };
    let srcPixelmap = await image.createPixelMapSync(color, optsForPre);
    console.info(TAG, testName, JSON.stringify(srcPixelmap));
    let dstPixelMap = await image.createPixelMapSync(optsForUnpre);
    console.info(TAG, testName, JSON.stringify(dstPixelMap));
    image.createUnpremultipliedPixelMap(srcPixelmap, dstPixelMap, (error: BusinessError) => {
      if (error) {
        console.error(TAG, testName, ` Failed to convert pixelmap, error code is`,
          JSON.stringify(error), error.code);
        callback(error);
        done();
      } else {
        console.info(TAG, testName, ' Succeeded in converting pixelmap.');
        expect().assertFail();
        done();
      }
    })
  } catch (error) {
    console.error(TAG, testName, ` Test failed `, JSON.stringify(error), error.code);
    expect().assertFail();
    done();
  }
}

export default function createUnpremultipliedPixelMapSyncTest() {
  describe('createUnpremultipliedPixelMapSyncTest', () => {
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
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_0900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_2800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_3800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_4900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_5900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_6900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_7900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_8900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_9900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_10000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_10000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_10000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_10000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1010
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1010
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1010';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1020
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1020
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1020';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1030
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1030
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1030';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1040
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1040
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1040';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1060
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1060
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1060';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1080
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1080
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1080', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1080';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1090
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1090
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1090', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1090';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_11000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_11000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_11000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_11000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_11100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_11100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_11100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_11100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1120
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1120
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1120', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1120';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1130
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1130
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1130', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1130';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1140
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1140
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1140', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1140';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1150
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1150
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1150', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1150';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1160
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1160
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1160', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1160';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_0900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_2800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_3800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_4900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_5900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_6900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_7900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_8900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9200
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9200
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9200';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9300
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9300
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9300';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9400
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9400
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9400';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9500
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9500
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9500';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9600
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9600
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9600';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9700
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9700
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9700';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9800
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9800
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9800';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9900
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9900
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_9900';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_10000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_10000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_10000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_10000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1010
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1010
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1010';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1020
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1020
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1020';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1030
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1030
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1030', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1030';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1040
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1040
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1040', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1040';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1060
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1060
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1060', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1060';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1080
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1080
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1080', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1080';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1090
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1090
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1090', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1090';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_11000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_11000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_11000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_11000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_11100
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_11100
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_11100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_11100';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1120
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1120
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1120', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1120';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1130
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1130
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1130', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1130';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1140
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1140
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1140', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1140';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.RGBA_1010102;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980103);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1150
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1150
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1150', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1150';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCBCR_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1160
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1160
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1160', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1160';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(401);
        });
    })


    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1170
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1170
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1170', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1170';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1180
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1180
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1180', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1180';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1190
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1190
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1190', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1190';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_12000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_12000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_12000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_12000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1210
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1210
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1210', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1210';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1220
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1220
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1220', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1220';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1230
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1230
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1230', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1230';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1240
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1240
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1240', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1240';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1250
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1250
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1250', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1250';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1260
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1260
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1260', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1260';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1270
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1270
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1270', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_PROMISE_1270';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapPromiseTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1170
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1170
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1170', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1170';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.UNKNOWN;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1180
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1180
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1180', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1180';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ARGB_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1190
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1190
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1190', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1190';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_565;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_12000
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_12000
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_12000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_12000';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1210
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1210
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1210', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1210';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.BGRA_8888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1220
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1220
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1220', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1220';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGB_888;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1230
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1230
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1230', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1230';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ALPHA_8;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1240
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1240
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1240', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1240';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.RGBA_F16;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1250
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1250
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1250', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1250';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV21;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1260
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1260
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1260', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1260';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.NV12;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })

    /**
     * @tc.number   SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1270
     * @tc.name     SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1270
     * @tc.desc     image_createUnPremultipliedPixelMap
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1270', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_UN_PREMULTIPLIED_PIXELMAP_1270';
      let pixelFormatPre: image.PixelMapFormat = image.PixelMapFormat.ASTC_4x4;
      let pixelFormatUnpre: image.PixelMapFormat = image.PixelMapFormat.YCRCB_P010;
      await createUnpremultipliedPixelMapCallbackTest1(done, testName, pixelFormatPre, pixelFormatUnpre,
        (error: BusinessError) => {
          expect(error).assertEqual(62980248);
        });
    })
  })
}