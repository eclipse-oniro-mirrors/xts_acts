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
import { sendableImage } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'getReceivingSurfaceId';

async function getReceivingSurfaceIdPromiseTest(done: Function, testName: string, size: image.Size, capacity: number) {
  try {
    let receiver: sendableImage.ImageReceiver =
      sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, capacity);
    receiver.getReceivingSurfaceId().then((id: string) => {
      console.info('Succeeded in getting the ReceivingSurfaceId.');
      done();
    }).catch((error: BusinessError) => {
      console.error(`Failed to get the ReceivingSurfaceId.code ${error.code}, message is ${error.message}`);
      expect().assertFail();
      done();
    });
    await receiver.release();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableGetReceivingSurfaceIdTest() {
  describe('sendableGetReceivingSurfaceIdTest', () => {

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
     * @tc.number    : IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_001
     * @tc.name      : getReceivingSurfaceId_sendable_promise_001
     * @tc.desc      : getReceivingSurfaceId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReceivingSurfaceId_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getReceivingSurfaceId_sendable_promise_001';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const capacity = 1;
      await getReceivingSurfaceIdPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_002
     * @tc.name      : getReceivingSurfaceId_sendable_promise_002
     * @tc.desc      : getReceivingSurfaceId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReceivingSurfaceId_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getReceivingSurfaceId_sendable_promise_002';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const capacity = 1;
      await getReceivingSurfaceIdPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_003
     * @tc.name      : getReceivingSurfaceId_sendable_promise_003
     * @tc.desc      : getReceivingSurfaceId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReceivingSurfaceId_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getReceivingSurfaceId_sendable_promise_003';
      let size: image.Size = {
        height: 9999,
        width: 9999
      };
      const capacity = 99;
      await getReceivingSurfaceIdPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_004
     * @tc.name      : getReceivingSurfaceId_sendable_promise_004
     * @tc.desc      : getReceivingSurfaceId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReceivingSurfaceId_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'getReceivingSurfaceId_sendable_promise_004';
      let size: image.Size = {
        height: 9999,
        width: 9999
      };
      const capacity = -1;
      await getReceivingSurfaceIdPromiseTest(done, testName, size, capacity);
    })

    /**
     * @tc.number    : IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_005
     * @tc.name      : getReceivingSurfaceId_sendable_promise_005
     * @tc.desc      : getReceivingSurfaceId
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getReceivingSurfaceId_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'getReceivingSurfaceId_sendable_promise_005';
      let size: image.Size = {
        height: 9999,
        width: 9999
      };
      const capacity = 0;
      await getReceivingSurfaceIdPromiseTest(done, testName, size, capacity);
    })
  })
}