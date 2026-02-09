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
import { rpc } from '@kit.IPCKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createPixelMapFromParcel';

class MySequence implements rpc.Parcelable {
  pixel_map: sendableImage.PixelMap;

  constructor(conPixelmap: sendableImage.PixelMap) {
    this.pixel_map = conPixelmap;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence) {
    try {
      this.pixel_map = sendableImage.createPixelMapFromParcel(messageSequence);
    } catch (e) {
      let error = e as BusinessError;
      console.error(`createPixelMapFromParcel error. code is ${error.code}, message is ${error.message}`);
      return false;
    }
    return true;
  }
}

async function createPixelMapFromParcelPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let bufferArr: Uint8Array = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i++) {
      bufferArr[i] = 0x80;
    }
    let pixelMap: sendableImage.PixelMap | undefined = undefined;
    await sendableImage.createPixelMap(color, opts).then((srcPixelMap: sendableImage.PixelMap) => {
      pixelMap = srcPixelMap;
    })
    if (pixelMap != undefined) {
      // 序列化。
      let parcelable: MySequence = new MySequence(pixelMap);
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);

      // 反序列化 rpc获取到data。
      let ret: MySequence = new MySequence(pixelMap);
      data.readParcelable(ret);

      // 获取到pixelmap。
      let unmarshPixelmap = ret.pixel_map;
      console.log(JSON.stringify(unmarshPixelmap));
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createPixelMapFromParcelAbnormalPromiseTest(done: Function, testName: string, color: ArrayBuffer,
  opts: image.InitializationOptions) {
  try {
    let bufferArr: Uint8Array = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i++) {
      bufferArr[i] = 0x80;
    }
    let pixelMap: sendableImage.PixelMap | undefined = undefined;
    await sendableImage.createPixelMap(color, opts).then((srcPixelMap: sendableImage.PixelMap) => {
      pixelMap = srcPixelMap;
    })
    if (pixelMap != undefined) {
      // 序列化。
      let parcelable: MySequence = new MySequence(pixelMap);
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);

      // 反序列化 rpc获取到data。
      let ret: MySequence = new MySequence(pixelMap);
      data.readParcelable(ret);

      // 获取到pixelmap。
      let unmarshPixelmap = ret.pixel_map;
      console.log(JSON.stringify(unmarshPixelmap));
      done()
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Operation_Failed).assertTrue();
      done();
    } else {
      expect(error == ErrorCode.Operation_Failed).assertTrue();
      done();
    }
  }
}

export default function sendableCreatePixelMapFromParcelTest() {
  describe('sendableCreatePixelMapFromParcelTest', () => {

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
     * @tc.name   sendableImage_createPixelMapFromParcel_sendable_promise_001
     * @tc.number SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_001
     * @tc.desc   sendableImage_createPixelMapFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMapFromParcel_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapFromParcel_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 4, width: 6 } };
      await createPixelMapFromParcelPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   sendableImage_createPixelMapFromParcel_sendable_promise_002
     * @tc.number SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_002
     * @tc.desc   sendableImage_createPixelMapFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMapFromParcel_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapFromParcel_sendable_promise_002';
      const color: ArrayBuffer = new ArrayBuffer(1000 * 1000 * 4);
      const opts: image.InitializationOptions =
        { editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 1000, width: 1000 } };
      await createPixelMapFromParcelPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   sendableImage_createPixelMapFromParcel_sendable_promise_003
     * @tc.number SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_003
     * @tc.desc   sendableImage_createPixelMapFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMapFromParcel_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapFromParcel_sendable_promise_003';
      const color: ArrayBuffer = new ArrayBuffer(96);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 6, width: 4 } };
      await createPixelMapFromParcelPromiseTest(done, testName, color, opts);
    })

    /**
     * @tc.name   sendableImage_createPixelMapFromParcel_abnormal_sendable_promise_001
     * @tc.number SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_PARCEL_004
     * @tc.desc   sendableImage_createPixelMapFromParcel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sendableImage_createPixelMapFromParcel_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createPixelMapFromParcel_abnormal_sendable_promise_001';
      const color: ArrayBuffer = new ArrayBuffer(0);
      const opts: image.InitializationOptions =
        { editable: false, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 0, width: 0 } };
      await createPixelMapFromParcelAbnormalPromiseTest(done, testName, color, opts);
    })
  })
}