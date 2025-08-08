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
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createPixelMapSync';

async function createPixelMapSyncPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let pixelMap = image.createPixelMapSync(color, opts);
    expect(pixelMap.isEditable === opts.editable).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPixelMapSyncOptsPromiseTest(done: Function, testName: string,
  opts: image.InitializationOptions) {
  try {
    let pixelMap = await image.createPixelMapSync(opts);
    expect(pixelMap.isEditable === opts.editable).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function createPixelMapSyncTest() {
  describe('createPixelMapSyncTest', () => {

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
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_001
     * @tc.name      : createPixelMapSync_promise_001
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 }
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_002
     * @tc.name      : createPixelMapSync_promise_002
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_003
     * @tc.name      : createPixelMapSync_promise_003
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })


    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_004
     * @tc.name      : createPixelMapSync_promise_004
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_005
     * @tc.name      : createPixelMapSync_promise_005
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_006
     * @tc.name      : createPixelMapSync_promise_006
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_007
     * @tc.name      : createPixelMapSync_promise_007
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_008
     * @tc.name      : createPixelMapSync_promise_008
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_009
     * @tc.name      : createPixelMapSync_promise_009
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_010
     * @tc.name      : createPixelMapSync_promise_010
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_011
     * @tc.name      : createPixelMapSync_promise_011
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_012
     * @tc.name      : createPixelMapSync_promise_012
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createPixelMapSync_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_013
     * @tc.name      : createPixelMapSync_promise_013
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createPixelMapSync_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
          editable: false,
          pixelFormat: image.PixelMapFormat.YCBCR_P010,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_014
     * @tc.name      : createPixelMapSync_promise_014
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('createPixelMapSync_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =  {
          editable: false,
          pixelFormat: image.PixelMapFormat.YCRCB_P010,
          size: { height: 4, width: 6 },
          alphaType: image.AlphaType.PREMUL
        };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })*/

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_015
     * @tc.name      : createPixelMapSync_promise_015
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts);
    })
    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_016
     * @tc.name      : createPixelMapSync_option_promise_001
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_001';
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_017
     * @tc.name      : createPixelMapSync_option_promise_002
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_002';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_018
     * @tc.name      : createPixelMapSync_option_promise_003
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_003';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_019
     * @tc.name      : createPixelMapSync_option_promise_004
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_004';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_020
     * @tc.name      : createPixelMapSync_option_promise_005
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_005';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_021
     * @tc.name      : createPixelMapSync_option_promise_006
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_006';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_022
     * @tc.name      : createPixelMapSync_option_promise_007
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_007';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_023
     * @tc.name      : createPixelMapSync_option_promise_008
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_008';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_024
     * @tc.name      : createPixelMapSync_option_promise_009
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_009';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_025
     * @tc.name      : createPixelMapSync_option_promise_010
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_010';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_026
     * @tc.name      : createPixelMapSync_option_promise_011
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_011';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_027
     * @tc.name      : createPixelMapSync_option_promise_012
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_012';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_028
     * @tc.name      : createPixelMapSync_option_promise_013
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_013';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_029
     * @tc.name      : createPixelMapSync_option_promise_014
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_014';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })

    /**
     * @tc.number    : IMAGE_CREATE_PIXEL_MAP_SYNC_030
     * @tc.name      : createPixelMapSync_option_promise_015
     * @tc.desc      : createPixelMapSync
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapSync_option_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_015';
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.PREMUL
      };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts);
    })
  })
}