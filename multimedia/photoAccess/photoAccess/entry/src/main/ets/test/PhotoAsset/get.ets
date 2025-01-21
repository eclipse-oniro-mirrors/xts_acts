/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll } from "@ohos/hypium";
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
  getAssetId,
  isNum,
  photoType,
  getBurstKey,
  pushCreateAsset,
  sleep,
  getPermission
} from '../../../../../../../common'

export default function getTest () {
  describe('getTest', function () {

    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);
    const fileNameList = ["getTest.jpg", "getTest.mp4"];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep();
      await pushCreateAsset(fileNameList);
    });

    const checkProvisionAsset = async (done: Function, testNum: string, displayName: string) => {
      try {
        const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOps);
        let fetchCount = fetchResult.getCount();
        console.log(`${testNum} :: fetchCount is ${fetchCount}`);
        if (fetchCount <= 0) {
          console.error(`${testNum} :: checkProvisionAsset :: have no Asset displayName is ${displayName}!`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.error(`${testNum} :: checkProvisionAsset failed, err ==> ${error}!`);
        expect(false).assertTrue();
        done();
      }
    }

    const checkPhotoKeysDateTime = async (done: Function, testNum: string, expectDateMs: number, actualDateMs: number) => {
      try {
        console.log(`${testNum} :: expectDateMs is ${expectDateMs}, actualDateMs is ${actualDateMs}`);
        let lowRange = 0.998 * expectDateMs;
        let topRange = 1.002 * expectDateMs;
        if (lowRange <= actualDateMs <= topRange) {
          console.log(`${testNum} :: ${actualDateMs} is between ${lowRange} and ${topRange} .`);
          done();
        } else {
          console.log(`${testNum} :: ${actualDateMs} is not between ${lowRange} and ${topRange}, failed !`);
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        console.log(`${testNum} :: checkPhotoKeysDateTime error , err is ${error} !`);
        expect(false).assertTrue();
        done();
      }
    }

    async function checkPhotoKeysValue (done, testNum, fetchOps, key, value) {
      try {
        let asset = await getFileAsset(testNum, fetchOps);
        console.info(`${testNum} key: ${key}, value: ${value}, asset.key: ${asset.get(key)}`);
        if (key === 'uri') {
          const id = getAssetId(asset.get(key));
          const expectUri = value + id;
          const uri = asset.get(key).toString();
          const isIncludes = uri.includes(expectUri);
          expect(isIncludes).assertTrue();
        } else if (key === 'date_added' || key === 'date_modified' || key === 'date_taken' || key === 'date_added_ms' || key === 'date_modified_ms') {
          expect(isNum(asset.get(key))).assertTrue();
        } else {
          expect(asset.get(key)).assertEqual(value);
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    //callback
    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0000
     * @tc.name      : get_image_uri_001
     * @tc.desc      : image get photoKeys.URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_uri_001', 2, async function (done) {
      const testNum = 'get_image_uri_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.URI;
      const value = 'file://media/Photo/';
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0100
     * @tc.name      : get_image_photo_type_001
     * @tc.desc      : image get photoKeys.PHOTO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_photo_type_001', 2, async function (done) {
      const testNum = 'get_image_photo_type_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.PHOTO_TYPE;
      const value = photoType.IMAGE;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0200
     * @tc.name      : get_image_displayName_001
     * @tc.desc      : image get photoKeys.DISPLAY_NAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_displayName_001', 2, async function (done) {
      const testNum = 'get_image_displayName_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DISPLAY_NAME;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, displayName);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0300
     * @tc.name      : get_image_date_added_001
     * @tc.desc      : image get photoKeys.DATE_ADDED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_date_added_001', 2, async function (done) {
      const testNum = 'get_image_date_added_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DATE_ADDED;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0400
     * @tc.name      : get_image_date_modified_001
     * @tc.desc      : image get photoKeys.DATE_MODIFIED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_date_modified_001', 2, async function (done) {
      const testNum = 'get_image_date_modified_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DATE_MODIFIED;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0500
     * @tc.name      : get_image_duration_001
     * @tc.desc      : image get photoKeys.DURATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_duration_001', 2, async function (done) {
      const testNum = 'get_image_duration_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DURATION;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0600
     * @tc.name      : get_image_width_001
     * @tc.desc      : image get photoKeys.WIDTH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_width_001', 2, async function (done) {
      const testNum = 'get_image_width_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.WIDTH;
      const value = 1279;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0700
     * @tc.name      : get_image_height_001
     * @tc.desc      : image get photoKeys.HEIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_height_001', 2, async function (done) {
      const testNum = 'get_image_height_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.HEIGHT;
      const value = 1706;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0800
     * @tc.name      : get_image_date_taken_001
     * @tc.desc      : image get photoKeys.DATE_TAKEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_date_taken_001', 2, async function (done) {
      const testNum = 'get_image_date_taken_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DATE_TAKEN;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_0900
     * @tc.name      : get_image_orientation_001
     * @tc.desc      : image get photoKeys.ORIENTATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_orientation_001', 2, async function (done) {
      const testNum = 'get_image_orientation_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.ORIENTATION;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1000
     * @tc.name      : get_image_favorite_001
     * @tc.desc      : image get photoKeys.FAVORITE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_favorite_001', 2, async function (done) {
      const testNum = 'get_image_favorite_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.FAVORITE;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1100
     * @tc.name      : get_image_size_001
     * @tc.desc      : image get photoKeys.SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_size_001', 2, async function (done) {
      const testNum = 'get_image_size_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.SIZE;
      const value = 348113;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1200
     * @tc.name      : get_image_title_001
     * @tc.desc      : image get photoKeys.TITLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_title_001', 2, async function (done) {
      const testNum = 'get_image_title_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.TITLE;
      const value = 'getTest';
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1300
     * @tc.name      : get_image_position_001
     * @tc.desc      : image get photoKeys.POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_position_001', 2, async function (done) {
      const testNum = 'get_image_position_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.POSITION;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1400
     * @tc.name      : get_image_date_trash_001
     * @tc.desc      : image get photoKeys.DATE_TRASHED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_date_trash_001', 2, async function (done) {
      const testNum = 'get_image_date_trash_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DATE_TRASHED;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_1500
     * @tc.name      : get_image_hidden_001
     * @tc.desc      : image get photoKeys.HIDDEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_hidden_001', 2, async function (done) {
      const testNum = 'get_image_hidden_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.HIDDEN;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    //video
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5000
     * @tc.name      : get_video_uri_001
     * @tc.desc      : video get photoKeys.URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_uri_001', 2, async function (done) {
      const testNum = 'get_video_uri_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.URI;
      const value = 'file://media/Photo/';
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5100
     * @tc.name      : get_video_photo_type_001
     * @tc.desc      : video get photoKeys.PHOTO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_photo_type_001', 2, async function (done) {
      const testNum = 'get_video_photo_type_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.PHOTO_TYPE;
      const value = photoType.VIDEO;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5200
     * @tc.name      : get_video_display_name_001
     * @tc.desc      : video get photoKeys.DISPLAY_NAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_display_name_001', 2, async function (done) {
      const testNum = 'get_052';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DISPLAY_NAME;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, displayName);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5300
     * @tc.name      : get_video_date_added_001
     * @tc.desc      : video get photoKeys.DATE_ADDED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_added_001', 2, async function (done) {
      const testNum = 'get_video_date_added_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DATE_ADDED;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5400
     * @tc.name      : get_video_date_modified_001
     * @tc.desc      : video get photoKeys.DATE_MODIFIED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_modified_001', 2, async function (done) {
      const testNum = 'get_video_date_modified_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DATE_MODIFIED;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5500
     * @tc.name      : get_video_duration_001
     * @tc.desc      : video get photoKeys.DURATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_duration_001', 2, async function (done) {
      const testNum = 'get_video_duration_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DURATION;
      const value = 10100;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5600
     * @tc.name      : get_video_width_001
     * @tc.desc      : video get photoKeys.WIDTH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_width_001', 2, async function (done) {
      const testNum = 'get_video_width_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.WIDTH;
      const value = 1280;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5700
     * @tc.name      : get_video_height_001
     * @tc.desc      : video get photoKeys.HEIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_height_001', 2, async function (done) {
      const testNum = 'get_video_height_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.HEIGHT;
      const value = 720;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5800
     * @tc.name      : get_video_date_taken_001
     * @tc.desc      : video get photoKeys.DATE_TAKEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_taken_001', 2, async function (done) {
      const testNum = 'get_video_date_taken_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DATE_TAKEN;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_5900
     * @tc.name      : get_video_orientation_001
     * @tc.desc      : video get photoKeys.ORIENTATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_orientation_001', 2, async function (done) {
      const testNum = 'get_video_orientation_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.ORIENTATION;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6000
     * @tc.name      : get_video_favorite_001
     * @tc.desc      : video get photoKeys.FAVORITE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_favorite_001', 2, async function (done) {
      const testNum = 'get_video_favorite_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.FAVORITE;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6100
     * @tc.name      : get_video_size_001
     * @tc.desc      : video get photoKeys.SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_size_001', 2, async function (done) {
      const testNum = 'get_video_size_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.SIZE;
      const value = 4853005;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6200
     * @tc.name      : get_video_title_001
     * @tc.desc      : video get photoKeys.TITLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_title_001', 2, async function (done) {
      const testNum = 'get_video_title_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.TITLE;
      const value = 'getTest';
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6300
     * @tc.name      : get_video_position_001
     * @tc.desc      : video get photoKeys.POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_position_001', 2, async function (done) {
      const testNum = 'get_video_position_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.POSITION;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6400
     * @tc.name      : get_video_date_trash_001
     * @tc.desc      : video get photoKeys.DATE_TRASHED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_trash_001', 2, async function (done) {
      const testNum = 'get_video_date_trash_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DATE_TRASHED;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6500
     * @tc.name      : get_video_hidden_001
     * @tc.desc      : video get photoKeys.HIDDEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_hidden_001', 2, async function (done) {
      const testNum = 'get_video_hidden_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.HIDDEN;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6600
     * @tc.name      : get_image_date_add_ms_001
     * @tc.desc      : image get photoKeys.DATE_ADDED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_date_add_ms_001', 1, async function (done) {
      const testNum = 'get_image_date_add_ms_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      let asset = await getFileAsset(testNum, fetchOps);
      const dateAdded = asset.get(photoKeys.DATE_ADDED);
      console.log(`${testNum} :: asset photoKeys.DATE_ADDED is ${dateAdded}`);
      const key = photoKeys.DATE_ADDED_MS;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      const dateAddedMs = asset.get(key);
      console.log(`${testNum} :: asset photoKeys.DATE_ADDED_MS is ${dateAddedMs}`);
      await checkPhotoKeysDateTime(done, testNum, (dateAdded * 1000), dateAddedMs);
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6700
     * @tc.name      : get_video_date_added_ms_001
     * @tc.desc      : video get photoKeys.DATE_ADDED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_date_added_ms_001', 1, async function (done) {
      const testNum = 'get_video_date_add_ms_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      let asset = await getFileAsset(testNum, fetchOps);
      const dateAdded = asset.get(photoKeys.DATE_ADDED);
      console.log(`${testNum} :: asset photoKeys.DATE_ADDED is ${dateAdded}`);
      const key = photoKeys.DATE_ADDED_MS;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      const dateAddedMs = asset.get(key);
      console.log(`${testNum} :: asset photoKeys.DATE_ADDED_MS is ${dateAddedMs}`);
      await checkPhotoKeysDateTime(done, testNum, (dateAdded * 1000), dateAddedMs);
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6800
     * @tc.name      : get_image_date_modified_ms_001
     * @tc.desc      : image get photoKeys.DATE_MODIFIED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_date_modified_ms_001', 1, async function (done) {
      const testNum = 'get_image_date_modified_ms_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      let asset = await getFileAsset(testNum, fetchOps);
      const dateModified = asset.get(photoKeys.DATE_MODIFIED);
      console.log(`${testNum} :: asset photoKeys.DATE_MODIFIED is ${dateModified}`);
      const key = photoKeys.DATE_MODIFIED_MS;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      const dateModifiedMs = asset.get(key);
      console.log(`${testNum} :: asset photoKeys.DATE_MODIFIED_MS is ${dateModifiedMs}`);
      await checkPhotoKeysDateTime(done, testNum, (dateModified * 1000), dateModifiedMs);
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_6900
     * @tc.name      : get_video_date_modified_ms_001
     * @tc.desc      : video get photoKeys.DATE_MODIFIED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_date_modified_ms_001', 1, async function (done) {
      const testNum = 'get_video_date_modified_ms_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      let asset = await getFileAsset(testNum, fetchOps);
      const dateModified = asset.get(photoKeys.DATE_MODIFIED);
      console.log(`${testNum} :: asset photoKeys.DATE_MODIFIED is ${dateModified}`);
      const key = photoKeys.DATE_MODIFIED_MS;
      const value = 1;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      const dateModifiedMs = asset.get(key);
      console.log(`${testNum} :: asset photoKeys.DATE_MODIFIED_MS is ${dateModifiedMs}`);
      await checkPhotoKeysDateTime(done, testNum, (dateModified * 1000), dateModifiedMs);
      done();
    });


    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7000
     * @tc.name      : get_image_dynamic_range_type_001
     * @tc.desc      : image get photoKeys.DYNAMIC_RANGE_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_dynamic_range_type_001', 1, async function (done) {
      const testNum = 'get_image_dynamic_range_type_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.DYNAMIC_RANGE_TYPE;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7001
     * @tc.name      : get_image_cover_position_001
     * @tc.desc      : common image get photoKeys.COVER_POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_cover_position_001', 1, async function (done) {
      const testNum = 'get_image_cover_position_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.COVER_POSITION;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7002
     * @tc.name      : get_video_cover_position_001
     * @tc.desc      : video get photoKeys.COVER_POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_cover_position_001', 1, async function (done) {
      const testNum = 'get_video_cover_position_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.COVER_POSITION;
      const value = 0;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7003
     * @tc.name      : get_image_burst_key_001
     * @tc.desc      : image get photoKeys.BURST_KEY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_burst_key_001', 1, async function (done) {
      const testNum = 'get_image_burst_key_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      let burstKey = await getBurstKey(testNum, fetchOps);
      console.log(`${testNum} :: getBurstKey :: burstKey is '' :: ${burstKey === ''}`);
      expect(burstKey == '').assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7004
     * @tc.name      : get_video_burst_key_001
     * @tc.desc      : video get photoKeys.BURST_KEY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_burst_key_001', 1, async function (done) {
      const testNum = 'get_video_burst_key_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      let burstKey = await getBurstKey(testNum, fetchOps);
      console.log(`${testNum} :: getBurstKey :: burstKey is '' :: ${burstKey === ''}`);
      expect(burstKey == '').assertTrue();
      done();
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7005
     * @tc.name      : get_image_lcd_size_001
     * @tc.desc      : image get photoKeys.LCD_SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_lcd_size_001', 1, async function (done) {
      const testNum = 'get_image_lcd_size_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.LCD_SIZE;
      const value = "1279:1706";
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7006
     * @tc.name      : get_video_lcd_size_001
     * @tc.desc      : video get photoKeys.LCD_SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_lcd_size_001', 1, async function (done) {
      const testNum = 'get_video_lcd_size_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.LCD_SIZE;
      const value = "1280:720";
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7007
     * @tc.name      : get_image_thm_size_001
     * @tc.desc      : image get photoKeys.THM_SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_thm_size_001', 1, async function (done) {
      const testNum = 'get_image_thm_size_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.THM_SIZE;
      console.log(`${testNum} :: get key success, THM_SIZE is ${key}`);
      const value = "350:466";
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_7008
     * @tc.name      : get_video_thm_size_001
     * @tc.desc      : video get photoKeys.THM_SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_thm_size_001', 1, async function (done) {
      const testNum = 'get_video_thm_size_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key = photoKeys.THM_SIZE;
      console.log(`${testNum} :: get key success, THM_SIZE is ${key}`);
      const value = "622:350";
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });
  })
}
