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
const TAG =  'readPixelsToBufferSync';


export default function sendableReadPixelsToBufferSyncTest() {
  describe('sendableReadPixelsToBufferSyncTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      AppStorage.setOrCreate('undefined', undefined)
      AppStorage.setOrCreate('null', null)
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
      AppStorage.delete('undefined')
      AppStorage.delete('null')
      AppStorage.delete('emptyString')
    });

    /**
     * @tc.number     PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_001
     * @tc.name       PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_001
     * @tc.desc       null覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_001';
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await sendableImage.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
           PixelMap.readPixelsToBufferSync(AppStorage.get('null') as ArrayBuffer)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_002
     * @tc.name       PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_002
     * @tc.desc       undefined覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_002';
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await sendableImage.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
           PixelMap.readPixelsToBufferSync(AppStorage.get('undefined') as ArrayBuffer)
        }
        done();
      } catch (error) {
        console.info(TAG, testName,`failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_003
     * @tc.name       PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_003
     * @tc.desc       空值覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'PIXEL_MAP_READ_PIXELS_TO_BUFFER_SYNC_003';
      try {
        const readBuffer = new ArrayBuffer(96);
        let opts: image.InitializationOptions =
          { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
        let PixelMap = await sendableImage.createPixelMap(readBuffer, opts)
        console.info(TAG,testName,'createPixelMap success')
        if (PixelMap != undefined) {
          PixelMap.readPixelsToBufferSync(AppStorage.get('null') as ArrayBuffer)
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