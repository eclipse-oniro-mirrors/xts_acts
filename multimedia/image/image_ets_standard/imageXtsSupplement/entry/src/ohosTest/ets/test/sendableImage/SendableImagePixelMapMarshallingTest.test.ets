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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { image } from '@kit.ImageKit';
import { rpc } from '@kit.IPCKit';
const TAG = 'PixelMapMarshallingSupp';

export default function PixelMapMarshallingTest() {
  describe('PixelMapMarshallingTest', () => {

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
     * @tc.number     SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_001
     * @tc.name       SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_001
     * @tc.desc       pixelMap_marshalling 第一个参数为null覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_001';
      try {
        const readBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        const pixelMap = await image.createPixelMap(readBuffer, opts);
        console.info(TAG, testName, 'pixelMap:', pixelMap)
        if (pixelMap !== undefined) {
          pixelMap.marshalling(null);
        }
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_002
     * @tc.name       SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_002
     * @tc.desc       pixelMap_marshalling 第一个参数为undefined覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_002';
      try {
        const readBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        const pixelMap = await image.createPixelMap(readBuffer, opts);
        console.info(TAG, testName, 'pixelMap:', pixelMap)
        if (pixelMap !== undefined) {
          pixelMap.marshalling(undefined);
        }
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number     SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_003
     * @tc.name       SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_003
     * @tc.desc       pixelMap_marshalling 第一个参数为空覆盖
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_IMAGE_PIXEL_MAP_MARSHALLING_003';
      try {
        const readBuffer = new ArrayBuffer(96);
        const opts: image.InitializationOptions = {
          editable: true,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: 4, width: 6 }
        };
        const pixelMap = await image.createPixelMap(readBuffer, opts);
        console.info(TAG, testName, 'pixelMap:', pixelMap)
        if (pixelMap !== undefined) {
          let data: rpc.MessageSequence = rpc.MessageSequence.create();
          pixelMap.marshalling(data);
        }
        done();
      } catch (error) {
        console.info(TAG, testName, ' marshalling error', error.message, error.code);
        expect().assertFail();
        done();
      }
    })

  })
}