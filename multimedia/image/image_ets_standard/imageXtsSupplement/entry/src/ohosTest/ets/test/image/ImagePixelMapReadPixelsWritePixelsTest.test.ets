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
import { describe, it, expect, Level, beforeAll, afterEach, afterAll, beforeEach } from '@ohos/hypium';
const TAG = 'PixelMapReadPixelsWritePixels';

async function PixelMapReadPixels(testName: string, done: Function, callback: (pixelMap: image.PixelMap) => void
) {
  const readBuffer = new ArrayBuffer(96);
  const opts: image.InitializationOptions = {
    editable: true,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    size: { height: 4, width: 6 }
  };
  const pixelMap = await image.createPixelMap(readBuffer, opts);
  console.info(TAG, testName, 'createPixelMap success');
  if (pixelMap !== undefined) {
    callback(pixelMap);
    console.info(TAG, testName, '1111111111');
  }
}
async function PixelMapWritePixels(testName: string, done: Function, callback: (pixelMap: image.PixelMap) => void
) {
  const readBuffer = new ArrayBuffer(96);
  const opts: image.InitializationOptions = {
    editable: true,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    size: { height: 4, width: 6 }
  };
  const pixelMap = await image.createPixelMap(readBuffer, opts);
  console.info(TAG, testName, 'createPixelMap success');
  if (pixelMap !== undefined) {
    callback(pixelMap);
    console.info(TAG, testName, '1111111111');
  }
}
export default function ReadPixelsWritePixelsTest() {
  describe('ReadPixelsWritePixelsTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('emptyString', '');
    });
    beforeEach(async () =>{
      console.info(TAG,'beforeEach case.')
    })

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString');
    });


    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_001
     * @tc.number PIXEL_MAP_READ_PIXELS_001
     * @tc.desc   PIXEL_MAP_READ_PIXELS_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_001';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          await pixelMap.readPixels(null as ESObject);
          console.info(TAG, testName, 'readPixels success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_002
     * @tc.number PIXEL_MAP_READ_PIXELS_002
     * @tc.desc   PIXEL_MAP_READ_PIXELS_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_002';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          await pixelMap.readPixels(undefined as ESObject);
          console.info(TAG, testName, 'readPixels success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_003
     * @tc.number PIXEL_MAP_READ_PIXELS_003
     * @tc.desc   PIXEL_MAP_READ_PIXELS_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_003';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          await pixelMap.readPixels(AppStorage.get('emptyString') as ESObject);
          console.info(TAG, testName, 'readPixels success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_TEST_004
     * @tc.number PIXEL_MAP_READ_PIXELS_TEST_004
     * @tc.desc   callback形式的第一个参数空值覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_TEST_004';
      try {
        PixelMapReadPixels(testName, done, async (pixelMap) => {
          await pixelMap.readPixels(AppStorage.get('emptyString'));
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_TEST_005
     * @tc.number PIXEL_MAP_READ_PIXELS_TEST_005
     * @tc.desc   callback形式的第一个参数null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_TEST_005';
      try {
        PixelMapReadPixels(testName, done, async (pixelMap) => {
          await pixelMap.readPixels(null);
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_TEST_006
     * @tc.number PIXEL_MAP_READ_PIXELS_TEST_006
     * @tc.desc   callback形式的第一个参数undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_TEST_006';
      try {
        PixelMapReadPixels(testName, done, async (pixelMap) => {
          await pixelMap.readPixels(undefined);
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_SYNC_TEST_007
     * @tc.number PIXEL_MAP_READ_PIXELS_SYNC_TEST_007
     * @tc.desc   readPixelsSync第一个参数空值覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_SYNC_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_SYNC_TEST_007'
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.readPixelsSync(AppStorage.get('emptyString'))
          console.info(TAG,testName,'1111111111')
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_SYNC_TEST_008
     * @tc.number PIXEL_MAP_READ_PIXELS_SYNC_TEST_008
     * @tc.desc   readPixelsSync第一个参数undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_SYNC_TEST_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_SYNC_TEST_008'
      try {
        const readBuffer = new ArrayBuffer(96);

        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.readPixelsSync(undefined)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PIXEL_MAP_READ_PIXELS_SYNC_TEST_009
     * @tc.number PIXEL_MAP_READ_PIXELS_SYNC_TEST_009
     * @tc.desc   readPixelsSync第一个参数null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_READ_PIXELS_SYNC_TEST_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_SYNC_TEST_009'
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.readPixelsSync(null)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_0010
     * @tc.number PIXEL_MAP_WRITE_PIXELS_0010
     * @tc.desc   PIXEL_MAP_WRITE_PIXELS_0010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_0010', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_0010';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          await pixelMap.writePixels(null);
          console.info(TAG, testName, 'writePixels success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_0011
     * @tc.number PIXEL_MAP_WRITE_PIXELS_0011
     * @tc.desc   PIXEL_MAP_WRITE_PIXELS_0011
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_0011', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_0011';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          await pixelMap.writePixels(undefined);
          console.info(TAG, testName, 'writePixels success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_0012
     * @tc.number PIXEL_MAP_WRITE_PIXELS_0012
     * @tc.desc   PIXEL_MAP_WRITE_PIXELS_0012
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_0012', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_0012';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await image.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          await pixelMap.writePixels(AppStorage.get('emptyString') as ESObject);
          console.info(TAG, testName, 'writePixels success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_TEST_0013
     * @tc.number PIXEL_MAP_WRITE_PIXELS_TEST_0013
     * @tc.desc   callback形式的第一个参数空值覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_TEST_0013', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_TEST_0013';
      try {
        PixelMapWritePixels(testName, done, async (pixelMap) => {
          await pixelMap.writePixels(AppStorage.get('emptyString'));
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_TEST_0014
     * @tc.number PIXEL_MAP_WRITE_PIXELS_TEST_0014
     * @tc.desc   callback形式的第一个参数null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_TEST_0014', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_TEST_0014';
      try {
        PixelMapWritePixels(testName, done, async (pixelMap) => {
          await pixelMap.writePixels(null);
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_TEST_0015
     * @tc.number PIXEL_MAP_WRITE_PIXELS_TEST_0015
     * @tc.desc   callback形式的第一个参数undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_TEST_0015', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_TEST_0015';
      try {
        PixelMapWritePixels(testName, done, async (pixelMap) => {
          await pixelMap.writePixels(undefined);
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0016
     * @tc.number PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0016
     * @tc.desc   writePixelsSync第一个参数空值覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0016', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0016'
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.writePixelsSync(AppStorage.get('emptyString'))
          console.info(TAG,testName,'1111111111')
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0017
     * @tc.number PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0017
     * @tc.desc   writePixelsSync第一个参数undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0017', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0017'
      try {
        const readBuffer = new ArrayBuffer(96);

        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.writePixelsSync(undefined)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0018
     * @tc.number PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0018
     * @tc.desc   writePixelsSync第一个参数null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0018', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_SYNC_TEST_0018'
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.writePixelsSync(null)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
        done();
      }
    })
  });
}