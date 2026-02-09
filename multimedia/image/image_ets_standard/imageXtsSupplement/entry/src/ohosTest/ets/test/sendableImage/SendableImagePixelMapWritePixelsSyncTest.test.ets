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
import { describe, it, expect, Level, beforeAll, afterEach, afterAll, beforeEach } from '@ohos/hypium';
const TAG = 'PixelMapWritePixelsSyncSupp';


export default function sendableWritePixelsSyncTest() {
  describe('sendableWritePixelsSyncTest', () => {
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
     * @tc.number     PIXEL_MAP_WRITE_PIXELS_SYNC_001
     * @tc.name       PIXEL_MAP_WRITE_PIXELS_SYNC_001
     * @tc.desc       测试第一个参数为null的情况
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('PIXEL_MAP_WRITE_PIXELS_SYNC_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_SYNC_001';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await sendableImage.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          pixelMap.writePixelsSync(null as ESObject);
          console.info(TAG, testName, 'writePixelsSync success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     PIXEL_MAP_WRITE_PIXELS_SYNC_002
     * @tc.name       PIXEL_MAP_WRITE_PIXELS_SYNC_002
     * @tc.desc       测试第一个参数为undefined的情况
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('PIXEL_MAP_WRITE_PIXELS_SYNC_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_SYNC_002';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await sendableImage.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          pixelMap.writePixelsSync(undefined as ESObject);
          console.info(TAG, testName, 'writePixelsSync success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     PIXEL_MAP_WRITE_PIXELS_SYNC_003
     * @tc.name       PIXEL_MAP_WRITE_PIXELS_SYNC_003
     * @tc.desc       测试第一个参数为空的情况
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('PIXEL_MAP_WRITE_PIXELS_SYNC_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_WRITE_PIXELS_SYNC_003';
      try {
        const color = new ArrayBuffer(4);
        let opts: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1, width: 1 }
        };
        let pixelMap = await sendableImage.createPixelMap(color, opts);
        console.info(TAG, testName, 'createPixelMap success');
        if (pixelMap!=undefined) {
          pixelMap.writePixelsSync(AppStorage.get('emptyString') as ESObject);
          console.info(TAG, testName, 'writePixelsSync success');
        }
        done();
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, code: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
  });
}