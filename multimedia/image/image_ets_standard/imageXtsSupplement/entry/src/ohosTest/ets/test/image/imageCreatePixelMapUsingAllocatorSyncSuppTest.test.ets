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
import { LOG_TAG } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { JSON } from '@kit.ArkTS';

const TAG = LOG_TAG + 'createPixelMapUsingAllocatorSync ';

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG, 'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

async function createPixelMapUsingAllocatorSyncNOColorsTest(done: Function, testName: string,
  callback: (pixelMap: image.PixelMap) => void,
  param: image.InitializationOptions, allocatorType?: image.AllocatorType | undefined) {
  try {
    console.info(TAG, testName, 'Start');
    let pixelMap: image.PixelMap;
    if (allocatorType == undefined) {
      pixelMap = image.createPixelMapUsingAllocatorSync(param);
    } else {
      pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
    }
    callback(pixelMap);
    console.info(TAG, testName, `Success createPixelMapUsingAllocatorSyncNOColorsTest`, JSON.stringify(pixelMap));
    done();
  } catch (error) {
    console.error(TAG, testName, `Failed createPixelMapUsingAllocatorSyncNOColorsTest`, JSON.stringify(error));
    expect().assertFail();
    done();
  }
}

async function createPixelMapUsingAllocatorSyncNOColorsErrorTest(done: Function, testName: string,
  callback: (errCode: number) => void,
  param: image.InitializationOptions, allocatorType?: image.AllocatorType | undefined) {
  try {
    console.info(TAG, testName, 'Start');
    let pixelMap: image.PixelMap;
    if (allocatorType == undefined) {
      pixelMap = image.createPixelMapUsingAllocatorSync(param);
    } else {
      pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
    }
    console.info(TAG, testName, `Success createPixelMapUsingAllocatorSyncNOColorsErrorTest`, JSON.stringify(pixelMap));
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, testName, `Failed createPixelMapUsingAllocatorSyncNOColorsErrorTest`, JSON.stringify(error),
      error.code);
    callback(error.code);
    done();
  }
}

async function createPixelMapUsingAllocatorSyncColorsTest(done: Function, testName: string,
  callback: (pixelMap: image.PixelMap) => void, colors: ArrayBuffer,
  param: image.InitializationOptions, allocatorType?: image.AllocatorType | undefined) {
  try {
    console.info(TAG, testName, 'Start');
    let pixelMap: image.PixelMap;
    if (allocatorType == undefined) {
      pixelMap = image.createPixelMapUsingAllocatorSync(colors, param);
    } else {
      pixelMap = image.createPixelMapUsingAllocatorSync(colors, param, allocatorType);
    }
    console.info(TAG, testName, `Success createPixelMapUsingAllocatorSyncColorsTest`, JSON.stringify(pixelMap));
    callback(pixelMap);
    done();
  } catch (error) {
    console.error(TAG, testName, `failed createPixelMapUsingAllocatorSyncColorsTest`, JSON.stringify(error),
      error.code);
    expect().assertFail();
    done();
  }
}

async function createPixelMapUsingAllocatorSyncColorsErrorTest(done: Function, testName: string,
  callback: (errCode: number) => void, colors: ArrayBuffer,
  param: image.InitializationOptions, allocatorType?: image.AllocatorType | undefined) {
  try {
    console.info(TAG, testName, 'Start');
    let pixelMap: image.PixelMap;
    if (allocatorType == undefined) {
      pixelMap = image.createPixelMapUsingAllocatorSync(colors, param);
    } else {
      pixelMap = image.createPixelMapUsingAllocatorSync(colors, param, allocatorType);
    }
    console.info(TAG, testName, `Success createPixelMapUsingAllocatorSyncColorsErrorTest`, JSON.stringify(pixelMap));
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, testName, `failed createPixelMapUsingAllocatorSyncColorsErrorTest`, JSON.stringify(error),
      error.code);
    callback(error.code);
    done();
  }
}

async function createPixelMapUsingAllocatorPromiseColorsTest(done: Function, testName: string,
  callback: (pixelMap: image.PixelMap) => void, colors: ArrayBuffer,
  param: image.InitializationOptions, allocatorType?: image.AllocatorType | undefined) {
  image.createPixelMapUsingAllocator(colors, param, allocatorType).then((pixelMap: image.PixelMap) => {
    console.info(TAG, testName, `Success createPixelMapUsingAllocatorPromiseColorsTest `,
      JSON.stringify(pixelMap));
    callback(pixelMap);
    done();
  }).catch((error: BusinessError) => {
    console.error(TAG, testName, `Failed createPixelMapUsingAllocatorPromiseColorsTest`, JSON.stringify(error),
      error.code);
    expect().assertFail();
    done();
  });
}

async function createPixelMapUsingAllocatorSyncColorsErrorTest2(done: Function, testName: string,
  callback: (imageInfo: image.ImageInfo) => void, colors: ArrayBuffer,
  param: image.InitializationOptions, allocatorType?: image.AllocatorType | undefined | null) {
  try {
    console.info(TAG, testName, 'Start');
    let pixelMap: image.PixelMap;
    pixelMap = image.createPixelMapUsingAllocatorSync(colors, param, allocatorType);
    let imageInfo = await pixelMap.getImageInfo();
    console.info(TAG, testName, `Success createPixelMapUsingAllocatorSyncColorsErrorTest`, JSON.stringify(imageInfo));
    callback(imageInfo);
    done();
  } catch (error) {
    console.error(TAG, testName, `failed createPixelMapUsingAllocatorSyncColorsErrorTest`, JSON.stringify(error),
      error.code);
    expect().assertFail();
    done();
  }
}

async function createPixelMapUsingAllocatorSyncNOColorsErrorTest2(done: Function, testName: string,
  callback: (imageInfo: image.ImageInfo) => void,
  param: image.InitializationOptions, allocatorType?: image.AllocatorType | undefined | null) {
  try {
    console.info(TAG, testName, 'Start');
    let pixelMap: image.PixelMap;
    pixelMap = image.createPixelMapUsingAllocatorSync(param, allocatorType);
    let imageInfo = await pixelMap.getImageInfo();
    console.info(TAG, testName, `Success createPixelMapUsingAllocatorSyncNOColorsErrorTest`, JSON.stringify(imageInfo));
    callback(imageInfo);
    done();
  } catch (error) {
    console.error(TAG, testName, `Failed createPixelMapUsingAllocatorSyncNOColorsErrorTest`, JSON.stringify(error),
      error.code);
    expect().assertFail();
    done();
  }
}

export default function imageCreatePixelMapUsingAllocatorSyncSuppTest() {
  describe('imageCreatePixelMapUsingAllocatorSyncSuppTest', () => {

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
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0100
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0100';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0200';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.OPAQUE,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0300';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.PREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0400';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNPREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0500
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0500';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: true,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })


    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0700';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0800
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0800
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0800';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0900
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0900
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_0900';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1000
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1000
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1000';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1100
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1100';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1200';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1300';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1400';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1500
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1500';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1600
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1600
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1600';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_1700';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2000
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2000
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2000';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2100
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2100';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGB_565,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2200';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2300';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGB_888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2400';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2500
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2500';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2600
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2600
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2600';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.NV21,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_2700';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.NV12,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3200';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.CENTER_CROP,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3300';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.DMA;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_3400';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorSyncNOColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0100
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0100';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0200';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.OPAQUE,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.PREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0400';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNPREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0500
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0500';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: true,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0700';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0800
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0800
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0800';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGB_565,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0900
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0900
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_0900';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1000
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1000
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1000';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGB_888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1100
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1100';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1200';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.NV21,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1400';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.NV12,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1900
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1900
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_1900';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.CENTER_CROP,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2000
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2000
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2000';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.DMA;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2100
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2100';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2200';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 2);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2500
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2500';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 8);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2600
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2600
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2600';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 1.5);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2700';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 1.5);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2800
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2800
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_2800';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_3200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_3200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_3200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_3200';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_3300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_3300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_3300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_3300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 3);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0400';
      let maxEnum = getEnumMaxValue(image.PixelMapFormat) + 1;
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: maxEnum,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0500
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0500';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.UNKNOWN - 1,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0600
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0600
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0600';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.UNKNOWN - 1000,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0700';
      let maxEnum = getEnumMaxValue(image.PixelMapFormat) + 1;
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: maxEnum,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0800
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0800
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0800';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN - 1,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0900
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0900
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_0900';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN - 1000,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1300';
      let maxEnum = getEnumMaxValue(image.AllocatorType) + 1;
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = maxEnum;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1400';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO - 1;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1500
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1500';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO - 1000;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0400
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0400';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN - 1,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0500
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0500';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN - 1000,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0600
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0600
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0600';
      let maxEnum = getEnumMaxValue(image.PixelMapFormat) + 1;
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: maxEnum,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0700';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE - 1,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0800
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0800
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0800';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE - 1000,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0900
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0900
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_0900';
      let maxEnum = getEnumMaxValue(image.ScaleMode) + 1;
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        scaleMode: maxEnum,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1000
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1000
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1000';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO - 1;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1100
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1100';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO - 1000;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1200';
      let maxEnum = getEnumMaxValue(image.AllocatorType) + 1;
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = maxEnum;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode == 7600201).assertTrue();
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0100
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0100';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0200
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0200';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.OPAQUE,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0300
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.PREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0400
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0400';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNPREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0500
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0500';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: true,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0700
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0700';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0800
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0800
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0800';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGB_565,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0900
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0900
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_0900';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1000
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1000
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1000';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGB_888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1100
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1100';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1200
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1200';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1300
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.NV21,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1400
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1400
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1400';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.NV12,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1900
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1900
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_1900';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.CENTER_CROP,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2000
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2000
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2000', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2000';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.DMA;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2100
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2100
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2100';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.SHARE_MEMORY;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2200
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2200';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2300
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 2);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2500
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2500
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2500';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 8);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2600
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2600
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2600';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 1.5);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2700
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2700
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2700';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 1.5);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2800
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2800
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2800', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_2800';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_3200
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_3200
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_3200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_3200';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_3300
     * @tc.number SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_3300
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_3300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_COLORS_3300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 3);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorPromiseColorsTest(done, testName, (pixelMap) => {
        expect(pixelMap != undefined).assertTrue()
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1600
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1600
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1600';
      const param: image.InitializationOptions = {
        alphaType: AppStorage.get('testString'),
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest2(done, testName, (imageInfo) => {
        expect(imageInfo.alphaType).assertEqual(2)
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1700
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1700';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: AppStorage.get('testString') as ESObject,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest2(done, testName, (imageInfo) => {
        expect(imageInfo.pixelFormat).assertEqual(3)
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1800
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1800
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1800', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1800';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: AppStorage.get('testString'),
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1900
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1900
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_1900';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: AppStorage.get('testString'),
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest2(done, testName, (imageInfo) => {
        expect(JSON.stringify(imageInfo.size)).assertEqual('{"width":50,"height":50}')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2100
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2100
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2100';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: AppStorage.get('testString') as ESObject
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2200
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2200
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2200';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: AppStorage.get('testNumber') as ESObject
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2300
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2300
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2300';
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, null as ESObject, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2400
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2400
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2400', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2400';
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, undefined as ESObject, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2700
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2700
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2700', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2700';
      const param: image.InitializationOptions = {
        alphaType: null as ESObject,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest2(done, testName, (imageInfo) => {
        expect(imageInfo.alphaType).assertEqual(2)
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2800
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2800
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2800', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_2800';
      const param: image.InitializationOptions = {
        alphaType: undefined,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest2(done, testName, (imageInfo) => {
        expect(imageInfo.alphaType).assertEqual(2)
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3300
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3300
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3300', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3300';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: null as ESObject,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3400
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3400
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3400', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3400';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: undefined,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3500
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3500
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3500', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3500';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: null as ESObject,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest2(done, testName, (imageInfo) => {
        expect(JSON.stringify(imageInfo.size)).assertEqual('{"width":50,"height":50}')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3600
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3600
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3600', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3600';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: undefined,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest2(done, testName, (imageInfo) => {
        expect(JSON.stringify(imageInfo.size)).assertEqual('{"width":50,"height":50}')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3700
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3700
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3700', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3700';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: null as ESObject
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3800
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3800
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3800', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_ERROR_3800';
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: undefined as ESObject
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncNOColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1300
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1300
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1300', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: AppStorage.get('testString'),
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest2(done, testName, (imageInfo) => {
        expect(imageInfo.alphaType).assertEqual(2)
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1600
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1600
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1600', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1600';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNPREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: AppStorage.get('testString'),
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1700
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1700
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1700', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1700';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNPREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: AppStorage.get('testString'),
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest2(done, testName, (imageInfo) => {
        expect(JSON.stringify(imageInfo.size)).assertEqual('{"width":50,"height":50}')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1800
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1800
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1800', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1800';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNPREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: AppStorage.get('testString') as ESObject
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1900
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1900
     * @tc.desc   image_createPixelMapUsingAllocatorSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1900', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_1900';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNPREMUL,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: AppStorage.get('testNumber') as ESObject
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2100
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2100
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2100', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2100';
      const colors: ArrayBuffer = null as ESObject;
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2200
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2200
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2200', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2200';
      const colors: ArrayBuffer = undefined as ESObject;
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2300
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2300
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2300', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, null as ESObject, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2400
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2400
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2400', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2400';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, undefined as ESObject, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2700
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2700
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2700', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2700';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: null as ESObject,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest2(done, testName, (imageInfo) => {
        expect(imageInfo.alphaType).assertEqual(2)
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2800
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2800
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2800', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_2800';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: undefined,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest2(done, testName, (imageInfo) => {
        expect(imageInfo.alphaType).assertEqual(2)
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3300
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3300
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3300', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3300';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: null as ESObject,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3400
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3400
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3400', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3400';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: undefined,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3500
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3500
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3500', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3500';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: null as ESObject,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest2(done, testName, (imageInfo) => {
        expect(JSON.stringify(imageInfo.size)).assertEqual('{"width":50,"height":50}')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3600
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3600
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3600', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3600';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: undefined,
        size: { height: 50, width: 50 }
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest2(done, testName, (imageInfo) => {
        expect(JSON.stringify(imageInfo.size)).assertEqual('{"width":50,"height":50}')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3700
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3700
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3700', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3700';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: null as ESObject
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })

    /**
     * @tc.name   IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3800
     * @tc.number IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3800
     * @tc.desc   image_createPixelMapUsingAllocator
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3800', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATE_PIXEL_MAP_USING_ALLOCATOR_SYNC_COLORS_ERROR_3800';
      const colors: ArrayBuffer = new ArrayBuffer(50 * 50 * 4);
      const param: image.InitializationOptions = {
        alphaType: image.AlphaType.UNKNOWN,
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE,
        size: undefined as ESObject
      };
      const allocatorType = image.AllocatorType.AUTO;
      await createPixelMapUsingAllocatorSyncColorsErrorTest(done, testName, (ErrorCode) => {
        expect(ErrorCode).assertEqual('7600201')
      }, colors, param, allocatorType);
    })
  })
}