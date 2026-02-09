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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'marshalling';

class MySequence implements rpc.Parcelable {
  pixel_map: sendableImage.PixelMap;

  constructor(conPixelMap: sendableImage.PixelMap) {
    this.pixel_map = conPixelMap;
  }

  marshalling(messageSequence: rpc.MessageSequence) {
    this.pixel_map.marshalling(messageSequence);
    console.info('marshalling');
    return true;
  }

  unmarshalling(messageSequence: rpc.MessageSequence) {
    sendableImage.createPixelMap(new ArrayBuffer(96), { size: { height: 4, width: 6 } })
      .then((pixelParcel: sendableImage.PixelMap) => {
        pixelParcel.unmarshalling(messageSequence).then(async (pixelMap: sendableImage.PixelMap) => {
          this.pixel_map = pixelMap;
          pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
            console.info("unmarshalling information h:" + imageInfo.size.height + "w:" + imageInfo.size.width);
          });
        });
      });
    return true;
  }
}

async function marshallingPromiseTest(done: Function, testName: string, opts: image.InitializationOptions) {
  try {
    const color: ArrayBuffer = new ArrayBuffer(opts.size.height * opts.size.width * 4);
    let bufferArr: Uint8Array = new Uint8Array(color);
    for (let i = 0; i < bufferArr.length; i++) {
      bufferArr[i] = 0x80;
    }
    let pixelMap: sendableImage.PixelMap | undefined = undefined;
    await sendableImage.createPixelMap(color, opts).then((srcPixelMap: sendableImage.PixelMap) => {
      pixelMap = srcPixelMap;
    });
    if (pixelMap != undefined) {
      // 序列化。
      let parcelable: MySequence = new MySequence(pixelMap);
      let data: rpc.MessageSequence = rpc.MessageSequence.create();
      data.writeParcelable(parcelable);
      // 反序列化 rpc获取到data。
      let ret: MySequence = new MySequence(pixelMap);
      data.readParcelable(ret);
      done();
    } else {
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function marshallingAbnormalPromiseTest(done: Function, testName: string, opts: image.InitializationOptions) {
  try {
    const color: ArrayBuffer = new ArrayBuffer(96);
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
      done();
    } else {
      expect().assertFail();
      done();
    }
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    if (error && error.code) {
      expect(error.code).assertEqual(ErrorCode.Operation_Failed);
      done();
    } else {
      expect(error).assertEqual(ErrorCode.Operation_Failed);
      done();
    }
  }
}

export default function sendableMarshallingTest() {
  describe('sendableMarshallingTest', () => {

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
     * @tc.name   marshalling_sendable_promise_001
     * @tc.number PIXEL_MAP_MARSHALLING_001
     * @tc.desc   marshalling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('marshalling_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'marshalling_sendable_promise_001';
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 4,
        size: { height: 4, width: 6 },
        alphaType: 3
      };
      await marshallingPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   marshalling_sendable_promise_002
     * @tc.number PIXEL_MAP_MARSHALLING_002
     * @tc.desc   marshalling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('marshalling_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'marshalling_sendable_promise_002';
      let opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: 4,
        size: { height: 4, width: 6 },
        alphaType: 3
      };
      await marshallingPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   marshalling_sendable_promise_003
     * @tc.number PIXEL_MAP_MARSHALLING_003
     * @tc.desc   marshalling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('marshalling_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'marshalling_sendable_promise_003';
      let opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: 4,
        size: { height: 600, width: 400 },
        alphaType: 3
      };
      await marshallingPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   marshalling_abnormal_sendable_promise_001
     * @tc.number PIXEL_MAP_MARSHALLING_004 //TODO 报错错误 error为62980096  Code为 undefined错误码 格式不对
     * @tc.desc   marshalling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('marshalling_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'marshalling_abnormal_sendable_promise_001';
      let opts: image.InitializationOptions = {
        editable: false,
        pixelFormat: 4,
        size: { height: 600, width: 400 },
        alphaType: 3
      };
      await marshallingAbnormalPromiseTest(done, testName, opts);
    })

    /**
     * @tc.name   marshalling_abnormal_sendable_promise_002
     * @tc.number PIXEL_MAP_MARSHALLING_005 //TODO 报错错误 error为62980096  Code为 undefined错误码 格式不对
     * @tc.desc   marshalling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('marshalling_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'marshalling_abnormal_sendable_promise_002';
      let opts: image.InitializationOptions = {
        editable: true,
        pixelFormat: 4,
        size: { height: 600, width: 400 },
        alphaType: 3
      };
      await marshallingAbnormalPromiseTest(done, testName, opts);
    })
  })
}