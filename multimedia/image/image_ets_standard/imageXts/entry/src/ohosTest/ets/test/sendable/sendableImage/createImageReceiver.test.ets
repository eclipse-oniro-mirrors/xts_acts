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
import { LOG_TAG } from '../../common';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'createImageReceiver';

async function createImageReceiverPromiseTest(done: Function, testName: string, size: image.Size, capacity: number) {
  try {
    let receiver: sendableImage.ImageReceiver =
      sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, capacity);
    let ImageReceiverCapacity = receiver.capacity;
    let ImageReceiverSize = receiver.size;
    expect(ImageReceiverCapacity == capacity).assertTrue();
    expect(ImageReceiverSize.height == size.height).assertTrue();
    expect(ImageReceiverSize.width == size.width).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImageReceiverAbnormalPromiseTest(done: Function, testName: string, size: ESObject,
  capacity: ESObject) {
  try {
    let receiver: sendableImage.ImageReceiver =
      sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, capacity);
    let ImageReceiverCapacity = receiver.capacity;
    let ImageReceiverSize = receiver.size;
    expect(ImageReceiverCapacity == capacity).assertTrue();
    expect(ImageReceiverSize.height == size.height).assertTrue();
    expect(ImageReceiverSize.width == size.width).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function sendableCreateImageReceiverTest() {
  describe('sendableCreateImageReceiverTest', () => {

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
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_001
     * @tc.name      : sendableImage_createImageReceiver_sendable_promise_001
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_sendable_promise_001';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const capacity = 1;
      await createImageReceiverPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_002
     * @tc.name      : sendableImage_createImageReceiver_sendable_promise_002
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_sendable_promise_002';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const capacity = 1;
      await createImageReceiverPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_003
     * @tc.name      : sendableImage_createImageReceiver_sendable_promise_003
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_sendable_promise_003';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const capacity = 0;
      await createImageReceiverPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_004
     * @tc.name      : sendableImage_createImageReceiver_sendable_promise_004
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_sendable_promise_004';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const capacity = -1;
      await createImageReceiverPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_005  //TODO capacity传小数会向下取整
     * @tc.name      : sendableImage_createImageReceiver_sendable_promise_005
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /* it('sendableImage_createImageReceiver_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
       const testName = 'sendableImage_createImageReceiver_sendable_promise_005';
       let size: image.Size = {
         height: 8,
         width: 8192
       };
       const capacity = 1.3;
       await createImageReceiverPromiseTest(done, testName, size, capacity);
     })*/

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_006  //TODO capacity传小数会向下取整
     * @tc.name      : sendableImage_createImageReceiver_sendable_promise_006
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('sendableImage_createImageReceiver_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_sendable_promise_006';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const capacity = 1.8;
      await createImageReceiverPromiseTest(done, testName, size, capacity)
    })*/

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_007
     * @tc.name      : sendableImage_createImageReceiver_sendable_promise_007
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_sendable_promise_007';
      let size: image.Size = {
        height: 0,
        width: 8192
      };
      const capacity = 1;
      await createImageReceiverPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_008
     * @tc.name      : sendableImage_createImageReceiver_sendable_promise_008
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_sendable_promise_008';
      let size: image.Size = {
        height: 8,
        width: 0
      };
      const capacity = 1;
      await createImageReceiverPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_009
     * @tc.name      : sendableImage_createImageReceiver_abnormal_sendable_promise_001
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_abnormal_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_abnormal_sendable_promise_001';
      let size: ESObject = {};
      const capacity = 1;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_010
     * @tc.name      : sendableImage_createImageReceiver_abnormal_sendable_promise_002
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_abnormal_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_abnormal_sendable_promise_002';
      let size: ESObject = null;
      const capacity = 1;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_011
     * @tc.name      : sendableImage_createImageReceiver_abnormal_sendable_promise_003
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_abnormal_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_abnormal_sendable_promise_003';
      let size: ESObject = undefined;
      const capacity = 1;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_012
     * @tc.name      : sendableImage_createImageReceiver_abnormal_sendable_promise_004
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_abnormal_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_abnormal_sendable_promise_004';
      let size: ESObject = {
        height: 8,
        width: 0
      };
      const capacity = null;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_013
     * @tc.name      : sendableImage_createImageReceiver_abnormal_sendable_promise_005
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_abnormal_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_abnormal_sendable_promise_005';
      let size: ESObject = {
        height: 8,
        width: 0
      };
      const capacity = '0';
      await createImageReceiverAbnormalPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : SENDABLE_IMAGE_CREATE_IMAGE_RECEIVER_014
     * @tc.name      : sendableImage_createImageReceiver_abnormal_sendable_promise_006
     * @tc.desc      : sendableImage_createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendableImage_createImageReceiver_abnormal_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'sendableImage_createImageReceiver_abnormal_sendable_promise_006';
      let size: ESObject = {
        height: 8,
        width: 0
      };
      const capacity = undefined;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, capacity);
    })
  })
}