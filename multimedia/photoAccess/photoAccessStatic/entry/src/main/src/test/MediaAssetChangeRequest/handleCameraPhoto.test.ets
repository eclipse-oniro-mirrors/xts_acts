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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import Context from "application.Context"
import { BusinessError } from '@ohos.base';
import { sleep, getPermission, fetchOption, pushCreateAsset, driveFn } from '../Common.test.ets'

export default function handleCameraPhotoTest() {

  describe('handleCameraPhotoTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
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
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    const handleCameraPhotoByExistPhotoAsset =
      async (done: () => void, testNum: string, saveFlag: boolean): Promise<void> => {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['date_added', 'date_modified', 'size'],
          predicates: predicates
        };
        try {
          let flag: number = 2;
          let photoAsset: photoAccessHelper.PhotoAsset | undefined = undefined;
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined = undefined;
          let date_added_before: int | long | number | string | boolean | undefined = 0 as Int;
          let date_modified_before: int | long | number | string | boolean | undefined = 0 as Int;
          let size_before: int | long | number | string | boolean | undefined = 0 as Int;
          let assetCount: int | undefined = 0;
          while (flag > 0) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
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
          date_added_before = photoAsset?.get(photoAccessHelper.PhotoKeys.DATE_ADDED);
          date_modified_before = photoAsset?.get(photoAccessHelper.PhotoKeys.DATE_MODIFIED);
          size_before = photoAsset?.get(photoAccessHelper.PhotoKeys.SIZE);
          assetCount = fetchResult?.getCount();
          console.log(`${testNum} :: Before :: date_added is ${date_added_before}, date_modified is ${date_modified_before}, assetCount is ${assetCount}`);
          if (photoAsset) {
            let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
              new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
            if (saveFlag) {
              assetChangeRequest.saveCameraPhoto();
            } else {
              assetChangeRequest.discardCameraPhoto();
            }
            await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(assetChangeRequest);
          }
          console.info(`${testNum} :: apply change successfully`);
          let fetchResult2: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          let asset = await fetchResult2.getFirstObject();
          console.log(`${testNum} :: after change apply, get photoAsset data`);
          let date_added_after = asset.get(photoAccessHelper.PhotoKeys.DATE_ADDED);
          let date_modified_after = asset.get(photoAccessHelper.PhotoKeys.DATE_MODIFIED);
          let size_after = asset.get(photoAccessHelper.PhotoKeys.SIZE);
          let count = fetchResult2.getCount();
          console.log(`${testNum} :: After :: date_added is ${date_added_after}, date_modified is ${date_modified_after}, assetCount is ${count}`);
          expect(count).assertEqual(assetCount);
          expect(date_added_after).assertEqual(date_added_before);
          expect(date_modified_after).assertEqual(date_modified_before);
          expect(size_after).assertEqual(size_before);
          done();
        } catch (error: BusinessError) {
          console.error(`${testNum} :: handleCameraPhotoByExistPhotoAsset failed with error: ${error.code}, ${error.message}`);
          expect(false).assertTrue();
          done();
        }
      }


    const getAssetsCount = async (testNum: string): Promise<number> => {
      let count: number = -1;
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
        count = fetchResult.getCount();
        fetchResult.close();
        return count;
      } catch (error) {
        console.info(`${testNum} getAssets count failed, error: ${error}`);
        return count;
      }
    }

    const saveCameraPhotoException = async (done: () => void, testNum: string, type: photoAccessHelper.ImageFileType,
      ops: photoAccessHelper.FetchOptions): Promise<void> => {
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(ops)
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let date_added_before = photoAsset.get(photoAccessHelper.PhotoKeys.DATE_ADDED);
        let date_modified_before = photoAsset.get(photoAccessHelper.PhotoKeys.DATE_MODIFIED);
        let size_before = photoAsset.get(photoAccessHelper.PhotoKeys.SIZE);
        let count_before = await getAssetsCount(testNum)
        console.log(`${testNum} :: before :: date_added is ${date_added_before}, date_modified is ${date_modified_before}, size is ${size_before}, assetCount is ${count_before}`);

        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        assetChangeRequest.saveCameraPhoto(type);
        await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(assetChangeRequest);
        let fetchResult2: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(ops)
        let photoAsset2: photoAccessHelper.PhotoAsset = await fetchResult2.getFirstObject();
        let date_added_after = photoAsset2.get(photoAccessHelper.PhotoKeys.DATE_ADDED);
        let date_modified_after = photoAsset2.get(photoAccessHelper.PhotoKeys.DATE_MODIFIED);
        let size_after = photoAsset2.get(photoAccessHelper.PhotoKeys.SIZE);
        let count_after = await getAssetsCount(testNum)
        console.log(`${testNum} :: after :: date_added is ${date_added_after}, date_modified is ${date_modified_after}, size is ${size_after}, assetCount is ${count_after}`);

        expect(date_added_before).assertEqual(date_added_after);
        expect(date_modified_before).assertEqual(date_modified_after);
        expect(size_before).assertEqual(size_after);
        expect(count_before).assertEqual(count_after);
        done()
      } catch (error: BusinessError) {
        console.error(`${testNum} :: saveCameraPhotoException failed with error: ${error.code}, ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    }


    /**
     * @tc.name   save_camera_photo_by_exist_photo_asset_static_001
     * @tc.number Sub_PhotoAccess_Helper_Save_Camera_Photo_Static_001
     * @tc.desc   add existing photoAsset as param to saveCameraPhoto interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('save_camera_photo_by_exist_photo_asset_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'save_camera_photo_by_exist_photo_asset_static_001';
        handleCameraPhotoByExistPhotoAsset(done, testNum, true);
      })

    /**
     * @tc.name   discard_camera_photo_by_exist_photo_asset_static_001
     * @tc.number Sub_PhotoAccess_Helper_Discard_Camera_Photo_Static_001
     * @tc.desc   add existing photoAsset as param to discardCameraPhoto interface, expect fail
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('discard_camera_photo_by_exist_photo_asset_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'discard_camera_photo_by_exist_photo_asset_static_001';
        handleCameraPhotoByExistPhotoAsset(done, testNum, false);
      })

    /**
     * @tc.name   save_camera_photo_by_exist_photo_asset_static_002
     * @tc.number Sub_PhotoAccess_Helper_Save_Camera_Photo_Static_002
     * @tc.desc   add existing photoAsset as param to saveCameraPhoto interface using JPEG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('save_camera_photo_by_exist_photo_asset_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum: string = 'save_camera_photo_by_exist_photo_asset_static_002';
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'testSaveCameraPhoto02.jpg')
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['date_added', 'date_modified', 'size'],
          predicates: predicates
        };
        await saveCameraPhotoException(done, testNum, photoAccessHelper.ImageFileType.JPEG, fetchOptions)
      })

    /**
     * @tc.name   save_camera_photo_by_exist_photo_asset_static_003
     * @tc.number Sub_PhotoAccess_Helper_Save_Camera_Photo_Static_003
     * @tc.desc   add existing photoAsset as param to saveCameraPhoto interface using HEIF
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('save_camera_photo_by_exist_photo_asset_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum: string = 'save_camera_photo_by_exist_photo_asset_static_003';
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