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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';

const TAG = 'createPixelMapSuppTest';

async function createPixelMapPromiseTest(done: Function, testName: string, color: ArrayBuffer, opts: image.InitializationOptions,callback: (err: number) => void) {
  try {
    let pixelMap = await image.createPixelMap(color, opts)
    expect(pixelMap.isEditable).assertEqual(opts.editable);
    done();
  } catch (error) {
    console.info(TAG, testName, `failed; error:`,JSON.stringify(error),error.code);
    expect().assertFail();
    done();
  }
}

async function createPixelMapCallbackTest(done: Function, testName: string, color: ArrayBuffer, opts: image.InitializationOptions,callback: (err: number) => void) {
  try {
    image.createPixelMap(color, opts, (error: BusinessError, pixelMap: image.PixelMap) => {
      if (error) {
        console.error(TAG, testName, `Failed to create pixelmap. code is `,JSON.stringify(error),error.code);
        expect().assertFail()
      } else {
        console.info(TAG, testName, 'Succeeded in creating pixelmap.');
        expect(pixelMap.isEditable).assertEqual(opts.editable);
        done();
      }
    })
  } catch (error) {
    console.info(TAG, testName, `failed; error:`,JSON.stringify(error),error.code);
    expect().assertFail()
    done();
  }
}

export default function ImageCreatePixelMapTest() {
  describe('ImageCreatePixelMapTest', () => {

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
     * @tc.name   createPixelMap_promise_001
     * @tc.number createPixelMap_promise_001
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_002
     * @tc.number createPixelMap_promise_002
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.OPAQUE,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_003
     * @tc.number createPixelMap_promise_003
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_004
     * @tc.number createPixelMap_promise_004
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.UNPREMUL,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_005
     * @tc.number createPixelMap_promise_005
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true,scaleMode : image.ScaleMode.FIT_TARGET_SIZE,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_006
     * @tc.number createPixelMap_promise_006
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true,scaleMode : image.ScaleMode.CENTER_CROP,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_007
     * @tc.number createPixelMap_callback_007
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_008
     * @tc.number createPixelMap_callback_008
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.OPAQUE,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_009
     * @tc.number createPixelMap_callback_009
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_010
     * @tc.number createPixelMap_callback_010
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.UNPREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_011
     * @tc.number createPixelMap_callback_011
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_011';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true,scaleMode : image.ScaleMode.FIT_TARGET_SIZE,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_012
     * @tc.number createPixelMap_callback_012
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_012';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true,scaleMode : image.ScaleMode.CENTER_CROP,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_013
     * @tc.number createPixelMap_promise_013
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_013';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_014
     * @tc.number createPixelMap_promise_014
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.ARGB_8888, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_015
     * @tc.number createPixelMap_promise_015
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.RGB_565, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_016
     * @tc.number createPixelMap_promise_016
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.RGBA_8888, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_017
     * @tc.number IMAGE_CREATE_PIXEL_MAP_017
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_017';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.BGRA_8888, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_018
     * @tc.number createPixelMap_promise_018
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_018';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.RGB_888, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_019
     * @tc.number createPixelMap_promise_019
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_019';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.ALPHA_8, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_020
     * @tc.number createPixelMap_promise_020
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_020';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.RGBA_F16, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_021
     * @tc.number createPixelMap_promise_021
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_021';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.NV21, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_022
     * @tc.number createPixelMap_promise_022
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_022';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.NV12, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_023
     * @tc.number createPixelMap_promise_023
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_023';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.RGBA_1010102, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_025
     * @tc.number createPixelMap_promise_025
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_025';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.YCRCB_P010, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_promise_026
     * @tc.number createPixelMap_promise_026
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_promise_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_promise_026';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat:image.PixelMapFormat.ASTC_4x4, alphaType:image.AlphaType.UNKNOWN,size: { height: 4, width: 6 } };
      await createPixelMapPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })


    /**
     * @tc.name   createPixelMap_callback_027
     * @tc.number createPixelMap_callback_027
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_027';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.UNKNOWN, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_028
     * @tc.number createPixelMap_callback_028
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_028';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.ARGB_8888, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_029
     * @tc.number createPixelMap_callback_029
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_029';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.RGB_565, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_030
     * @tc.number createPixelMap_callback_030
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_030';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_8888, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_031
     * @tc.number createPixelMap_callback_031
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_031';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.BGRA_8888, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_032
     * @tc.number createPixelMap_callback_032
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_032';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.RGB_888, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_033
     * @tc.number createPixelMap_callback_033
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_033';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.ALPHA_8, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_034
     * @tc.number createPixelMap_callback_034
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_034';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_F16, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_035
     * @tc.number createPixelMap_callback_035
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_035';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.NV21, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_036
     * @tc.number createPixelMap_callback_036
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_036', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_036';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.NV12, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_037
     * @tc.number createPixelMap_callback_037
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_037';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.RGBA_1010102, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })


    /**
     * @tc.name   createPixelMap_callback_038
     * @tc.number createPixelMap_callback_038
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_038';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.YCRCB_P010, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   createPixelMap_callback_039
     * @tc.number createPixelMap_callback_039
     * @tc.desc   createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createPixelMap_callback_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMap_callback_039';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, srcPixelFormat: image.PixelMapFormat.ASTC_4x4, alphaType:image.AlphaType.PREMUL,size: { height: 4, width: 6 } };
      await createPixelMapCallbackTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })



  })
}