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
import { getPermission, driveFn, fetchAllOption } from '../../test/common';
import common from '@ohos.app.ability.common';
import { JSON } from '@kit.ArkTS';

const TAG =  'photoAccessHelperSaveCameraPhoto';


export default function MediaAssetChangeRequestSaveCameraPhoto() {
  describe('MediaAssetChangeRequestSaveCameraPhoto', () => {

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
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SAVE_CAMERA_PHOTO_001
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SAVE_CAMERA_PHOTO_001
     * @tc.desc    saveCameraPhoto(imageFileType: ImageFileType): void
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SAVE_CAMERA_PHOTO_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SAVE_CAMERA_PHOTO_001';
      const imageType = photoAccessHelper.ImageFileType.JPEG;
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchAllOption());
        console.info(TAG,testName,'getAssets  succcess');
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        console.info(TAG,testName,'init  succcess');
        if (imageType) {
          await assetChangeRequest.saveCameraPhoto(imageType);
          console.info(TAG,testName,'imageType save succcess');
        } else {
          await assetChangeRequest.saveCameraPhoto();
        }
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG,testName,'apply saveCameraPhoto successfully');
        const updatedFetchResult = await phAccessHelper.getAssets(fetchAllOption());
        let res = updatedFetchResult.getCount()
        console.info(TAG,testName,'expect begin call',JSON.stringify(res));
        const updatedAsset = await updatedFetchResult.getFirstObject();
        console.info(TAG,testName,'done begin call');
        done();


      } catch (error) {
        console.info(TAG,testName, `failed; error: `,error);
        expect().assertFail();
        console.info(TAG,testName,'done begin call');
        done();
      }
    })
    /**
     * @tc.number  SUB_PHOTO_ACCESS_HELPER_SAVE_CAMERA_PHOTO_002
     * @tc.name    SUB_PHOTO_ACCESS_HELPER_SAVE_CAMERA_PHOTO_002
     * @tc.desc    saveCameraPhoto(imageFileType: ImageFileType): void
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_SAVE_CAMERA_PHOTO_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_SAVE_CAMERA_PHOTO_002';
      const imageType = photoAccessHelper.ImageFileType.HEIF;
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchAllOption());
        console.info(TAG,testName,'getAssets  success');
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        console.info(TAG,testName,'init  succcess');
        if (imageType) {
          await assetChangeRequest.saveCameraPhoto(imageType);
          console.info(TAG,testName,'imageType save succcess');
        } else {
          await assetChangeRequest.saveCameraPhoto();
        }
        await phAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG,testName,'apply saveCameraPhoto successfully');
        const updatedFetchResult = await phAccessHelper.getAssets(fetchAllOption());
        let res = updatedFetchResult.getCount()
        console.info(TAG,testName,'expect begin call',JSON.stringify(res));
        const updatedAsset = await updatedFetchResult.getFirstObject();
        console.info(TAG,testName,'done begin call');
        done();


      } catch (error) {
        console.info(TAG,testName, `failed; error: `,error);
        expect().assertFail();
        console.info(TAG,testName,'done begin call');
        done();
      }
    })

  })

}