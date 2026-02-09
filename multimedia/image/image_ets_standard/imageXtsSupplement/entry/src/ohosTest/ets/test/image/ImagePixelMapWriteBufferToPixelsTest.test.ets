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
const TAG = 'writeBufferToPixelsSupp';


async function PixelMapWriteBufferToPixels(testName: string, done: Function, callback: (pixelMap: image.PixelMap) => void) {
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
export default function PixelMapWriteBufferToPixelsTest() {
  describe('PixelMapWriteBufferToPixelsTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('emptyString', '')

    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString')
    });

    /**
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_001
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_001
     * @tc.desc   第一个参数空值覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_001'
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.writeBufferToPixels(AppStorage.get('emptyString'))
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
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_002
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_002
     * @tc.desc   第一个参数undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_002'
      try {
        const readBuffer = new ArrayBuffer(96);

        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.writeBufferToPixels(undefined)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_003
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_003
     * @tc.desc   第一个参数null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_003'
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          await PixelMap.writeBufferToPixels(null)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect(error.code).assertEqual('401');
        done();
      }
    })
    /**
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_004
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_004
     * @tc.desc   callback形式的第一个参数空值覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_004';
      try {
        PixelMapWriteBufferToPixels(testName, done, async (pixelMap) => {
          await pixelMap.writeBufferToPixels(AppStorage.get('emptyString'));
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_005
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_005
     * @tc.desc   callback形式的第一个参数null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_005';
      try {
        PixelMapWriteBufferToPixels(testName, done, async (pixelMap) => {
          await pixelMap.writeBufferToPixels(null);
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_006
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_006
     * @tc.desc   callback形式的第一个参数undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_TEST_006';
      try {
        PixelMapWriteBufferToPixels(testName, done, async (pixelMap) => {
          await pixelMap.writeBufferToPixels(undefined);
          done();
        });
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_007
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_007
     * @tc.desc   第一个参数空值覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_007'
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          PixelMap.writeBufferToPixelsSync(AppStorage.get('emptyString'))
          console.info(TAG,testName,'1111111111')
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_008
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_008
     * @tc.desc   第一个参数undefined覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_008'
      try {
        const readBuffer = new ArrayBuffer(96);

        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          PixelMap.writeBufferToPixelsSync(undefined)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_009
     * @tc.number PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_009
     * @tc.desc   第一个参数null覆盖情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_BUFFER_TO_PIXELS_SYNC_TEST_009'
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await image.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success', PixelMap)
        if (PixelMap != undefined) {
          PixelMap.writeBufferToPixelsSync(null)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

  })
}