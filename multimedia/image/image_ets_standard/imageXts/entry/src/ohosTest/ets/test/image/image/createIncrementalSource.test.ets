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
import { BusinessError } from '@ohos.base';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../../common';

const TAG = LOG_TAG + 'createIncrementalSource';

async function createImageSourcePromiseTest(done: Function, testName: string,
  SourceOptions?: image.SourceOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let imageArray = testContext.resourceManager.getMediaContentSync($r('app.media.startIcon'));
  // 此处'app.media.startIcon'仅作示例，请开发者自行替换，否则imageArray创建失败会导致后续无法正常执行。
  let splitBuff1 = imageArray.slice(0, imageArray.byteLength / 2); // 分片。
  let splitBuff2 = imageArray.slice(imageArray.byteLength / 2);
  const imageSourceIncrementalSApi: image.ImageSource =
    SourceOptions ? image.CreateIncrementalSource(new ArrayBuffer(imageArray.byteLength), SourceOptions) :
    image.CreateIncrementalSource(new ArrayBuffer(imageArray.byteLength));
  imageSourceIncrementalSApi.updateData(splitBuff1, false, 0, splitBuff1.byteLength).then(() => {
    imageSourceIncrementalSApi.updateData(splitBuff2, true, 0, splitBuff2.byteLength).then(() => {
      let pixelMap = imageSourceIncrementalSApi.createPixelMapSync();
      let imageInfo = pixelMap.getImageInfoSync();
      done();
      console.info('Succeeded in creating pixelMap');
    }).catch((error: BusinessError) => {
      expect().assertFail()
      done();
      console.error(TAG, `Failed to updateData error code is ${error.code}, message is ${error.message}`, testName);
    })
  }).catch((error: BusinessError) => {
    expect().assertFail()
    done();
    console.error(TAG, `Failed to updateData error code is ${error.code}, message is ${error.message}`, testName);
  })
}

export default function createIncrementalSourceTest() {
  describe('createIncrementalSourceTest', () => {

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
     * @tc.name   createIncrementalSource_promise_001
     * @tc.number IMAGE_CREATE_INCREMENTAL_SOURCE_001
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createIncrementalSource_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createIncrementalSource_promise_001';
      await createImageSourcePromiseTest(done, testName);
    })

    /**
     * @tc.name   createIncrementalSource_promise_002
     * @tc.number IMAGE_CREATE_INCREMENTAL_SOURCE_002
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createIncrementalSource_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createIncrementalSource_promise_002';
      let sourceOptions: image.SourceOptions = { sourceDensity: 120 };
      await createImageSourcePromiseTest(done, testName, sourceOptions);
    })

    /**
     * @tc.name   createIncrementalSource_promise_003
     * @tc.number IMAGE_CREATE_INCREMENTAL_SOURCE_003
     * @tc.desc   createIncrementalSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createIncrementalSource_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'createIncrementalSource_promise_003';
      let sourceOptions: image.SourceOptions = {
        sourceDensity: 120,
        sourcePixelFormat: image.PixelMapFormat.UNKNOWN,
        sourceSize: {
          height: 100,
          width: 100
        }
      };
      await createImageSourcePromiseTest(done, testName, sourceOptions);
    });
  })
}