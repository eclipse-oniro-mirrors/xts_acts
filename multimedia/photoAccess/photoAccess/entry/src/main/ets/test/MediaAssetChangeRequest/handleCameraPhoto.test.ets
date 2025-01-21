/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import {
  sleep,
  getPermission,
  fetchOption,
  photoKeys,
  pushCreateAsset
} from '../../../../../../../common'

export default function handleCameraPhotoTest() {

  describe('handleCameraPhotoTest', () => {
    beforeAll(async () => {
      console.info('handleCameraPhotoTest beforeAll case');
      await getPermission();
      await sleep()
    });

    const context = globalThis.abilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(context);

    const handleCameraPhotoByExistPhotoAsset = async (done: Function, testNum: string, saveFlag: boolean) => {
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_added', 'date_modified', 'size'],
        predicates: predicates
      };
      try {
        let flag: number = 2;
        let photoAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined = undefined;
        let date_added_before: number | string | boolean = 0;
        let date_modified_before: number | string | boolean = 0;
        let size_before:  number | string | boolean = 0;
        let assetCount = 0;
        while(flag > 0) {
          fetchResult = await helper.getAssets(fetchOptions);
          if (fetchResult !== undefined && fetchResult.getCount() > 0) {
            console.log(`${testNum} :: assetCount == ${fetchResult.getCount()}`);
            photoAsset = await fetchResult.getFirstObject();
            console.log(`${testNum} :: assetCount == ${fetchResult.getCount()}`);
            break;
          } else {
            const fileNameList = ["testSaveCameraPhoto.jpg"];
            await pushCreateAsset(fileNameList);
            continue;
          }
        }
        // before
        date_added_before = photoAsset.get(photoKeys.DATE_ADDED);
        date_modified_before = photoAsset.get(photoKeys.DATE_MODIFIED);
        size_before = photoAsset.get(photoKeys.SIZE);
        assetCount = fetchResult.getCount();
        console.log(`${testNum} :: Before :: date_added is ${date_added_before}, date_modified is ${date_modified_before}, assetCount is ${assetCount}`);
        // saveCameraPhoto applyChanges, then query
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        if (saveFlag) {
          assetChangeRequest.saveCameraPhoto();
        } else {
          assetChangeRequest.discardCameraPhoto();
        }
        await helper.applyChanges(assetChangeRequest);
        console.info(`${testNum} :: apply change successfully`);
        let fetchResult2: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        let asset = await fetchResult2.getFirstObject();
        console.log(`${testNum} :: after change apply, get photoAsset data`);
        // after
        let date_added_after = asset.get(photoKeys.DATE_ADDED);
        let date_modified_after = asset.get(photoKeys.DATE_MODIFIED);
        let size_after = asset.get(photoKeys.SIZE);
        let count = fetchResult2.getCount();
        console.log(`${testNum} :: After :: date_added is ${date_added_after}, date_modified is ${date_modified_after}, assetCount is ${count}`);
        expect(count).assertEqual(assetCount);
        expect(date_added_after).assertEqual(date_added_before);
        expect(date_modified_after).assertEqual(date_modified_before);
        expect(size_after).assertEqual(size_before);
        done();
      } catch(error) {
        console.error(`${testNum} :: handleCameraPhotoByExistPhotoAsset failed with error: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number : Sub_PhotoAccess_Helper_Save_Camera_Photo_001
     * @tc.name : save_camera_photo_by_exist_photo_asset_001
     * @tc.desc : add existing photoAsset as param to saveCameraPhoto interface
     * @tc.size : MEDIUM
     * @tc.type : Function
     * @tc.level : Level 0
     */
    it('save_camera_photo_by_exist_photo_asset_001', 0, async (done) => {
      let testNum = 'save_camera_photo_by_exist_photo_asset_001';
      handleCameraPhotoByExistPhotoAsset(done, testNum, true);
    })

    /**
     * @tc.number : Sub_PhotoAccess_Helper_Discard_Camera_Photo_001
     * @tc.name : discard_camera_photo_by_exist_photo_asset_001
     * @tc.desc : add existing photoAsset as param to discardCameraPhoto interface, expect fail
     * @tc.size : MEDIUM
     * @tc.type : Function
     * @tc.level : Level 0
     */
    it('discard_camera_photo_by_exist_photo_asset_001', 0, async (done) => {
      let testNum = 'discard_camera_photo_by_exist_photo_asset_001';
      handleCameraPhotoByExistPhotoAsset(done, testNum, false);
    })

  })
}