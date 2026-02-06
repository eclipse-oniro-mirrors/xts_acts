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
import { describe, it, expect, Hypium, TestType, Size, Level } from '../../../../hypium/index';
import Context from "application.Context"
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { sleep } from '../Common.test.ets';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'

export default function setOrientationChangeRequestTest() {

  describe('setOrientationChangeRequestTest', () => {

    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();

    const isEqual =
      async (assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest, photoAsset: photoAccessHelper.PhotoAsset,
        orientation: number) => {
        try {
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(assetChangeRequest);
          predicates.equalTo(photoAccessHelper.PhotoKeys.URI, photoAsset.uri);
          const fetchOptionsNew: photoAccessHelper.FetchOptions = {
            fetchColumns: ['orientation'],
            predicates: predicates
          };
          let photoFetchResultNew: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptionsNew);
          let photoAssetNew: photoAccessHelper.PhotoAsset = await photoFetchResultNew.getFirstObject();
          let orientationNew: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.ORIENTATION;
          expect(photoAssetNew.get(orientationNew)).assertEqual(orientation);
        } catch (err) {
          console.error(`Do not isEqual !`);
        }
      }

    /**
     * @tc.name   set_orientation_change_request_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_STATIC_0000
     * @tc.desc   change image asset correct orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'set_orientation_change_request_static_000';
        try {
          predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1 as long);
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['orientation'],
            predicates: predicates
          };
          let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
          console.info(`${testNum} , old_photoAsset_orientation: ${photoAsset.get('orientation')}`);
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
          let newOrientation = 90;
          assetChangeRequest.setOrientation(newOrientation);
          try {
            await isEqual(assetChangeRequest, photoAsset, 90);
            console.info(`${testNum} successed`);
          } catch (error) {
            await isEqual(assetChangeRequest, photoAsset, 0);
            console.error(`${testNum} applyChanges failed with error: ${error}`);
          }
          let newOrientation_0 = 0;
          assetChangeRequest.setOrientation(newOrientation_0);
          try {
            await isEqual(assetChangeRequest, photoAsset, 0);
            console.info(`${testNum} successed`);
          } catch (error) {
            await isEqual(assetChangeRequest, photoAsset, 90);
            console.error(`${testNum} applyChanges failed with error: ${error}`);
          }
          let newOrientation_180 = 180;
          assetChangeRequest.setOrientation(newOrientation_180);
          try {
            await isEqual(assetChangeRequest, photoAsset, 180);
            console.info(`${testNum} successed`);
          } catch (error) {
            await isEqual(assetChangeRequest, photoAsset, 0);
            console.error(`${testNum} applyChanges failed with error: ${error}`);
          }
          let newOrientation_270 = 270;
          assetChangeRequest.setOrientation(newOrientation_270);
          try {
            await isEqual(assetChangeRequest, photoAsset, 270);
            console.info(`${testNum} successed`);
          } catch (error) {
            await isEqual(assetChangeRequest, photoAsset, 180);
            console.error(`${testNum} applyChanges failed with error: ${error}`);
          }
          console.info(`${testNum} , new_photoAsset_orientation: ${photoAsset.get('orientation')}`);
          done();
        } catch (error) {
          console.error(`${testNum} failed with error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   set_orientation_change_request_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_STATIC_1000
     * @tc.desc   change image asset wrong orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'set_orientation_change_request_static_001';
        try {
          predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1 as long);
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['orientation'],
            predicates: predicates
          };
          let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
          let old_photoAsset_orientation = photoAsset.get('orientation');
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
          let newOrientation = 45;
          assetChangeRequest.setOrientation(newOrientation);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(assetChangeRequest).then(() => {
            console.error(`${testNum} failed`);
          });
          expect(photoAsset.get('orientation')).assertEqual(old_photoAsset_orientation);
          done();
        } catch (error) {
          done();
        }
      });

    /**
     * @tc.name   set_orientation_change_request_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_STATIC_2000
     * @tc.desc   change image asset super large orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'set_orientation_change_request_static_002';
        try {
          predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1 as long);
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['orientation'],
            predicates: predicates
          };
          let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
          let old_photoAsset_orientation = photoAsset.get('orientation');
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
          let newOrientation = 1000;
          assetChangeRequest.setOrientation(newOrientation);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(assetChangeRequest).then(() => {
            console.error(`${testNum} failed`);
          });
          expect(photoAsset.get('orientation')).assertEqual(old_photoAsset_orientation);
          done();
        } catch (error) {
          done();
        }
      });

    /**
     * @tc.name   set_orientation_change_request_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_STATIC_3000
     * @tc.desc   change video asset correct orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'set_orientation_change_request_static_003';
        try {
          predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 2 as long);
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: ['orientation'],
            predicates: predicates
          };
          let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOptions);
          let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
          let old_photoAsset_orientation = photoAsset.get('orientation');
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
            new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
          let newOrientation = 90;
          assetChangeRequest.setOrientation(newOrientation);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(assetChangeRequest).then(() => {
            console.error(`${testNum} failed`);
            expect(false).assertTrue();
          });
          expect(photoAsset.get('orientation')).assertEqual(old_photoAsset_orientation);
          done();
        } catch (error) {
          done();
        }
      });
  })
}