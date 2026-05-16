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
import common from '@ohos.app.ability.common';
import { describe, it, expect, Level } from '@ohos/hypium';
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { sleep } from '../common';

export default function setOrientationChangeRequestTest() {

  describe('setOrientationChangeRequestTest', () => {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();

    const isEqual = async (assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest, photoAsset: photoAccessHelper.PhotoAsset, orientation: number) => {
      try {
        await helper.applyChanges(assetChangeRequest);
        predicates.equalTo(photoAccessHelper.PhotoKeys.URI, photoAsset.uri);
        const fetchOptionsNew: photoAccessHelper.FetchOptions = {
          fetchColumns: ['orientation'],
          predicates: predicates
        };
        let photoFetchResultNew: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptionsNew);
        let photoAssetNew: photoAccessHelper.PhotoAsset = await photoFetchResultNew.getFirstObject();
        let orientationNew: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.ORIENTATION;
        expect(photoAssetNew.get(orientationNew)).assertEqual(orientation);
      } catch (err) {
        console.error(`Do not isEqual !`);
        expect(false).assertTrue();
      }
    }

    const createMovingPhoto = async (done: Function, testNum: string) => {
      try {
        let displayName: string = "test_moving_photo.jpeg";
        let createOption: photoAccessHelper.PhotoCreateOptions = {
          subtype: photoAccessHelper.PhotoSubtype.MOVING_PHOTO
        };
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, displayName, createOption);
        let photoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg";
        let videoUri = "file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.mp4";
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, photoUri);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, videoUri);
        await helper.applyChanges(assetChangeRequest);
        let assertUri: string = assetChangeRequest.getAsset().uri;
        if (assertUri == undefined || assertUri == "") {
          console.error(`${testNum}::createMovingPhoto :: failed to create moving Photo !`);
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (err) {
        console.error(`getMovingPhotoTest::${testNum}:: failed to createMovingPhoto::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    };

    /**
     * @tc.name   set_orientation_change_request_000
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_0000
     * @tc.desc   change image asset correct orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_orientation_change_request_000';
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['orientation'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        console.info(`${testNum} , old_photoAsset_orientation: ${photoAsset.get('orientation')}`);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
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
     * @tc.name   set_orientation_change_request_001
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_1000
     * @tc.desc   change image asset wrong orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_orientation_change_request_001';
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['orientation'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        let old_photoAsset_orientation = photoAsset.get('orientation');
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newOrientation = 45;
        assetChangeRequest.setOrientation(newOrientation);
        await helper.applyChanges(assetChangeRequest).then(() => {
          console.error(`${testNum} failed`);
        });
        expect(photoAsset.get('orientation')).assertEqual(old_photoAsset_orientation);
        done();
      } catch (error) {
        console.info(`${testNum} successed with error: ${error}`);
        done();
      }
    });

    /**
     * @tc.name   set_orientation_change_request_002
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_2000
     * @tc.desc   change image asset super large orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_orientation_change_request_002';
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 1);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['orientation'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        let old_photoAsset_orientation = photoAsset.get('orientation');
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newOrientation = 1000;
        assetChangeRequest.setOrientation(newOrientation);
        await helper.applyChanges(assetChangeRequest).then(() => {
          console.error(`${testNum} failed`);
        });
        expect(photoAsset.get('orientation')).assertEqual(old_photoAsset_orientation);
        done();
      } catch (error) {
        console.info(`${testNum} successed with error: ${error}`);
        done();
      }
    });

    /**
     * @tc.name   set_orientation_change_request_003
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_3000
     * @tc.desc   change video asset correct orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_orientation_change_request_003';
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_TYPE, 2);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['orientation'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        let old_photoAsset_orientation = photoAsset.get('orientation');
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newOrientation = 90;
        assetChangeRequest.setOrientation(newOrientation);
        await helper.applyChanges(assetChangeRequest).then(() => {
          console.error(`${testNum} failed`);
          expect(false).assertTrue();
        });
        expect(photoAsset.get('orientation')).assertEqual(old_photoAsset_orientation);
        done();
      } catch (error) {
        console.info(`${testNum} successed with error: ${error}`);
        done();
      }
    });

    /**
     * @tc.name   set_orientation_change_request_004
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_4000
     * @tc.desc   change moving pohto asset correct orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_orientation_change_request_004';
      await createMovingPhoto(done, testNum);
      await sleep(3000);
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.PHOTO_SUBTYPE, photoAccessHelper.PhotoSubtype.MOVING_PHOTO);
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['orientation'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        let old_photoAsset_orientation = photoAsset.get('orientation');
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newOrientation = 90;
        assetChangeRequest.setOrientation(newOrientation);
        await helper.applyChanges(assetChangeRequest).then(() => {
          console.error(`${testNum} failed`);
          expect(false).assertTrue();
        });
        expect(photoAsset.get('orientation')).assertEqual(old_photoAsset_orientation);
        done();
      } catch (error) {
        console.info(`${testNum} successed with error: ${error}`);
        done();
      }
    });

    /**
     * @tc.name   set_orientation_change_request_005
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTATION_CHANGE_REQUEST_5000
     * @tc.desc   change gif asset correct orientation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_change_request_005', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_orientation_change_request_005';
      await createMovingPhoto(done, testNum);
      await sleep(3000);
      try {
        predicates.equalTo(photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'test.gif');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: ['orientation'],
          predicates: predicates
        };
        let photoFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await helper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await photoFetchResult.getFirstObject();
        let old_photoAsset_orientation = photoAsset.get('orientation');
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newOrientation = 90;
        assetChangeRequest.setOrientation(newOrientation);
        await helper.applyChanges(assetChangeRequest).then(() => {
          console.error(`${testNum} failed`);
          expect(false).assertTrue();
        });
        expect(photoAsset.get('orientation')).assertEqual(old_photoAsset_orientation);
        done();
      } catch (error) {
        console.info(`${testNum} successed with error: ${error}`);
        done();
      }
    });

  })
}
