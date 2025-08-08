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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, copyImageToSandbox } from '../../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'getSupportedPhotoFormats';

async function getSupportedPhotoFormatsPromiseTest(done: Function, testName: string, photoTypeNumber: number) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let outputText: string;
    if (photoTypeNumber !== 1 && photoTypeNumber !== 2) {
      outputText = 'Does not support querying formats other than images or videos';
      return;
    }
    outputText = 'The supported types are:\n';
    let imageFormat = await phAccessHelper.getSupportedPhotoFormats(photoTypeNumber);
    let result = "";
    for (let i = 0; i < imageFormat.length; i++) {
      result += imageFormat[i];
      if (i !== imageFormat.length - 1) {
        result += ', ';
      }
    }
    outputText += result;
    console.info('getSupportedPhotoFormats success, data is ' + outputText);
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function getSupportedPhotoFormatsTest() {
  describe('getSupportedPhotoFormatsTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
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
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_SUPPORTED_PHOTO_FORMATS_001
     * @tc.name      : getSupportedPhotoFormats_promise_001
     * @tc.desc      : getSupportedPhotoFormats
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedPhotoFormats_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getSupportedPhotoFormats_promise_001';
      const photoTypeNumber: number = photoAccessHelper.PhotoType.IMAGE;
      await getSupportedPhotoFormatsPromiseTest(done, testName, photoTypeNumber);
    })

    /**
     * @tc.number    : PHOTO_ACCESS_HELPER_GET_SUPPORTED_PHOTO_FORMATS_002
     * @tc.name      : getSupportedPhotoFormats_promise_002
     * @tc.desc      : getSupportedPhotoFormats
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getSupportedPhotoFormats_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getSupportedPhotoFormats_promise_002';
      const photoTypeNumber: number = photoAccessHelper.PhotoType.IMAGE;
      await getSupportedPhotoFormatsPromiseTest(done, testName, photoTypeNumber);
    })
  })
}