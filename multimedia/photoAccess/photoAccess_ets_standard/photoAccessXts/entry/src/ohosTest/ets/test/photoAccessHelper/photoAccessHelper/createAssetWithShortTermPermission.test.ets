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
import { fileIo } from '@kit.CoreFileKit';

const TAG = LOG_TAG + 'createAssetWithShortTermPermission';

async function createAssetWithShortTermPermissionPromiseTest(done: Function, testName: string,
  photoCreationConfig: photoAccessHelper.PhotoCreationConfig, pathUri: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    console.log('createAssetWithShortTermPermission start')
    let resultUri: string = await phAccessHelper.createAssetWithShortTermPermission(photoCreationConfig);
    let resultFile: fileIo.File = fileIo.openSync(resultUri, fileIo.OpenMode.READ_WRITE);
    // 实际场景请使用真实的uri和文件大小。
    let srcFile: fileIo.File = fileIo.openSync(testContext.filesDir + '/' + pathUri, fileIo.OpenMode.READ_ONLY);
    let bufSize: number = 2000000;
    let readSize: number = 0;
    let buf = new ArrayBuffer(bufSize);
    let readLen = fileIo.readSync(srcFile.fd, buf, {
      offset: readSize,
      length: bufSize
    });
    if (readLen > 0) {
      readSize += readLen;
      fileIo.writeSync(resultFile.fd, buf, { length: readLen });
    }
    fileIo.closeSync(srcFile);
    fileIo.closeSync(resultFile);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function createAssetWithShortTermPermissionTest() {
  describe('createAssetWithShortTermPermissionTest', () => {

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
     * @tc.name   createAssetWithShortTermPermission_promise_001
     * @tc.number PHOTO_ACCESS_HELPER_CREATE_ASSET_WITH_SHORT_TERM_PERMISSION_001
     * @tc.desc   createAssetWithShortTermPermission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('createAssetWithShortTermPermission_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAssetWithShortTermPermission_promise_001';
      const fileName = 'test.jpg';
      const path = 'test.jpg';
      let photoCreationConfig: photoAccessHelper.PhotoCreationConfig = {
        title: '123456',
        fileNameExtension: 'jpg',
        photoType: photoAccessHelper.PhotoType.IMAGE,
        subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
      };
      await copyImageToSandbox(fileName, path);
      await createAssetWithShortTermPermissionPromiseTest(done, testName, photoCreationConfig, path);
    })*/
  })
}