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
import { getPermission, driveFn, LOG_TAG, fetchAllOption } from '../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'photoAccessHelperEnumImageFileType';

async function saveCameraPhotoPromiseTest(done: Function, testName: string,
  imageType?: photoAccessHelper.ImageFileType) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchAllOption());
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
      new photoAccessHelper.MediaAssetChangeRequest(asset);
    if (imageType) {
      await assetChangeRequest.saveCameraPhoto(imageType);
    } else {
      await assetChangeRequest.saveCameraPhoto();
    }
    await phAccessHelper.applyChanges(assetChangeRequest);
    console.info('apply saveCameraPhoto successfully');
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code},${error.message}`, testName);
    expect().assertFail();
    done();
  }
}

export default function photoAccessHelperEnumImageFileType() {
  describe('photoAccessHelperEnumImageFileType', () => {

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
     * @tc.number PHOTO_ACCESS_HELPER_ENUM1_001
     * @tc.name   PHOTO_ACCESS_HELPER_ENUM1_001
     * @tc.desc   photoAccessHelper.ImageFileType
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PHOTO_ACCESS_HELPER_ENUM1_001', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_001---------')
      expect(photoAccessHelper.ImageFileType.JPEG == 1).assertTrue();
      expect(photoAccessHelper.ImageFileType.HEIF == 2).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_001,end here---------')
      done();
    })
    /**
     * @tc.number PHOTO_ACCESS_HELPER_ENUM1_002
     * @tc.name   PHOTO_ACCESS_HELPER_ENUM1_002
     * @tc.desc   photoAccessHelper.ResourceType
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PHOTO_ACCESS_HELPER_ENUM1_002', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_002---------')
      expect(photoAccessHelper.ResourceType.IMAGE_RESOURCE == 1).assertTrue();
      expect(photoAccessHelper.ResourceType.VIDEO_RESOURCE == 2).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_002,end here---------')
      done();
    })
    /**
     * @tc.number PHOTO_ACCESS_HELPER_ENUM1_003
     * @tc.name   PHOTO_ACCESS_HELPER_ENUM1_003
     * @tc.desc   photoAccessHelper.FilterOperator
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PHOTO_ACCESS_HELPER_ENUM1_003', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_003---------')
      expect(photoAccessHelper.FilterOperator.BETWEEN == 6).assertTrue();
      expect(photoAccessHelper.FilterOperator.LESS_THAN_OR_EQUAL_TO == 5).assertTrue();
      expect(photoAccessHelper.FilterOperator.MORE_THAN_OR_EQUAL_TO == 4).assertTrue();
      expect(photoAccessHelper.FilterOperator.LESS_THAN == 3).assertTrue();
      expect(photoAccessHelper.FilterOperator.MORE_THAN == 2).assertTrue();
      expect(photoAccessHelper.FilterOperator.NOT_EQUAL_TO == 1).assertTrue();
      expect(photoAccessHelper.FilterOperator.EQUAL_TO == 0).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_003,end here---------')
      done();
    })
    /**
     * @tc.number PHOTO_ACCESS_HELPER_ENUM1_004
     * @tc.name   PHOTO_ACCESS_HELPER_ENUM1_004
     * @tc.desc   photoAccessHelper.SingleSelectionMode
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PHOTO_ACCESS_HELPER_ENUM1_004', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_004---------')
      expect(photoAccessHelper.SingleSelectionMode.BROWSER_MODE == 0).assertTrue();
      expect(photoAccessHelper.SingleSelectionMode.SELECT_MODE == 1).assertTrue();
      expect(photoAccessHelper.SingleSelectionMode.BROWSER_AND_SELECT_MODE == 2).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_004,end here---------')
      done();
    })
    /**
     * @tc.number PHOTO_ACCESS_HELPER_ENUM1_005
     * @tc.name   PHOTO_ACCESS_HELPER_ENUM1_005
     * @tc.desc   photoAccessHelper.PhotoViewMIMETypes
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PHOTO_ACCESS_HELPER_ENUM1_005', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_005---------')
      expect(photoAccessHelper.PhotoViewMIMETypes.MOVING_PHOTO_IMAGE_TYPE == 'image/movingPhoto').assertTrue();
      expect(photoAccessHelper.PhotoViewMIMETypes.IMAGE_VIDEO_TYPE == '*/*').assertTrue();
      expect(photoAccessHelper.PhotoViewMIMETypes.VIDEO_TYPE == 'video/*').assertTrue();
      expect(photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE == 'image/*').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_005,end here---------')
      done();
    })
    /**
     * @tc.number PHOTO_ACCESS_HELPER_ENUM1_006
     * @tc.name   PHOTO_ACCESS_HELPER_ENUM1_006
     * @tc.desc   photoAccessHelper.DefaultChangeUri
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PHOTO_ACCESS_HELPER_ENUM1_006', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_006---------')
      expect(photoAccessHelper.DefaultChangeUri.DEFAULT_PHOTO_URI == 'file://media/Photo').assertTrue();
      expect(photoAccessHelper.DefaultChangeUri.DEFAULT_ALBUM_URI == 'file://media/PhotoAlbum').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_006,end here---------')
      done();
    })
    /**
     * @tc.number PHOTO_ACCESS_HELPER_ENUM1_007
     * @tc.name   PHOTO_ACCESS_HELPER_ENUM1_007
     * @tc.desc   photoAccessHelper.NotifyType
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('PHOTO_ACCESS_HELPER_ENUM1_007', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_007---------')
      expect(photoAccessHelper.NotifyType.NOTIFY_ADD == 0).assertTrue();
      expect(photoAccessHelper.NotifyType.NOTIFY_UPDATE ==1).assertTrue();
      expect(photoAccessHelper.NotifyType.NOTIFY_REMOVE ==2).assertTrue();
      expect(photoAccessHelper.NotifyType.NOTIFY_ALBUM_ADD_ASSET ==3).assertTrue();
      expect(photoAccessHelper.NotifyType.NOTIFY_ALBUM_REMOVE_ASSET ==4).assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_ENUM1_007,end here---------')
      done();
    })


  })
}