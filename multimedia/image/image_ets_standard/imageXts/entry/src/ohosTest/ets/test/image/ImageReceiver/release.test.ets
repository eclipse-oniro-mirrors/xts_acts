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

const TAG = LOG_TAG + 'release';

async function releasePromiseTest(done: Function, testName: string) {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        img.release().then(() => {
          console.info(TAG, 'Succeeded in releasing the image instance.');
          done();
        }).catch((error: BusinessError) => {
          console.error(TAG, `Failed to release the image instance.code ${error.code},message is ${error.message}`);
          expect().assertFail();
          done();
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function releaseCallbackTest(done: Function, testName: string) {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        img.release((error: BusinessError) => {
          if (error) {
            console.error(TAG, `Failed to release the image instance.code ${error.code},message is ${error.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded in releasing the image instance.');
          }
          done();
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}


export default function ImageReceiverReleaseTest() {
  describe('ImageReceiverReleaseTest', () => {

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
     * @tc.name   ImageReceiver_release_promise_001
     * @tc.number IMAGE_RECEIVER_RELEASE_001
     * @tc.desc   ImageReceiver_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageReceiver_release_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageReceiver_release_promise_001';
      await releasePromiseTest(done, testName);
    })

    /**
     * @tc.name   ImageReceiver_release_callback_001
     * @tc.number IMAGE_RECEIVER_RELEASE_002
     * @tc.desc   ImageReceiver_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImageReceiver_release_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageReceiver_release_callback_001';
      await releaseCallbackTest(done, testName);
    })
  })
}