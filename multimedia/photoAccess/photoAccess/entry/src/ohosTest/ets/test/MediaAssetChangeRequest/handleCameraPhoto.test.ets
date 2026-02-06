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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import {
  sleep,
  getPermission,
  fetchOption,
  photoKeys,
  pushCreateAsset,
  driveFn
} from '../common'
import common from '@ohos.app.ability.common'

export default function handleCameraPhotoTest() {

  describe('handleCameraPhotoTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      const fileNames: Array<string> = [
        "testSaveCameraPhoto02.jpg", "testSaveCameraPhoto03.jpg",
      ];
      await pushCreateAsset(testContext, fileNames);
    });

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

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
        let date_added_before: number | string | boolean | undefined = 0;
        let date_modified_before: number | string | boolean | undefined = 0;
        let size_before:  number | string | boolean | undefined = 0;
        let assetCount : number | undefined = 0;
        while(flag > 0) {
          fetchResult = await helper.getAssets(fetchOptions);
          if (fetchResult !== undefined && fetchResult.getCount() > 0) {
            console.log(`${testNum} :: assetCount == ${fetchResult.getCount()}`);
            photoAsset = await fetchResult.getFirstObject();
            console.log(`${testNum} :: assetCount == ${fetchResult.getCount()}`);
            break;
          } else {
            const fileNameList = ["testSaveCameraPhoto.jpg"];
            await pushCreateAsset(testContext, fileNameList);
            continue;
          }
        }
        // before
        date_added_before = photoAsset?.get(photoKeys.DATE_ADDED);
        date_modified_before = photoAsset?.get(photoKeys.DATE_MODIFIED);
        size_before = photoAsset?.get(photoKeys.SIZE);
        assetCount = fetchResult?.getCount();
        console.log(`${testNum} :: Before :: date_added is ${date_added_before}, date_modified is ${date_modified_before}, assetCount is ${assetCount}`);
        // saveCameraPhoto applyChanges, then query
        if(photoAsset){
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
          if (saveFlag) {
            assetChangeRequest.saveCameraPhoto();
          } else {
            assetChangeRequest.discardCameraPhoto();
          }
          await helper.applyChanges(assetChangeRequest);
        }
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


    const getAssetsCount = async (testNum: string): Promise<number> => {
      let count = -1;
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        count = fetchResult.getCount();
        fetchResult.close();
        return count;
      } catch (error) {
        console.info(`${testNum} getAssets count failed, error: ${error}`);
        return count;
      }
    }

    const saveCameraPhotoException = async (done: Function, testNum: string, type: photoAccessHelper.ImageFileType, ops: photoAccessHelper.FetchOptions) => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(ops)
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        // before
        let date_added_before = photoAsset.get(photoKeys.DATE_ADDED);
        let date_modified_before = photoAsset.get(photoKeys.DATE_MODIFIED);
        let size_before = photoAsset.get(photoKeys.SIZE);
        let count_before = await getAssetsCount(testNum)
        console.log(`${testNum} :: before :: date_added is ${date_added_before}, date_modified is ${date_modified_before}, size is ${size_before}, assetCount is ${count_before}`);

        // saveCameraPhoto
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        assetChangeRequest.saveCameraPhoto(type);
        await helper.applyChanges(assetChangeRequest);

        // after
        let fetchResult2: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(ops)
        let photoAsset2: photoAccessHelper.PhotoAsset = await fetchResult2.getFirstObject();
        let date_added_after = photoAsset2.get(photoKeys.DATE_ADDED);
        let date_modified_after = photoAsset2.get(photoKeys.DATE_MODIFIED);
        let size_after = photoAsset2.get(photoKeys.SIZE);
        let count_after = await getAssetsCount(testNum)
        console.log(`${testNum} :: after :: date_added is ${date_added_after}, date_modified is ${date_modified_after}, size is ${size_after}, assetCount is ${count_after}`);

        expect(date_added_before).assertEqual(date_added_after);
        expect(date_modified_before).assertEqual(date_modified_after);
        expect(size_before).assertEqual(size_after);
        expect(count_before).assertEqual(count_after);
        done()
      } catch(error) {
        console.error(`${testNum} :: saveCameraPhotoException failed with error: ${error.code}, ${error.message}`);
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
    it('save_camera_photo_by_exist_photo_asset_001', Level.LEVEL0, async (done: Function) => {
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
    it('discard_camera_photo_by_exist_photo_asset_001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'discard_camera_photo_by_exist_photo_asset_001';
      handleCameraPhotoByExistPhotoAsset(done, testNum, false);
    })

    /**
     * @tc.number : Sub_PhotoAccess_Helper_Save_Camera_Photo_002
     * @tc.name : save_camera_photo_by_exist_photo_asset_002
     * @tc.desc : add existing photoAsset as param to saveCameraPhoto interface using JPEG
     * @tc.size : MEDIUM
     * @tc.type : Function
     * @tc.level : Level 0
     */
    it('save_camera_photo_by_exist_photo_asset_002', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'save_camera_photo_by_exist_photo_asset_002';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'testSaveCameraPhoto02.jpg')
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_added', 'date_modified', 'size'],
        predicates: predicates
      };
      await saveCameraPhotoException(done, testNum, photoAccessHelper.ImageFileType.JPEG, fetchOptions)
    })

    /**
     * @tc.number : Sub_PhotoAccess_Helper_Save_Camera_Photo_003
     * @tc.name : save_camera_photo_by_exist_photo_asset_003
     * @tc.desc : add existing photoAsset as param to saveCameraPhoto interface using HEIF
     * @tc.size : MEDIUM
     * @tc.type : Function
     * @tc.level : Level 0
     */
    it('save_camera_photo_by_exist_photo_asset_003', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'save_camera_photo_by_exist_photo_asset_003';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'testSaveCameraPhoto03.jpg')
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: ['date_added', 'date_modified', 'size'],
        predicates: predicates
      };
      await saveCameraPhotoException(done, testNum, photoAccessHelper.ImageFileType.HEIF, fetchOptions)
    })

  })
}