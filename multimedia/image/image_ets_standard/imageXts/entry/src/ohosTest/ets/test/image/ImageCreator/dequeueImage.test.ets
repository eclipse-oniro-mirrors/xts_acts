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

const TAG = LOG_TAG + 'dequeueImage';

async function dequeueImagePromiseTest(done: Function, testName: string, size: image.Size) {
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    await creator.dequeueImage().then((img: image.Image) => {
      creator.release();
      console.info(TAG, 'Succeeded in dequeuing the Image.');
    }).catch((error: BusinessError) => {
      console.error(TAG, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
      expect().assertFail();
    })
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function dequeueImageCallbackTest(done: Function, testName: string, size: image.Size) {
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError, img: image.Image) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
      } else {
        console.info(TAG, 'Succeeded in dequeuing the Image.')
      }
      creator.release((err: BusinessError) => {
        if (err) {
          console.error(`Failed to release the creator.code ${err.code},message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info('Succeeded in releasing creator.');
        }
      });
      done();
    });
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageCreatorDequeueImageTest() {
  describe('ImageCreatorDequeueImageTest', () => {

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
     * @tc.number    : IMAGE_CREATOR_DEQUEUE_IMAGE_001
     * @tc.name      : ImageCreator_dequeueImage_promise_001
     * @tc.desc      : ImageCreator_dequeueImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('ImageCreator_dequeueImage_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_dequeueImage_promise_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await dequeueImagePromiseTest(done, testName, size);
    })

    /**
     * @tc.number    : IMAGE_CREATOR_DEQUEUE_IMAGE_002
     * @tc.name      : ImageCreator_dequeueImage_promise_002
     * @tc.desc      : ImageCreator_dequeueImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('ImageCreator_dequeueImage_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_dequeueImage_promise_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await dequeueImagePromiseTest(done, testName, size);
    })

    /**
     * @tc.number    : IMAGE_CREATOR_DEQUEUE_IMAGE_003
     * @tc.name      : ImageCreator_dequeueImage_callback_001
     * @tc.desc      : ImageCreator_dequeueImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('ImageCreator_dequeueImage_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_dequeueImage_callback_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await dequeueImageCallbackTest(done, testName, size);
    })

    /**
     * @tc.number    : IMAGE_CREATOR_DEQUEUE_IMAGE_004
     * @tc.name      : ImageCreator_dequeueImage_callback_002
     * @tc.desc      : ImageCreator_dequeueImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('ImageCreator_dequeueImage_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_dequeueImage_callback_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await dequeueImageCallbackTest(done, testName, size);
    })
  })
}