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
import { LOG_TAG } from '../../common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'getReceivingSurfaceId';

async function getReceivingSurfaceIdPromiseTest(done: Function, testName: string, size: image.Size) {
  try {
    const receiver: image.ImageReceiver = await image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    await receiver.getReceivingSurfaceId().then((id: string) => {
      console.info(TAG, 'Succeeded in getting the ReceivingSurfaceId.');
    }).catch((error: BusinessError) => {
      console.error(TAG, `Failed to get the ReceivingSurfaceId.code ${error.code},message is ${error.message}`);
      expect().assertFail();
    });
    receiver.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getReceivingSurfaceIdCallbackTest(done: Function, testName: string, size: image.Size) {
  try {
    const receiver: image.ImageReceiver = await image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    receiver.getReceivingSurfaceId((err: BusinessError, id: string) => {
      if (err) {
        console.error(TAG, `Failed to get the ReceivingSurfaceId.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in getting the ReceivingSurfaceId.');
      }
      receiver.release((err: BusinessError) => {
        if (err) {
          console.error(`Failed to release the receiver.code ${err.code},message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info('Succeeded in releasing the receiver.');
        }
      })
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageReceiverGetReceivingSurfaceIdTest() {
  describe('ImageReceiverGetReceivingSurfaceIdTest', () => {

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
     * @tc.name   ImageReceiver_getReceivingSurfaceId_promise_001
     * @tc.number IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_001
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageReceiver_getReceivingSurfaceId_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageReceiver_getReceivingSurfaceId_promise_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await getReceivingSurfaceIdPromiseTest(done, testName, size);
    })

    /**
     * @tc.name   ImageReceiver_getReceivingSurfaceId_promise_002
     * @tc.number IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_002
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageReceiver_getReceivingSurfaceId_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageReceiver_getReceivingSurfaceId_promise_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await getReceivingSurfaceIdPromiseTest(done, testName, size);
    })

    /**
     * @tc.name   ImageReceiver_getReceivingSurfaceId_callback_001
     * @tc.number IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_003
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageReceiver_getReceivingSurfaceId_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageReceiver_getReceivingSurfaceId_callback_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await getReceivingSurfaceIdCallbackTest(done, testName, size);
    })

    /**
     * @tc.name   ImageReceiver_getReceivingSurfaceId_callback_002
     * @tc.number IMAGE_RECEIVER_GET_RECEIVING_SURFACE_ID_004
     * @tc.desc   ImageReceiver_getReceivingSurfaceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageReceiver_getReceivingSurfaceId_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageReceiver_getReceivingSurfaceId_callback_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await getReceivingSurfaceIdCallbackTest(done, testName, size);
    })
  })
}