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

import common from '@ohos.app.ability.common';
import { image } from '@kit.ImageKit';
import { copyImageToSandbox } from '../common';
import fs from '@ohos.file.fs';
import { resourceManager } from '@kit.LocalizationKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';

const TAG = 'CreateIncrementalSource';

async function createPixelMapFromSurfaceSyncErr(done: Function, testName: string, buf: ArrayBuffer,
  callback: (imageSourceApi: image.ImageSource) => void, SourceOptions?: image.SourceOptions) {
  try {
    const imageSourceApi: image.ImageSource =
      SourceOptions ? image.CreateIncrementalSource(buf, SourceOptions) : image.CreateIncrementalSource(buf);
    console.info(TAG, testName, `imageSourceApi`, JSON.stringify(imageSourceApi.getImageInfo()));
    callback(imageSourceApi);
    done();
  } catch (error) {
    console.error(TAG, testName, `failed; error: ${error},${error.code}`);
    expect().assertFail();
    done();
  }
}

export default function ImageCreateIncrementalSourceBufTest() {
  describe('ImageCreateIncrementalSourceBufTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('keyMAp', [0, 1, 2])
      AppStorage.setOrCreate('keyString', '123')
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      AppStorage.delete('keyMap')
      AppStorage.delete('keyString')
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_001
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_001
     * @tc.desc   Test createImageReceiver with buf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_001';
      const buf: ArrayBuffer = null as ESObject;
      await createPixelMapFromSurfaceSyncErr(done, testName, buf, (imageSourceApi: image.ImageSource) => {
        expect(imageSourceApi).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_002
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_002
     * @tc.desc   Test createImageReceiver with buf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_002', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_002';
      const buf: ArrayBuffer = undefined as ESObject;
      await createPixelMapFromSurfaceSyncErr(done, testName, buf, (imageSourceApi: image.ImageSource) => {
        expect(imageSourceApi).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_003
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_003
     * @tc.desc   Test createImageReceiver with buf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_003', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_003';
      const buf: ArrayBuffer = AppStorage.get('keyMap') as ESObject;
      await createPixelMapFromSurfaceSyncErr(done, testName, buf, (imageSourceApi: image.ImageSource) => {
        expect(imageSourceApi).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_004
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_004
     * @tc.desc   Test createImageReceiver with buf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_004', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_004';
      const buf: ArrayBuffer = AppStorage.get('keyString') as ESObject;
      await createPixelMapFromSurfaceSyncErr(done, testName, buf, (imageSourceApi: image.ImageSource) => {
        expect(imageSourceApi).not().assertUndefined();
      });
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_005
     * @tc.number SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_005
     * @tc.desc   Test createImageReceiver with buf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_005', Level.LEVEL0, async (done: Function) => {
      const testName: string = 'SUB_MEDIA_IMAGE_CREATE_INCREMENTAL_SOURCE_TEST_005';
      const buf: ArrayBuffer = new ArrayBuffer(0);
      await createPixelMapFromSurfaceSyncErr(done, testName, buf, (imageSourceApi: image.ImageSource) => {
        expect(imageSourceApi).not().assertUndefined();
      },);
    })
  })
}