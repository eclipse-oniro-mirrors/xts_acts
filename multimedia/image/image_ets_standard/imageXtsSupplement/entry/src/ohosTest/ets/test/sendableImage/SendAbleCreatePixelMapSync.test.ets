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

import { sendableImage } from '@kit.ImageKit';
import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';


const TAG = 'createPixelMapSync';

async function createPixelMapSyncPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions,callback: (err: number) => void) {
  try {
    let pixelMap = sendableImage.createPixelMapSync(color, opts);
    if (pixelMap !== undefined) {
      expect(pixelMap.isEditable === opts.editable).assertTrue();
      done();
    } else {
      console.info(TAG, `failed; error: pixelMap is undefined`, JSON.stringify(pixelMap), testName);
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    callback(error.code);
    done();
  }
}


export default function sendableCreatePixelMapSyncTest() {
  describe('sendableCreatePixelMapSyncTest', () => {

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
     * @tc.number     sendableImage_createPixelMapSync_001
     * @tc.name       sendableImage_createPixelMapSync_001
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_002
     * @tc.name       sendableImage_createPixelMapSync_002
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_002';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_003
     * @tc.name       sendableImage_createPixelMapSync_003
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_004
     * @tc.name       sendableImage_createPixelMapSync_004
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_004';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_005
     * @tc.name       sendableImage_createPixelMapSync_005
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_005';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_006
     * @tc.name       sendableImage_createPixelMapSync_006
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_006';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_007
     * @tc.name       sendableImage_createPixelMapSync_007
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_007';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_008
     * @tc.name       sendableImage_createPixelMapSync_008
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_008';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_009
     * @tc.name       sendableImage_createPixelMapSync_009
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_009';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV21, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_010
     * @tc.name       sendableImage_createPixelMapSync_010
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_010';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.NV12, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_014
     * @tc.name       sendableImage_createPixelMapSync_014
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_014';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_015
     * @tc.name       sendableImage_createPixelMapSync_015
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_015';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, alphaType : image.AlphaType.UNKNOWN, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_016
     * @tc.name       sendableImage_createPixelMapSync_016
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_016';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, alphaType : image.AlphaType.OPAQUE, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_017
     * @tc.name       sendableImage_createPixelMapSync_017
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_017';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, alphaType : image.AlphaType.PREMUL, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_018
     * @tc.name       sendableImage_createPixelMapSync_018
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_018';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, alphaType : image.AlphaType.UNPREMUL, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_019
     * @tc.name       sendableImage_createPixelMapSync_019
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_019';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.UNKNOWN, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_020
     * @tc.name       sendableImage_createPixelMapSync_020
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_020';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.ARGB_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_021
     * @tc.name       sendableImage_createPixelMapSync_021
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_021';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.RGB_565, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_022
     * @tc.name       sendableImage_createPixelMapSync_022
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_022';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.RGBA_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_023
     * @tc.name       sendableImage_createPixelMapSync_023
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_023';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.BGRA_8888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_024
     * @tc.name       sendableImage_createPixelMapSync_024
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_024';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.RGB_888, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_025
     * @tc.name       sendableImage_createPixelMapSync_025
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_025';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.ALPHA_8, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_026
     * @tc.name       sendableImage_createPixelMapSync_026
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_026';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.RGBA_F16, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_027
     * @tc.name       sendableImage_createPixelMapSync_027
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_027';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.NV21, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_028
     * @tc.name       sendableImage_createPixelMapSync_028
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_028';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.NV12, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_029
     * @tc.name       sendableImage_createPixelMapSync_029
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_029';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.RGBA_1010102, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_031
     * @tc.name       sendableImage_createPixelMapSync_031
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_031';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.YCRCB_P010, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_032
     * @tc.name       sendableImage_createPixelMapSync_032
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_032';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, srcPixelFormat : image.PixelMapFormat.ASTC_4x4, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_033
     * @tc.name       sendableImage_createPixelMapSync_033
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_033';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, scaleMode : image.ScaleMode.FIT_TARGET_SIZE, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_034
     * @tc.name       sendableImage_createPixelMapSync_034
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_034';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, scaleMode : image.ScaleMode.CENTER_CROP, size: { height: 6, width: 4 } };
      await createPixelMapSyncPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })


  })
}