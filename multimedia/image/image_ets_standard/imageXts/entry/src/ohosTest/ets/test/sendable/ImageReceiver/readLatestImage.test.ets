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

const TAG = LOG_TAG + 'readLatestImage';

async function readLatestImagePromiseTest(done: Function, testName: string, size: image.Size, capacity: number) {
  try {
    let receiver: sendableImage.ImageReceiver =
      sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, capacity);
    receiver.on('imageArrival', () => {
      // image arrival, do something.
    })
    receiver.readLatestImage().then((img: image.Image) => {
      console.info('Succeeded in reading the latest Image.');
    }).catch((error: BusinessError) => {
      console.error(`Failed to read the latest Image.code ${error.code},message is ${error.message}`);
      expect().assertFail();
    })
    await receiver.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function readNextImagePromiseTest(done: Function, testName: string, size: image.Size, capacity: number) {
  try {
    let receiver: sendableImage.ImageReceiver =
      sendableImage.createImageReceiver(size, image.ImageFormat.JPEG, capacity);
    receiver.on('imageArrival', () => {
      // image arrival, do something.
    });
    receiver.readNextImage().then((img: image.Image) => {
      console.info('Succeeded in reading the next Image.');
    }).catch((error: BusinessError) => {
      console.error(`Failed to read the next Image.code ${error.code},message is ${error.message}`);
      expect().assertFail();
    })
    await receiver.release();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error?.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function sendableImageReceiverReadLatestImageTest() {
  describe('sendableImageReceiverReadLatestImageTest', () => {

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
     * @tc.number    : IMAGE_RECEIVER_READ_LATEST_IMAGE_001
     * @tc.name      : imageReceiver_readLatestImage_sendable_promise_001
     * @tc.desc      : imageReceiver_readLatestImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageReceiver_readLatestImage_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageReceiver_readLatestImage_sendable_promise_001';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const capacity = 1;
      await readLatestImagePromiseTest(done, testName, size, capacity);
    })*/

    /**
     * @tc.number    : IMAGE_RECEIVER_READ_NEXT_IMAGE_001
     * @tc.name      : imageReceiver_readNextImage_sendable_promise_001
     * @tc.desc      : imageReceiver_readNextImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('imageReceiver_readNextImage_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'imageReceiver_readNextImage_sendable_promise_001';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const capacity = 1;
      await readNextImagePromiseTest(done, testName, size, capacity);
    })*/
  })
}