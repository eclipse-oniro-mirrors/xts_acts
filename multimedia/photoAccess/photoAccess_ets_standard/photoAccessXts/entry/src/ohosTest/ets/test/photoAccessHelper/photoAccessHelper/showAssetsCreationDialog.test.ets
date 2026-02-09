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

const TAG = LOG_TAG + 'showAssetsCreationDialog';

async function showAssetsCreationDialogPromiseTest(done: Function, testName: string,
  photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig>, pathUri: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let srcFileUris: Array<string> = [
      testContext.filesDir + '/' + pathUri
    ];
    phAccessHelper.showAssetsCreationDialog(srcFileUris, photoCreationConfigs);
    await driveFn();
    console.info('showAssetsCreationDialog success');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function showAssetsCreationDialogTest() {
  describe('showAssetsCreationDialogTest', () => {

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
     * @tc.name   showAssetsCreationDialog_promise_001
     * @tc.number PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_001
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showAssetsCreationDialog_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'showAssetsCreationDialog_promise_001';
      const fileName = 'test.jpg';
      const path = 'test.jpg';
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'test2',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await copyImageToSandbox(fileName, path);
      await showAssetsCreationDialogPromiseTest(done, testName, photoCreationConfigs, path);
    })

    /**
     * @tc.name   showAssetsCreationDialog_promise_002
     * @tc.number PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_002
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showAssetsCreationDialog_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'showAssetsCreationDialog_promise_002';
      const fileName = 'test.jpeg';
      const path = 'test.jpeg';
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'test3',
          fileNameExtension: 'jpeg',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await copyImageToSandbox(fileName, path);
      await showAssetsCreationDialogPromiseTest(done, testName, photoCreationConfigs, path);
    })

    /**
     * @tc.name   showAssetsCreationDialog_promise_003
     * @tc.number PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_003
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showAssetsCreationDialog_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'showAssetsCreationDialog_promise_003';
      const fileName = 'test6.gif';
      const path = 'test6.gif';
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'test6',
          fileNameExtension: 'gif',
          photoType: photoAccessHelper.PhotoType.IMAGE,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await copyImageToSandbox(fileName, path);
      await showAssetsCreationDialogPromiseTest(done, testName, photoCreationConfigs, path);
    })

    /**
     * @tc.name   showAssetsCreationDialog_promise_004
     * @tc.number PHOTO_ACCESS_HELPER_SHOW_ASSETS_CREATION_DIALOG_004
     * @tc.desc   showAssetsCreationDialog
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('showAssetsCreationDialog_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'showAssetsCreationDialog_promise_004';
      const fileName = '1vp9_320x240_30.mp4';
      const path = '1vp9_320x240_30.mp4';
      let photoCreationConfigs: Array<photoAccessHelper.PhotoCreationConfig> = [
        {
          title: 'test6',
          fileNameExtension: 'mp4',
          photoType: photoAccessHelper.PhotoType.VIDEO,
          subtype: photoAccessHelper.PhotoSubtype.DEFAULT,
        }
      ];
      await copyImageToSandbox(fileName, path);
      await showAssetsCreationDialogPromiseTest(done, testName, photoCreationConfigs, path);
    })
  })
}