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

const TAG = LOG_TAG + 'requestPhotoUrisReadPermission';

async function requestPhotoUrisReadPermissionPromiseTest(done: Function, testName: string, pathUri: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let srcFileUris: Array<string> = [
      testContext.filesDir + '/' + pathUri
    ];
    phAccessHelper.requestPhotoUrisReadPermission(srcFileUris).then((result: Array<string>) => {
      console.info("requestPhotoUrisReadPermission, result = " + JSON.stringify(result));
      if (result) {
        console.info('success')
      } else {
        expect(false).assertFail();
      }
    })
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function requestPhotoUrisReadPermissionTest() {
  describe('requestPhotoUrisReadPermissionTest', () => {

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
     * @tc.name   requestPhotoUrisReadPermission_promise_001
     * @tc.number PHOTO_ACCESS_HELPER_REQUEST_PHOTO_URIS_READ_PERMISSION_001
     * @tc.desc   requestPhotoUrisReadPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('requestPhotoUrisReadPermission_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'requestPhotoUrisReadPermission_promise_001';
      const fileName = 'test.jpg';
      const path = 'test.jpg';
      await copyImageToSandbox(fileName, path);
      await requestPhotoUrisReadPermissionPromiseTest(done, testName, path);
    })
  })
}