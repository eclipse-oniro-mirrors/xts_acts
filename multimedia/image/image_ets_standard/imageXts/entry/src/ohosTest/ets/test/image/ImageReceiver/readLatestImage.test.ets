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

const TAG = LOG_TAG + 'readLatestImage';

async function readLatestImagePromiseTest(done: Function, testName: string, size: image.Size) {
  try {
    const receiver: image.ImageReceiver = await image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    let callbackFunc = () => {
      // do something.
    };
    receiver.on('imageArrival', callbackFunc);
    receiver.off('imageArrival', callbackFunc);
    await receiver.getReceivingSurfaceId().then((id: string) => {
      console.info(TAG, 'Succeeded in getting the readLatestImage.');
    }).catch((error: BusinessError) => {
      console.error(TAG, `Failed to get the readLatestImage.code ${error.code},message is ${error.message}`);
      expect().assertFail();
    })
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function readLatestImageCallbackTest(done: Function, testName: string, size: image.Size) {
  try {
    const receiver: image.ImageReceiver = await image.createImageReceiver(size, image.ImageFormat.JPEG, 8);
    receiver.readLatestImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(`Failed to read the latest Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info('Succeeded in reading the latest Image.');
      }
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageReceiverReadLatestImageTest() {
  describe('ImageReceiverReadLatestImageTest', () => {

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
     * @tc.name      : ImageReceiver_readLatestImage_promise_001
     * @tc.desc      : ImageReceiver_readLatestImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('ImageReceiver_readLatestImage_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageReceiver_readLatestImage_promise_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await readLatestImagePromiseTest(done, testName, size);
    })*/

    /**
     * @tc.number    : IMAGE_RECEIVER_READ_LATEST_IMAGE_002
     * @tc.name      : ImageReceiver_readLatestImage_callback_001
     * @tc.desc      : ImageReceiver_readLatestImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    /*it('ImageReceiver_readLatestImage_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageReceiver_readLatestImage_callback_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await readLatestImageCallbackTest(done, testName, size);
    })*/
  })
}