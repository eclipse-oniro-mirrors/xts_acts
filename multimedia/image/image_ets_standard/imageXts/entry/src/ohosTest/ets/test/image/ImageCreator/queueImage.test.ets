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

const TAG = LOG_TAG + 'queueImage';

async function queueImagePromiseTest(done: Function, testName: string, size: image.Size) {
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    await creator.dequeueImage().then(async (img: image.Image) => {
      //绘制图片。
      await img.getComponent(image.ComponentType.JPEG).then((component: image.Component) => {
        let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 0; //B
          bufferArr[i + 1] = 0; //G
          bufferArr[i + 2] = 255; //R
          bufferArr[i + 3] = 255; //A
        }
      })
      await creator.queueImage(img).then(() => {
        console.info('Succeeded in queuing the Image.');
      }).catch((error: BusinessError) => {
        console.error(`Failed to queue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
      })
      done();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function queueImageCallbackTest(done: Function, testName: string, size: image.Size) {
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    await creator.dequeueImage().then(async (img: image.Image) => {
      //绘制图片。
      await img.getComponent(image.ComponentType.JPEG).then((component: image.Component) => {
        let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 0; //B
          bufferArr[i + 1] = 0; //G
          bufferArr[i + 2] = 255; //R
          bufferArr[i + 3] = 255; //A
        }
      })
      creator.queueImage(img, (err: BusinessError) => {
        if (err) {
          console.error(`Failed to queue the Image.code ${err.code},message is ${err.message}`);
          expect().assertFail();
        } else {
          console.info('Succeeded in queuing the Image.');
        }
        done();
      })
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageCreatorQueueImageTest() {
  describe('ImageCreatorQueueImageTest', () => {

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
     * @tc.number    : IMAGE_CREATOR_QUEUE_IMAGE_001
     * @tc.name      : ImageCreator_queueImage_promise_001
     * @tc.desc      : ImageCreator_queueImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('ImageCreator_queueImage_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_queueImage_promise_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await queueImagePromiseTest(done, testName, size);
    })

    /**
     * @tc.number    : IMAGE_CREATOR_QUEUE_IMAGE_002
     * @tc.name      : ImageCreator_queueImage_promise_002
     * @tc.desc      : ImageCreator_queueImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('ImageCreator_queueImage_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_queueImage_promise_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await queueImagePromiseTest(done, testName, size);
    })

    /**
     * @tc.number    : IMAGE_CREATOR_QUEUE_IMAGE_003
     * @tc.name      : ImageCreator_queueImage_callback_001
     * @tc.desc      : ImageCreator_queueImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('ImageCreator_queueImage_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_queueImage_callback_001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      await queueImageCallbackTest(done, testName, size);
    })

    /**
     * @tc.number    : IMAGE_CREATOR_QUEUE_IMAGE_004
     * @tc.name      : ImageCreator_queueImage_callback_002
     * @tc.desc      : ImageCreator_queueImage
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('ImageCreator_queueImage_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_queueImage_callback_002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      await queueImageCallbackTest(done, testName, size);
    })
  })
}