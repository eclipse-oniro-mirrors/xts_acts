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

const TAG ='createPixelMapSupp';


async function createPixelMapAbnormalPromiseTest(done: Function, testName: string, color: ESObject, opts: ESObject,callback: (err: number) => void) {
  try {
    let pixelMap = await sendableImage.createPixelMap(color, opts)
    expect(pixelMap == undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    callback(error.code);
  }
}

export default function sendableCreatePixelMap() {
  describe('sendableCreatePixelMap', () => {

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
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0001
     * @tc.number sendableImage_createPixelMap_sendable_promise_0001
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0001';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0002
     * @tc.number sendableImage_createPixelMap_sendable_promise_0002
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0002';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0003
     * @tc.number sendableImage_createPixelMap_sendable_promise_0003
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0003';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0004
     * @tc.number sendableImage_createPixelMap_sendable_promise_0004
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0004';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.OPAQUE,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0005
     * @tc.number sendableImage_createPixelMap_sendable_promise_0005
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0005';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.OPAQUE,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0006
     * @tc.number sendableImage_createPixelMap_sendable_promise_0006
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0006';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0007
     * @tc.number sendableImage_createPixelMap_sendable_promise_0007
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0007';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.UNPREMUL,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0008
     * @tc.number sendableImage_createPixelMap_sendable_promise_0008
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0008';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: false, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0009
     * @tc.number sendableImage_createPixelMap_sendable_promise_0009
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0009';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0010
     * @tc.number sendableImage_createPixelMap_sendable_promise_0010
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0010';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0011
     * @tc.number sendableImage_createPixelMap_sendable_promise_0011
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0011';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0012
     * @tc.number sendableImage_createPixelMap_sendable_promise_0012
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0012';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0013
     * @tc.number sendableImage_createPixelMap_sendable_promise_0013
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0013';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0014
     * @tc.number sendableImage_createPixelMap_sendable_promise_0014
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0014';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0015
     * @tc.number sendableImage_createPixelMap_sendable_promise_0015
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0015';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0016
     * @tc.number sendableImage_createPixelMap_sendable_promise_0016
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0016';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0017
     * @tc.number sendableImage_createPixelMap_sendable_promise_0017
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0017';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0018
     * @tc.number sendableImage_createPixelMap_sendable_promise_0018
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0018';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0019
     * @tc.number sendableImage_createPixelMap_sendable_promise_0019
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0019';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0020
     * @tc.number sendableImage_createPixelMap_sendable_promise_0020
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0020';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0021
     * @tc.number sendableImage_createPixelMap_sendable_promise_0021
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0021', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0021';
      const color: ArrayBuffer = '' as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0022
     * @tc.number sendableImage_createPixelMap_sendable_promise_0022
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0022', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0022';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0023
     * @tc.number sendableImage_createPixelMap_sendable_promise_0023
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0023', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0023';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0024
     * @tc.number sendableImage_createPixelMap_sendable_promise_0024
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0024', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0024';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0025
     * @tc.number sendableImage_createPixelMap_sendable_promise_0025
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0025', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0025';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.OPAQUE,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0026
     * @tc.number sendableImage_createPixelMap_sendable_promise_0026
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0026', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0026';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.OPAQUE,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0027
     * @tc.number sendableImage_createPixelMap_sendable_promise_0027
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0027', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0027';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0028
     * @tc.number sendableImage_createPixelMap_sendable_promise_0028
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0028', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0028';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.UNPREMUL,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0029
     * @tc.number sendableImage_createPixelMap_sendable_promise_0029
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0029', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0029';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: false, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0030
     * @tc.number sendableImage_createPixelMap_sendable_promise_0030
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0030', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0030';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0031
     * @tc.number sendableImage_createPixelMap_sendable_promise_0031
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0031', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0031';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0032
     * @tc.number sendableImage_createPixelMap_sendable_promise_0032
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0032', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0032';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0033
     * @tc.number sendableImage_createPixelMap_sendable_promise_0033
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0033', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0033';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0034
     * @tc.number sendableImage_createPixelMap_sendable_promise_0034
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0034', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0034';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0035
     * @tc.number sendableImage_createPixelMap_sendable_promise_0035
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0035', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0035';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0036
     * @tc.number sendableImage_createPixelMap_sendable_promise_0036
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0036', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0036';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0037
     * @tc.number sendableImage_createPixelMap_sendable_promise_0037
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0037', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0037';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0038
     * @tc.number sendableImage_createPixelMap_sendable_promise_0038
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0038', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0038';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0039
     * @tc.number sendableImage_createPixelMap_sendable_promise_0039
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0039', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0039';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0040
     * @tc.number sendableImage_createPixelMap_sendable_promise_0040
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0040', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0040';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0041
     * @tc.number sendableImage_createPixelMap_sendable_promise_0041
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0041', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0041';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0042
     * @tc.number sendableImage_createPixelMap_sendable_promise_0042
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0042', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0042';
      const color: ArrayBuffer = undefined as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0043
     * @tc.number sendableImage_createPixelMap_sendable_promise_0043
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0043', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0043';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = '' as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0044
     * @tc.number sendableImage_createPixelMap_sendable_promise_0044
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0044', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0044';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = null as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0045
     * @tc.number sendableImage_createPixelMap_sendable_promise_0045
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0045', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0045';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions = undefined as ESObject;
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0046
     * @tc.number sendableImage_createPixelMap_sendable_promise_0046
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0046', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0046';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.OPAQUE,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0047
     * @tc.number sendableImage_createPixelMap_sendable_promise_0047
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0047', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0047';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.OPAQUE,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0048
     * @tc.number sendableImage_createPixelMap_sendable_promise_0048
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0048', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0048';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0049
     * @tc.number sendableImage_createPixelMap_sendable_promise_0049
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0049', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0049';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.UNPREMUL,editable: true, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0050
     * @tc.number sendableImage_createPixelMap_sendable_promise_0050
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0050', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0050';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: false, pixelFormat: image.PixelMapFormat.UNKNOWN, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0051
     * @tc.number sendableImage_createPixelMap_sendable_promise_0051
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0051', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0051';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ARGB_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0052
     * @tc.number sendableImage_createPixelMap_sendable_promise_0052
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0052', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0052';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGB_565, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0053
     * @tc.number sendableImage_createPixelMap_sendable_promise_0053
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0053', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0053';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0054
     * @tc.number sendableImage_createPixelMap_sendable_promise_0054
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0054', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0054';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0055
     * @tc.number sendableImage_createPixelMap_sendable_promise_0055
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0055', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0055';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGB_888, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0056
     * @tc.number sendableImage_createPixelMap_sendable_promise_0056
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0056', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0056';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ALPHA_8, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0057
     * @tc.number sendableImage_createPixelMap_sendable_promise_0057
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0057', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0057';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_F16, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0058
     * @tc.number sendableImage_createPixelMap_sendable_promise_0058
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0058', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0058';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.NV21, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0059
     * @tc.number sendableImage_createPixelMap_sendable_promise_0059
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0059', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0059';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.NV12, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0060
     * @tc.number sendableImage_createPixelMap_sendable_promise_0060
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0060', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0060';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.RGBA_1010102, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0061
     * @tc.number sendableImage_createPixelMap_sendable_promise_0061
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0061', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0061';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.YCBCR_P010, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0062
     * @tc.number sendableImage_createPixelMap_sendable_promise_0062
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0062', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0062';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.YCRCB_P010, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })

    /**
     * @tc.name   sendableImage_createPixelMap_sendable_promise_0063
     * @tc.number sendableImage_createPixelMap_sendable_promise_0063
     * @tc.desc   sendableImage_createPixelMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMap_sendable_promise_0063', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMap_sendable_promise_0063';
      const color: ArrayBuffer = null as ESObject;
      const opts: image.InitializationOptions =
        { alphaType:image.AlphaType.PREMUL,editable: true, pixelFormat: image.PixelMapFormat.ASTC_4x4, size: { height: 4, width: 6 } };
      await createPixelMapAbnormalPromiseTest(done, testName, color, opts,(errCode) => {
        expect().assertFail();
      });
    })



  })
}