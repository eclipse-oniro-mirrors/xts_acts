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
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'createImageReceiver';

async function createImageReceiverPromiseTest(done: Function, testName: string, size: image.Size,
  ImageFormat: image.ImageFormat) {
  try {
    let receiver: image.ImageReceiver = image.createImageReceiver(size, ImageFormat, 8);
    expect(receiver.size.height === size.height).assertTrue();
    expect(receiver.size.width === size.width).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImageReceiverAbnormalPromiseTest(done: Function, testName: string, size: ESObject,
  ImageFormat: ESObject) {
  try {
    let receiver: image.ImageReceiver = image.createImageReceiver(size, ImageFormat, 8);
    expect(receiver.size.height === size.height).assertTrue();
    expect(receiver.size.width === size.width).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function createImageReceiverPackerTest() {
  describe('createImageReceiverPackerTest', () => {

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
     * @tc.number    : IMAGE_CREATE_IMAGE_RECEIVER_001
     * @tc.name      : createImageReceiver_promise_001
     * @tc.desc      : createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageReceiver_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageReceiver_promise_001';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const ImageFormat = image.ImageFormat.JPEG;
      await createImageReceiverPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_RECEIVER_002
     * @tc.name      : createImageReceiver_promise_002
     * @tc.desc      : createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageReceiver_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageReceiver_promise_002';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const ImageFormat = image.ImageFormat.JPEG;
      await createImageReceiverPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_RECEIVER_003
     * @tc.name      : createImageReceiver_promise_003
     * @tc.desc      : createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageReceiver_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageReceiver_promise_003';
      let size: image.Size = {
        height: 0,
        width: 0
      };
      const ImageFormat = image.ImageFormat.JPEG;
      await createImageReceiverPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_RECEIVER_004
     * @tc.name      : createImageReceiver_abnormal_promise_001
     * @tc.desc      : createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageReceiver_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageReceiver_abnormal_promise_001';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const ImageFormat = image.ImageFormat.YCBCR_422_SP;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_RECEIVER_005
     * @tc.name      : createImageReceiver_abnormal_promise_002
     * @tc.desc      : createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageReceiver_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageReceiver_abnormal_promise_002';
      let size = undefined;
      const ImageFormat = image.ImageFormat.JPEG;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_RECEIVER_006
     * @tc.name      : createImageReceiver_abnormal_promise_003
     * @tc.desc      : createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageReceiver_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageReceiver_abnormal_promise_003';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const ImageFormat = undefined;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_RECEIVER_007
     * @tc.name      : createImageReceiver_abnormal_promise_004
     * @tc.desc      : createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageReceiver_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageReceiver_abnormal_promise_004';
      let size: ESObject = {};
      const ImageFormat = undefined;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_RECEIVER_008
     * @tc.name      : createImageReceiver_abnormal_promise_005
     * @tc.desc      : createImageReceiver
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageReceiver_abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageReceiver_abnormal_promise_005';
      let size: ESObject = null;
      const ImageFormat = null;
      await createImageReceiverAbnormalPromiseTest(done, testName, size, ImageFormat);
    })
  })
}