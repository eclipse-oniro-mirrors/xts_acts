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

const TAG = 'createPixelMapSyncSupp';

async function createPixelMapSyncPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions,callback: (err: number) => void) {
  try {
    let pixelMap = image.createPixelMapSync(color, opts);
    expect(pixelMap.isEditable).assertEqual(opts.editable);
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`,JSON.stringify(error),error.code, testName);
    callback(error.code);
    done();
  }
}

async function createPixelMapSyncOptsPromiseTest(done: Function, testName: string,
  opts: image.InitializationOptions,callback: (err: number) => void) {
  try {
    let pixelMap = image.createPixelMapSync(opts);
    expect(pixelMap.isEditable).assertEqual(opts.editable);
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`,JSON.stringify(error),error.code, testName);
    callback(error.code);
    done();
  }
}

async function createPixelMapSyncAbnormalPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions,callback: (err: number) => void) {
  try {
    let pixelMap = image.createPixelMapSync(color, opts);
    expect(pixelMap == undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error:`,JSON.stringify(error),error.code, testName);
    callback(error.code);
    done();
  }
}



export default function ImageCreatePixelMapSyncTest() {
  describe('ImageCreatePixelMapSyncTest', () => {

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
     * @tc.name   createPixelMapSync_promise_001
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_001
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_002
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_002
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.OPAQUE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_003
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_003
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_004
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_004
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_005
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_005
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_006
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_006
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_007
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_007
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_008
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_008
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_009
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_009
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_010
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_010
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_011
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_011
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_012
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_012
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_013
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_013
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_014
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_014
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_015
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_015
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_016
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_016
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_017
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_017
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_017';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        //srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_018
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_018
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_018';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_019
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_019
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_019';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_020
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_020
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_020';
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, alphaType: image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_021
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_021
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_021';
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, alphaType: image.AlphaType.OPAQUE,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_022
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_022
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_022';
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, alphaType: image.AlphaType.UNPREMUL,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_023
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_023
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_023';
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888,scaleMode: image.ScaleMode.CENTER_CROP,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_024
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_024
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_024';
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888,scaleMode: image.ScaleMode.FIT_TARGET_SIZE,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_025
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_025
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_025';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_026
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_026
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_026';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ARGB_8888,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_027
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_027
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_027';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGB_565,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_028
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_028
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_028';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_8888,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_029
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_029
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_029';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.BGRA_8888,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_030
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_030
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_030';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGB_888,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_031
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_031
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_031';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ALPHA_8,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_032
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_032
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_032';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_F16,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_033
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_033
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_033';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.NV21,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_034
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_034
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_034';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.NV12,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_035
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_035
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_035';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.RGBA_1010102,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_036
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_036
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_036', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_036';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.YCBCR_P010,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_037
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_037
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_037';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.YCRCB_P010,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_option_promise_038
     * @tc.number IMAGE_CREATE_PIXEL_MAP_SYNC_038
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_option_promise_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_option_promise_038';
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat: image.PixelMapFormat.ASTC_4x4,size: { height: 4, width: 6 } };
      await createPixelMapSyncOptsPromiseTest(done, testName, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_039
     * @tc.number createPixelMapSync_promise_039
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_039';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_040
     * @tc.number createPixelMapSync_promise_040
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_040', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_040';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.OPAQUE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_041
     * @tc.number createPixelMapSync_promise_041
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_041', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_041';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_042
     * @tc.number createPixelMapSync_promise_042
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_042', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_042';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_043
     * @tc.number createPixelMapSync_promise_043
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_043', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_043';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_044
     * @tc.number createPixelMapSync_promise_044
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_044', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_044';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_045
     * @tc.number createPixelMapSync_promise_045
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_045', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_045';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_046
     * @tc.number createPixelMapSync_promise_046
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_046', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_046';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_047
     * @tc.number createPixelMapSync_promise_047
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_047', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_047';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_048
     * @tc.number createPixelMapSync_promise_048
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_048', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_048';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_049
     * @tc.number createPixelMapSync_promise_049
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_049', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_049';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_050
     * @tc.number createPixelMapSync_promise_050
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_050', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_050';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_051
     * @tc.number createPixelMapSync_promise_051
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_051', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_051';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_052
     * @tc.number createPixelMapSync_promise_052
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_052', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_052';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_053
     * @tc.number createPixelMapSync_promise_053
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_053', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_053';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_054
     * @tc.number createPixelMapSync_promise_054
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_054', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_054';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_055
     * @tc.number createPixelMapSync_promise_055
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_055', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_055';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        //srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_056
     * @tc.number createPixelMapSync_promise_056
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_056', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_056';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_057
     * @tc.number createPixelMapSync_promise_057
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_057', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_057';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_058
     * @tc.number createPixelMapSync_promise_058
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_058', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_058';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_059
     * @tc.number createPixelMapSync_promise_059
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_059', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_059';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.OPAQUE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_060
     * @tc.number createPixelMapSync_promise_060
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_060', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_060';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_061
     * @tc.number createPixelMapSync_promise_061
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_061', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_061';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_062
     * @tc.number createPixelMapSync_promise_062
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_062', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_062';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_063
     * @tc.number createPixelMapSync_promise_063
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_063', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_063';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_064
     * @tc.number createPixelMapSync_promise_064
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_064', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_064';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_065
     * @tc.number createPixelMapSync_promise_065
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_065', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_065';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_066
     * @tc.number createPixelMapSync_promise_066
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_066', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_066';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_067
     * @tc.number createPixelMapSync_promise_067
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_067', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_067';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_068
     * @tc.number createPixelMapSync_promise_068
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_068', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_068';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_069
     * @tc.number createPixelMapSync_promise_069
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_069', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_069';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_070
     * @tc.number createPixelMapSync_promise_070
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_070', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_070';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_071
     * @tc.number createPixelMapSync_promise_071
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_071', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_071';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_072
     * @tc.number createPixelMapSync_promise_072
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_072', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_072';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_073
     * @tc.number createPixelMapSync_promise_073
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_073', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_073';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_074
     * @tc.number createPixelMapSync_promise_074
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_074', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_074';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        //srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_075
     * @tc.number createPixelMapSync_promise_075
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_075', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_075';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_076
     * @tc.number createPixelMapSync_promise_076
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_076', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_076';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_077
     * @tc.number createPixelMapSync_promise_077
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_077', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_077';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNKNOWN
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_078
     * @tc.number createPixelMapSync_promise_078
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_078', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_078';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.OPAQUE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_079
     * @tc.number createPixelMapSync_promise_079
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_079', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_079';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        alphaType: image.AlphaType.UNPREMUL
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_080
     * @tc.number createPixelMapSync_promise_080
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_080', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_080';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.CENTER_CROP
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_081
     * @tc.number createPixelMapSync_promise_081
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_081', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_081';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_082
     * @tc.number createPixelMapSync_promise_082
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_082', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_082';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.UNKNOWN,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_083
     * @tc.number createPixelMapSync_promise_083
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_083', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_083';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ARGB_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_084
     * @tc.number createPixelMapSync_promise_084
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_084', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_084';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_565,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_085
     * @tc.number createPixelMapSync_promise_085
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_085', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_085';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_086
     * @tc.number createPixelMapSync_promise_086
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_086', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_086';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.BGRA_8888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_087
     * @tc.number createPixelMapSync_promise_087
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_087', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_087';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGB_888,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_088
     * @tc.number createPixelMapSync_promise_088
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_088', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_088';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ALPHA_8,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_089
     * @tc.number createPixelMapSync_promise_089
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_089', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_089';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_F16,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_090
     * @tc.number createPixelMapSync_promise_090
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_090', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_090';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV21,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_091
     * @tc.number createPixelMapSync_promise_091
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_091', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_091';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.NV12,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_092
     * @tc.number createPixelMapSync_promise_092
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_092', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_092';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_093
     * @tc.number createPixelMapSync_promise_093
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_093', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_093';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        //srcPixelFormat: image.PixelMapFormat.YCBCR_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_094
     * @tc.number createPixelMapSync_promise_094
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_094', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_094';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.YCRCB_P010,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMapSync_promise_095
     * @tc.number createPixelMapSync_promise_095
     * @tc.desc   createPixelMapSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMapSync_promise_095', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapSync_promise_095';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = {
        editable: false,
        srcPixelFormat: image.PixelMapFormat.ASTC_4x4,
        size: { height: 4, width: 6 },
        scaleMode: image.ScaleMode.FIT_TARGET_SIZE
      };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })
  })
}