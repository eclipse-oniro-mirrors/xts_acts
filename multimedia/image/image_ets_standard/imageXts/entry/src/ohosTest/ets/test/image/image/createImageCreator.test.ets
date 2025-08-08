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

const TAG = LOG_TAG + 'createImageCreator';

async function createImageCreatorPromiseTest(done: Function, testName: string, size: image.Size,
  ImageFormat: image.ImageFormat) {
  try {
    let receiver: image.ImageCreator = await image.createImageCreator(size, ImageFormat, 8);
    expect(receiver.capacity !== undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function createImageCreatorAbnormalPromiseTest(done: Function, testName: string, size: ESObject,
  ImageFormat: ESObject) {
  try {
    let receiver: image.ImageCreator = await image.createImageCreator(size, ImageFormat, 8);
    expect(receiver.capacity !== undefined).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect(error.code == ErrorCode.PARAM_ERROR_CODE).assertTrue();
    done();
  }
}

export default function createImageCreatorTest() {
  describe('createImageCreatorTest', () => {

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
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_001
     * @tc.name      : createImageCreator_promise_001
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_promise_001';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const ImageFormat = image.ImageFormat.JPEG;
      await createImageCreatorPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_002
     * @tc.name      : createImageCreator_promise_002
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_promise_002';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const ImageFormat = image.ImageFormat.JPEG;
      await createImageCreatorPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_003
     * @tc.name      : createImageCreator_promise_003
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_promise_003';
      let size: image.Size = {
        height: 0,
        width: 0
      };
      const ImageFormat = image.ImageFormat.JPEG;
      await createImageCreatorPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_004
     * @tc.name      : createImageCreator_promise_004
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_promise_004';
      let size: image.Size = {
        height: 8192,
        width: 8
      };
      const ImageFormat = image.ImageFormat.YCBCR_422_SP;
      await createImageCreatorPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_005
     * @tc.name      : createImageCreator_promise_005
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_promise_005';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const ImageFormat = image.ImageFormat.YCBCR_422_SP;
      await createImageCreatorPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_006
     * @tc.name      : createImageCreator_abnormal_promise_001
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_abnormal_promise_001';
      let size = undefined;
      const ImageFormat = image.ImageFormat.YCBCR_422_SP;
      await createImageCreatorAbnormalPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_007
     * @tc.name      : createImageCreator_abnormal_promise_002
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_abnormal_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_abnormal_promise_002';
      let size: image.Size = {
        height: 8,
        width: 8192
      };
      const ImageFormat = undefined;
      await createImageCreatorAbnormalPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_008
     * @tc.name      : createImageCreator_abnormal_promise_003
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_abnormal_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_abnormal_promise_003';
      let size = undefined;
      const ImageFormat = undefined;
      await createImageCreatorAbnormalPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_009
     * @tc.name      : createImageCreator_abnormal_promise_004
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_abnormal_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_abnormal_promise_004';
      let size = null;
      const ImageFormat = null;
      await createImageCreatorAbnormalPromiseTest(done, testName, size, ImageFormat);
    })

    /**
     * @tc.number    : IMAGE_CREATE_IMAGE_CREATOR_010
     * @tc.name      : createImageCreator_abnormal_promise_005
     * @tc.desc      : createImageCreator
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createImageCreator_abnormal_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'createImageCreator_abnormal_promise_005';
      let size = null;
      const ImageFormat = null;
      await createImageCreatorAbnormalPromiseTest(done, testName, size, ImageFormat);
    })
  })
}