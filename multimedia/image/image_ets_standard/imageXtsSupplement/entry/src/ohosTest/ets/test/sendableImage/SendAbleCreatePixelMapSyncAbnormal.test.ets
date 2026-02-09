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

async function createPixelMapSyncAbnormalPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions,callback: (err: number) => void) {
  try {
    let pixelMap = sendableImage.createPixelMapSync(color, opts);
    expect(pixelMap == undefined).assertTrue()
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    callback(error.code);
  }
}


export default function sendableCreatePixelMapSyncAbnormalTest() {
  describe('sendableCreatePixelMapSyncAbnormalTest', () => {

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
     * @tc.number     sendableImage_createPixelMapSync_abnormal_001
     * @tc.name       sendableImage_createPixelMapSync_abnormal_001
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_001';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { editable: false, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_002
     * @tc.name       sendableImage_createPixelMapSync_abnormal_002
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_002';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { editable: true, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_003
     * @tc.name       sendableImage_createPixelMapSync_abnormal_003
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_003';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_004
     * @tc.name       sendableImage_createPixelMapSync_abnormal_004
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_004';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_005
     * @tc.name       sendableImage_createPixelMapSync_abnormal_005
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_005';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_006
     * @tc.name       sendableImage_createPixelMapSync_abnormal_006
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_006';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_007
     * @tc.name       sendableImage_createPixelMapSync_abnormal_007
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_007';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_008
     * @tc.name       sendableImage_createPixelMapSync_abnormal_008
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_008';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_009
     * @tc.name       sendableImage_createPixelMapSync_abnormal_009
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_009';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_010
     * @tc.name       sendableImage_createPixelMapSync_abnormal_010
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_010';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_011
     * @tc.name       sendableImage_createPixelMapSync_abnormal_011
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_011';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.NV21, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_012
     * @tc.name       sendableImage_createPixelMapSync_abnormal_012
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_012';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.NV12, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_013
     * @tc.name       sendableImage_createPixelMapSync_abnormal_013
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_013';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_014
     * @tc.name       sendableImage_createPixelMapSync_abnormal_014
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_014';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_015
     * @tc.name       sendableImage_createPixelMapSync_abnormal_015
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_015';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_016
     * @tc.name       sendableImage_createPixelMapSync_abnormal_016
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_016';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_017
     * @tc.name       sendableImage_createPixelMapSync_abnormal_017
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_017';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { scaleMode: image.ScaleMode.FIT_TARGET_SIZE, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_018
     * @tc.name       sendableImage_createPixelMapSync_abnormal_018
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_018';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { scaleMode: image.ScaleMode.CENTER_CROP, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_019
     * @tc.name       sendableImage_createPixelMapSync_abnormal_019
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_019';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_020
     * @tc.name       sendableImage_createPixelMapSync_abnormal_020
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_020';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_021
     * @tc.name       sendableImage_createPixelMapSync_abnormal_021
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_021';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_022
     * @tc.name       sendableImage_createPixelMapSync_abnormal_022
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_022';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_023
     * @tc.name       sendableImage_createPixelMapSync_abnormal_023
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_023';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_024
     * @tc.name       sendableImage_createPixelMapSync_abnormal_024
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_024';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_025
     * @tc.name       sendableImage_createPixelMapSync_abnormal_025
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_025';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { editable: false, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_026
     * @tc.name       sendableImage_createPixelMapSync_abnormal_026
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_026';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { editable: true, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_027
     * @tc.name       sendableImage_createPixelMapSync_abnormal_027
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_027';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_028
     * @tc.name       sendableImage_createPixelMapSync_abnormal_028
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_028';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_029
     * @tc.name       sendableImage_createPixelMapSync_abnormal_029
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_029';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_030
     * @tc.name       sendableImage_createPixelMapSync_abnormal_030
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_030';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_031
     * @tc.name       sendableImage_createPixelMapSync_abnormal_031
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_031', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_031';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_032
     * @tc.name       sendableImage_createPixelMapSync_abnormal_032
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_032', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_032';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_033
     * @tc.name       sendableImage_createPixelMapSync_abnormal_033
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_033', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_033';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_034
     * @tc.name       sendableImage_createPixelMapSync_abnormal_034
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_034', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_034';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_035
     * @tc.name       sendableImage_createPixelMapSync_abnormal_035
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_035', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_035';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.NV21, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_036
     * @tc.name       sendableImage_createPixelMapSync_abnormal_036
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_036', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_036';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.NV12, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_037
     * @tc.name       sendableImage_createPixelMapSync_abnormal_037
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_037', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_037';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_038
     * @tc.name       sendableImage_createPixelMapSync_abnormal_038
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_038', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_038';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_039
     * @tc.name       sendableImage_createPixelMapSync_abnormal_039
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_039', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_039';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_040
     * @tc.name       sendableImage_createPixelMapSync_abnormal_040
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_040', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_040';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_041
     * @tc.name       sendableImage_createPixelMapSync_abnormal_041
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_041', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_041';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { scaleMode: image.ScaleMode.FIT_TARGET_SIZE, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_042
     * @tc.name       sendableImage_createPixelMapSync_abnormal_042
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_042', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_042';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { scaleMode: image.ScaleMode.CENTER_CROP, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_043
     * @tc.name       sendableImage_createPixelMapSync_abnormal_043
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_043', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_043';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_044
     * @tc.name       sendableImage_createPixelMapSync_abnormal_044
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_044', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_044';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_045
     * @tc.name       sendableImage_createPixelMapSync_abnormal_045
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_045', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_045';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_046
     * @tc.name       sendableImage_createPixelMapSync_abnormal_046
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_046', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_046';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_047
     * @tc.name       sendableImage_createPixelMapSync_abnormal_047
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_047', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_047';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_048
     * @tc.name       sendableImage_createPixelMapSync_abnormal_048
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_048', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_048';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_049
     * @tc.name       sendableImage_createPixelMapSync_abnormal_049
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_049', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_049';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { editable: false, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_050
     * @tc.name       sendableImage_createPixelMapSync_abnormal_050
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_050', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_050';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { editable: true, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_051
     * @tc.name       sendableImage_createPixelMapSync_abnormal_051
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_051', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_051';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_052
     * @tc.name       sendableImage_createPixelMapSync_abnormal_052
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_052', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_052';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_053
     * @tc.name       sendableImage_createPixelMapSync_abnormal_053
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_053', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_053';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_054
     * @tc.name       sendableImage_createPixelMapSync_abnormal_054
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_054', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_054';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_055
     * @tc.name       sendableImage_createPixelMapSync_abnormal_055
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_055', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_055';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_056
     * @tc.name       sendableImage_createPixelMapSync_abnormal_056
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_056', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_056';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_057
     * @tc.name       sendableImage_createPixelMapSync_abnormal_057
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_057', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_057';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_058
     * @tc.name       sendableImage_createPixelMapSync_abnormal_058
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_058', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_058';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_059
     * @tc.name       sendableImage_createPixelMapSync_abnormal_059
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_059', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_059';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.NV21, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_060
     * @tc.name       sendableImage_createPixelMapSync_abnormal_060
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_060', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_060';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.NV12, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_061
     * @tc.name       sendableImage_createPixelMapSync_abnormal_061
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_061', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_061';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_062
     * @tc.name       sendableImage_createPixelMapSync_abnormal_062
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_062', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_062';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_063
     * @tc.name       sendableImage_createPixelMapSync_abnormal_063
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_063', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_063';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_064
     * @tc.name       sendableImage_createPixelMapSync_abnormal_064
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_064', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_064';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_065
     * @tc.name       sendableImage_createPixelMapSync_abnormal_065
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_065', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_065';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { scaleMode: image.ScaleMode.FIT_TARGET_SIZE, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_066
     * @tc.name       sendableImage_createPixelMapSync_abnormal_066
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_066', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_066';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { scaleMode: image.ScaleMode.CENTER_CROP, size: { height: 0, width: 0 } };
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_067
     * @tc.name       sendableImage_createPixelMapSync_abnormal_067
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_067', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_067';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_068
     * @tc.name       sendableImage_createPixelMapSync_abnormal_068
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_068', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_068';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_069
     * @tc.name       sendableImage_createPixelMapSync_abnormal_069
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_069', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_069';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_070
     * @tc.name       sendableImage_createPixelMapSync_abnormal_070
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_070', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_070';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_071
     * @tc.name       sendableImage_createPixelMapSync_abnormal_071
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_071', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_071';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.number     sendableImage_createPixelMapSync_abnormal_072
     * @tc.name       sendableImage_createPixelMapSync_abnormal_072
     * @tc.desc       sendableImage_createPixelMapSync
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('sendableImage_createPixelMapSync_abnormal_072', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapSync_abnormal_072';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapSyncAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })


  })
}