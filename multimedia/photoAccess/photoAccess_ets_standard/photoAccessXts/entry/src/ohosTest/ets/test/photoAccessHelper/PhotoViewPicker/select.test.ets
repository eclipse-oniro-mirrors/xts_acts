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
import { getPermission, driveFn, LOG_TAG } from '../../common';
import { BusinessError } from '@kit.BasicServicesKit';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'select';

async function selectPromiseTest(done: Function, testName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
    PhotoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
    PhotoSelectOptions.maxSelectNumber = 50;
    let photoPicker = new photoAccessHelper.PhotoViewPicker();
    photoPicker.select(PhotoSelectOptions);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

async function selectCallbackTest(done: Function, testName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let PhotoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
    PhotoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
    PhotoSelectOptions.maxSelectNumber = 5;
    let photoPicker = new photoAccessHelper.PhotoViewPicker();
    photoPicker.select(PhotoSelectOptions,
      (err: BusinessError, PhotoSelectResult: photoAccessHelper.PhotoSelectResult) => {
        if (err) {
          console.error(`PhotoViewPicker.select failed with err: ${err.code}, ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.info('PhotoViewPicker.select successfully, PhotoSelectResult uri: ' +
          JSON.stringify(PhotoSelectResult));
          done();
        }
      });
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function PhotoViewPickerSelectTest() {
  describe('PhotoViewPickerSelectTest', () => {

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
     * @tc.name   mediaAlbumChangeRequest_select_promise_001
     * @tc.number PHOTO_VIEW_PICKER_SELECT_001
     * @tc.desc   select
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('mediaAlbumChangeRequest_select_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_select_promise_001';
      await selectPromiseTest(done, testName);
    })*/

    /**
     * @tc.name   mediaAlbumChangeRequest_select_callback_001
     * @tc.number PHOTO_VIEW_PICKER_SELECT_002
     * @tc.desc   select
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('mediaAlbumChangeRequest_select_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_select_callback_001';
      await selectCallbackTest(done, testName);
    })*/
  })
}