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
import { ErrorCode } from '../../CommonErrorCode';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createPixelMapFromSurface';

const surfaceId = '123131';

async function createPixelMapFromSurfaceAbnormalPromiseTest(done: Function, testName: string) {
  let region: image.Region = { x: 0, y: 0, size: { height: 100, width: 100 } };
  await sendableImage.createPixelMapFromSurface(surfaceId, region).then(() => {
    console.info('Succeeded in creating pixelmap from Surface');
    done();
  }).catch((error: ESObject) => {
    console.error(TAG,
      `Failed to create pixelmap. error is ${error} , code is ${error.code}, message is ${error.message}`, testName);
    if (error && error.code) {
      expect(error.code == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    } else {
      expect(error == ErrorCode.Failed_To_Create_PixelMap).assertTrue();
    }
    done();
  });
}

export default function sendableCreatePixelMapFromSurfaceTest() {
  describe('sendableCreatePixelMapFromSurfaceTest', () => {

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
     * @tc.number    : SENDABLE_IMAGE_CREATE_PIXEL_MAP_FROM_SURFACE_001
     * @tc.name      : sendableImage_createPixelMapFromSurface_sendable_abnormal_promise_001
     * @tc.desc      : sendableImage_createPixelMapFromSurface_Abnormal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('createPixelMapFromSurface_sendable_abnormal_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createPixelMapFromSurface_sendable_abnormal_promise_001';
      await createPixelMapFromSurfaceAbnormalPromiseTest(done, testName);
    })
  })
}