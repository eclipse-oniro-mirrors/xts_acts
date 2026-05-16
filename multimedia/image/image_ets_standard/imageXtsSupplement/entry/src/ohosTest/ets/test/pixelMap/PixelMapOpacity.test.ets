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

const TAG = LOG_TAG + 'opacity';

async function opacityPromiseTest(done: Function, testName: string, opts: image.InitializationOptions, rate: number,
  callback: (data: boolean) => void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    console.info(TAG, `createPixelMapSync`, testName);
    if (pixelMap != undefined) {
      await pixelMap.opacity(rate);
      callback(true);
    } else {
      console.info(TAG, testName, `create PixelMap failed`);
      callback(false);
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function opacityPromiseAbnormalTest(done: Function, testName: string, opts: image.InitializationOptions,
  rate: number, errorCallback: (data: number) => void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    if (pixelMap != undefined) {
      console.info(TAG, `createPixelMapSync`, testName);
      await pixelMap.opacity(rate);
    } else {
      console.info(TAG, testName, `create PixelMap failed`);
    }
    expect().assertFail();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    errorCallback(error);
    done();
  }
}

async function opacityCallbackTest(done: Function, testName: string, opts: image.InitializationOptions, rate: number,
  callback: (data: boolean) => void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    console.info(TAG, `createPixelMapSync`, testName);
    if (pixelMap != undefined) {
      pixelMap.opacity(rate, (err: BusinessError<void>) => {
        if (err) {
          console.error(`Failed to set opacity. code is ${err.code}, message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info("Succeeded in setting opacity.");
          callback(true);
        }
      });
    } else {
      console.info(TAG, testName, `create PixelMap failed`);
      callback(false);
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function opacityCallbackAbnormalTest(done: Function, testName: string, opts: image.InitializationOptions,
  rate: number, errorCallback: (data: string) => void) {
  try {
    const color: ArrayBuffer =
      new ArrayBuffer(opts.size.height * opts.size.height * 4);
    let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
    if (pixelMap != undefined) {
      pixelMap.opacity(rate, (err: BusinessError<void>) => {
        if (err) {
          console.error(TAG, testName, `Failed to set opacity. err is ${err}, message is ${err.message}`);
          errorCallback(JSON.stringify(err));
        } else {
          console.info(TAG, testName, "Succeeded in setting opacity.");
          expect().assertFail();
        }
      });
    } else {
      console.info(TAG, testName, `create PixelMap failed`);
      expect().assertFail();
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    errorCallback(JSON.stringify(error));
    done();
  }
}

export default function pixelMapOpacityTest() {
  describe('pixelMapOpacityTest', () => {

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
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0001
     * @tc.number SUB_MEDIA_SUB_MEDIA_0001
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0001';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.1;
      await opacityPromiseTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0002
     * @tc.number SUB_MEDIA_SUB_MEDIA_0002
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0002';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.0000001;
      await opacityPromiseTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0003
     * @tc.number SUB_MEDIA_SUB_MEDIA_0003
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0003';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 1;
      await opacityPromiseTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0004
     * @tc.number SUB_MEDIA_SUB_MEDIA_0004
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0004';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 10;
      await opacityPromiseAbnormalTest(done, testName, opts, rate, (data: number) => {
        expect(data).assertEqual(62980115);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0005
     * @tc.number SUB_MEDIA_SUB_MEDIA_0005
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0005', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0005';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = -1;
      await opacityPromiseAbnormalTest(done, testName, opts, rate, (data: number) => {
        expect(data).assertEqual(62980115);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0006
     * @tc.number SUB_MEDIA_SUB_MEDIA_0006
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0006', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0006';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = NaN;
      await opacityPromiseTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0007
     * @tc.number SUB_MEDIA_SUB_MEDIA_0007
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0007', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0007';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = null as ESObject;
      await opacityPromiseAbnormalTest(done, testName, opts, rate, (data: number) => {
        expect(data).assertEqual(62980115);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0008
     * @tc.number SUB_MEDIA_SUB_MEDIA_0008
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0008', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0008';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = undefined as ESObject;
      await opacityPromiseAbnormalTest(done, testName, opts, rate, (data: number) => {
        expect(data).assertEqual(62980115);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0009
     * @tc.number SUB_MEDIA_SUB_MEDIA_0009
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0009', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0009';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      AppStorage.setOrCreate('key', '1');
      let rate: number = AppStorage.get('key') as ESObject;
      await opacityPromiseAbnormalTest(done, testName, opts, rate, (data: number) => {
        expect(data).assertEqual(62980115);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0010
     * @tc.number SUB_MEDIA_SUB_MEDIA_0010
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0010';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      AppStorage.setOrCreate('key', []);
      let rate: number = AppStorage.get('key') as ESObject;
      await opacityPromiseAbnormalTest(done, testName, opts, rate, (data: number) => {
        expect(data).assertEqual(62980115);
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0011
     * @tc.number SUB_MEDIA_SUB_MEDIA_0011
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0011';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.1;
      await opacityCallbackTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0012
     * @tc.number SUB_MEDIA_SUB_MEDIA_0012
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0012';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 0.0000001;
      await opacityCallbackTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0013
     * @tc.number SUB_MEDIA_SUB_MEDIA_0013
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0013';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 1;
      await opacityCallbackTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0014
     * @tc.number SUB_MEDIA_SUB_MEDIA_0014
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0014';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = 10;
      await opacityCallbackAbnormalTest(done, testName, opts, rate, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0015
     * @tc.number SUB_MEDIA_SUB_MEDIA_0015
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0015';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = -1;
      await opacityCallbackAbnormalTest(done, testName, opts, rate, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0016
     * @tc.number SUB_MEDIA_SUB_MEDIA_0016
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0016';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = NaN;
      await opacityCallbackTest(done, testName, opts, rate, (data: boolean) => {
        expect(data).assertTrue();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0017
     * @tc.number SUB_MEDIA_SUB_MEDIA_0017
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0017';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = null as ESObject;
      await opacityCallbackAbnormalTest(done, testName, opts, rate, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0018
     * @tc.number SUB_MEDIA_SUB_MEDIA_0018
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0018';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      let rate: number = undefined as ESObject;
      await opacityCallbackAbnormalTest(done, testName, opts, rate, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0019
     * @tc.number SUB_MEDIA_SUB_MEDIA_0019
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0019', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0019';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      AppStorage.setOrCreate('key', '1');
      let rate: number = AppStorage.get('key') as ESObject;
      await opacityCallbackAbnormalTest(done, testName, opts, rate, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

    /**
     * @tc.name   SUB_MEDIA_SUB_MEDIA_0020
     * @tc.number SUB_MEDIA_SUB_MEDIA_0020
     * @tc.desc   opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_SUB_MEDIA_0020', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_SUB_MEDIA_0020';
      let opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      AppStorage.setOrCreate('key', []);
      let rate: number = AppStorage.get('key') as ESObject;
      await opacityCallbackAbnormalTest(done, testName, opts, rate, (data: string) => {
        expect(data).assertEqual('62980115');
      });
    })

  })
}