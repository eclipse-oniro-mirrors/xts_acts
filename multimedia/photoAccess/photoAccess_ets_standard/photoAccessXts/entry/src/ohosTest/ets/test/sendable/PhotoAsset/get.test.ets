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

import { photoAccessHelper, sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from "@ohos/hypium";
import {
  photoKeys,
  photoFetchOption,
  getFileAsset,
  getAssetId,
  isNum,
  photoType,
  getBurstKey,
  pushCreateAsset,
  getPermission,
  driveFn,
  LOG_TAG,
  getSendableFileAsset
} from '../../common';
import common from '@ohos.app.ability.common';
import { ErrorCode } from '../../CommonErrorCode';

export default function sendableGetTest() {
  describe('sendableGetTest', () => {
    const TAG = LOG_TAG + 'sendableGetTest';

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const phAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
    const fileNameList = ["getTest.jpg", "getTest.mp4"];

    const checkProvisionAsset = async (done: Function, testName: string, displayName: string) => {
      try {
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOps);
        let fetchCount = fetchResult.getCount();
        console.log(` ${testName} :: fetchCount is ${fetchCount}`);
        if (fetchCount <= 0) {
          console.error(` ${testName} :: checkProvisionAsset :: have no Asset displayName is ${displayName}!`);
          expect().assertFail();
          done();
        }
      } catch (error) {
        console.error(` ${testName} :: checkProvisionAsset failed, err ==> ${error}!`);
        expect().assertFail();
        done();
      }
    }

    const checkPhotoKeysDateTime =
      async (done: Function, testName: string, expectDateMs: number, actualDateMs: number) => {
        try {
          console.log(`${testName} :: expectDateMs is ${expectDateMs}, actualDateMs is ${actualDateMs}`);
          let lowRange = 0.998 * expectDateMs;
          let topRange = 1.002 * expectDateMs;
          if (lowRange <= actualDateMs && actualDateMs <= topRange) {
            console.log(`${testName} :: ${actualDateMs} is between ${lowRange} and ${topRange} .`);
            done();
          } else {
            console.log(`${testName} :: ${actualDateMs} is not between ${lowRange} and ${topRange}, failed !`);
            expect().assertFail();
            done();
          }
        } catch (error) {
          console.log(`${testName} :: checkPhotoKeysDateTime error , err is ${error} !`);
          expect().assertFail();
          done();
        }
      }

    let checkPhotoKeysValue = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      key: string, value: string | number) => {
      try {
        let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
        console.info(`${testName} key: ${key}, value: ${value}, asset.key: ${asset.get(key)},
            displayname: ${asset.get(photoKeys.DISPLAY_NAME)}`);
        if (key === 'uri') {
          const id: string = getAssetId(asset.get(key));
          const expectUri = value + id;
          const uri = asset.get(key).toString();
          const isIncludes = uri.includes(expectUri);
          expect(isIncludes).assertTrue();
        } else if (key === 'date_added' || key === 'date_modified' || key === 'date_taken' || key === 'date_added_ms' ||
          key === 'date_modified_ms' || key === 'date_taken_ms') {
          expect(isNum(asset.get(key))).assertTrue();
        } else {
          expect(asset.get(key)).assertEqual(value);
        }
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}`);
        done();
        expect().assertFail();
      }
    }

    let getNotExistKeysValue = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      key: string, value: string | number) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
        console.info(`${testName} key: ${key}, value: ${value}, asset.key: ${asset.get(key)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error} ${error?.code}`);
        expect(error.code == ErrorCode.NOT_VALID_PHOTO_KEY_ERROR_CODE).assertTrue();
        done();
      }
    }

    let getErrorKeysValue = async (done: Function, testName: string, fetchOps: photoAccessHelper.FetchOptions,
      key: string | undefined, value: string | number) => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
        console.info(`${testName} key: ${key}, value: ${value}, asset.key: ${asset.get(key)}`);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error} ${error?.code}`);
        expect(error?.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE || error?.code == ErrorCode.PARAM_ERROR_CODE)
          .assertTrue();
        done();
      }
    }

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await pushCreateAsset(testContext, fileNameList);
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
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_001
     * @tc.name      : get_image_uri_sendable_001
     * @tc.desc      : image get photoKeys.URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_uri_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_uri_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.URI;
      const value: string = 'file://media/Photo/';
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_002
     * @tc.name      : get_image_photo_type_sendable_001
     * @tc.desc      : image get photoKeys.PHOTO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_photo_type_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_photo_type_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.PHOTO_TYPE;
      const value: number = photoType.IMAGE;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_003
     * @tc.name      : get_image_displayName_sendable_001
     * @tc.desc      : image get photoKeys.DISPLAY_NAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_displayName_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_displayName_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DISPLAY_NAME;
      await checkPhotoKeysValue(done, testName, fetchOps, key, displayName);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_004
     * @tc.name      : get_image_date_added_sendable_001
     * @tc.desc      : image get photoKeys.DATE_ADDED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_date_added_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_date_added_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DATE_ADDED;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_005
     * @tc.name      : get_image_date_modified_sendable_001
     * @tc.desc      : image get photoKeys.DATE_MODIFIED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_date_modified_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_date_modified_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DATE_MODIFIED;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_006
     * @tc.name      : get_image_duration_sendable_001
     * @tc.desc      : image get photoKeys.DURATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_duration_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_duration_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DURATION;
      const value: number = 0;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_007
     * @tc.name      : get_image_width_sendable_001
     * @tc.desc      : image get photoKeys.WIDTH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_width_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_width_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.WIDTH;
      const value: number = 960;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_008
     * @tc.name      : get_image_height_sendable_001
     * @tc.desc      : image get photoKeys.HEIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_height_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_height_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.HEIGHT;
      const value: number = 1280;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_009
     * @tc.name      : get_image_date_taken_sendable_001
     * @tc.desc      : image get photoKeys.DATE_TAKEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_date_taken_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_date_taken_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DATE_TAKEN;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_010
     * @tc.name      : get_image_orientation_sendable_001
     * @tc.desc      : image get photoKeys.ORIENTATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_orientation_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_orientation_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.ORIENTATION;
      const value: number = 0;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_011
     * @tc.name      : get_image_favorite_sendable_001
     * @tc.desc      : image get photoKeys.FAVORITE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_favorite_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_favorite_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.FAVORITE;
      const value: number = 0;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_012
     * @tc.name      : get_image_size_sendable_001
     * @tc.desc      : image get photoKeys.SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    /*it('get_image_size_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_size_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.SIZE;
      const value: number = 108164;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })*/

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_013
     * @tc.name      : get_image_title_sendable_001
     * @tc.desc      : image get photoKeys.TITLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_title_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_title_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.TITLE;
      const value: string = 'getTest';
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_014
     * @tc.name      : get_image_position_sendable_001
     * @tc.desc      : image get photoKeys.POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_position_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_position_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.POSITION;
      const value: number = photoAccessHelper.PositionType.LOCAL;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_015
     * @tc.name      : get_video_uri_sendable_001
     * @tc.desc      : video get photoKeys.URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_uri_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_uri_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.URI;
      const value: string = 'file://media/Photo/';
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_016
     * @tc.name      : get_video_photo_type_sendable_001
     * @tc.desc      : video get photoKeys.PHOTO_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_photo_type_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_photo_type_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.PHOTO_TYPE;
      const value: number = photoType.VIDEO;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_017
     * @tc.name      : get_video_display_name_sendable_001
     * @tc.desc      : video get photoKeys.DISPLAY_NAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_display_name_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_display_name_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DISPLAY_NAME;
      await checkPhotoKeysValue(done, testName, fetchOps, key, displayName);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_018
     * @tc.name      : get_video_date_added_sendable_001
     * @tc.desc      : video get photoKeys.DATE_ADDED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_added_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_date_added_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DATE_ADDED;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_019
     * @tc.name      : get_video_date_modified_sendable_001
     * @tc.desc      : video get photoKeys.DATE_MODIFIED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_modified_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_date_modified_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DATE_MODIFIED;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_020
     * @tc.name      : get_video_duration_sendable_001
     * @tc.desc      : video get photoKeys.DURATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    /*it('get_video_duration_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_duration_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DURATION;
      const value: number = 4694;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })*/

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_021
     * @tc.name      : get_video_width_sendable_001
     * @tc.desc      : video get photoKeys.WIDTH
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_width_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_width_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.WIDTH;
      const value: number = 640;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_022
     * @tc.name      : get_video_height_sendable_001
     * @tc.desc      : video get photoKeys.HEIGHT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_height_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_height_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.HEIGHT;
      const value: number = 480;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_023
     * @tc.name      : get_video_date_taken_sendable_001
     * @tc.desc      : video get photoKeys.DATE_TAKEN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_taken_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_date_taken_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DATE_TAKEN;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_024
     * @tc.name      : get_video_orientation_sendable_001
     * @tc.desc      : video get photoKeys.ORIENTATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_orientation_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_orientation_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.ORIENTATION;
      const value: number = 270;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_025
     * @tc.name      : get_video_favorite_sendable_001
     * @tc.desc      : video get photoKeys.FAVORITE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_favorite_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_favorite_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.FAVORITE;
      const value: number = 0; // 0 未收藏 1 收藏
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_026
     * @tc.name      : get_video_size_sendable_001
     * @tc.desc      : video get photoKeys.SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    /*it('get_video_size_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_size_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.SIZE;
      const value: number = 305787;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })*/

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_027
     * @tc.name      : get_video_title_sendable_001
     * @tc.desc      : video get photoKeys.TITLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_title_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_title_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.TITLE;
      const value: string = 'getTest';
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_028
     * @tc.name      : get_video_position_sendable_001
     * @tc.desc      : video get photoKeys.POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_position_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_position_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.POSITION;
      const value: number = photoAccessHelper.PositionType.LOCAL;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_029
     * @tc.name      : get_image_date_add_ms_sendable_001
     * @tc.desc      : image get photoKeys.DATE_ADDED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_date_add_ms_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_image_date_add_ms_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
      const dateAdded: ESObject = asset.get(photoKeys.DATE_ADDED);
      console.log(`${testName} :: asset photoKeys.DATE_ADDED is ${dateAdded}`);
      const key: string = photoKeys.DATE_ADDED_MS;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
      const dateAddedMs: ESObject = asset.get(key);
      console.log(`${testName} :: asset photoKeys.DATE_ADDED_MS is ${dateAddedMs}`);
      await checkPhotoKeysDateTime(done, testName, (dateAdded * 1000), dateAddedMs);
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_030
     * @tc.name      : get_video_date_added_ms_sendable_001
     * @tc.desc      : video get photoKeys.DATE_ADDED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_date_added_ms_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_video_date_added_ms_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
      const dateAdded: ESObject = asset.get(photoKeys.DATE_ADDED);
      console.log(`${testName} :: asset photoKeys.DATE_ADDED is ${dateAdded}`);
      const key: string = photoKeys.DATE_ADDED_MS;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
      const dateAddedMs: ESObject = asset.get(key);
      console.log(`${testName} :: asset photoKeys.DATE_ADDED_MS is ${dateAddedMs}`);
      await checkPhotoKeysDateTime(done, testName, (dateAdded * 1000), dateAddedMs);
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_031
     * @tc.name      : get_image_date_modified_ms_sendable_001
     * @tc.desc      : image get photoKeys.DATE_MODIFIED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_date_modified_ms_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_image_date_modified_ms_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
      const dateModified: ESObject = asset.get(photoKeys.DATE_MODIFIED);
      console.log(`${testName} :: asset photoKeys.DATE_MODIFIED is ${dateModified}`);
      const key: string = photoKeys.DATE_MODIFIED_MS;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
      const dateModifiedMs: ESObject = asset.get(key);
      console.log(`${testName} :: asset photoKeys.DATE_MODIFIED_MS is ${dateModifiedMs}`);
      await checkPhotoKeysDateTime(done, testName, (dateModified * 1000), dateModifiedMs);
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_032
     * @tc.name      : get_video_date_modified_ms_sendable_001
     * @tc.desc      : video get photoKeys.DATE_MODIFIED_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_date_modified_ms_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_video_date_modified_ms_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      let asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
      const dateModified: ESObject = asset.get(photoKeys.DATE_MODIFIED);
      console.log(`${testName} :: asset photoKeys.DATE_MODIFIED is ${dateModified}`);
      const key: string = photoKeys.DATE_MODIFIED_MS;
      const value: number = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
      const dateModifiedMs: ESObject = asset.get(key);
      console.log(`${testName} :: asset photoKeys.DATE_MODIFIED_MS is ${dateModifiedMs}`);
      await checkPhotoKeysDateTime(done, testName, (dateModified * 1000), dateModifiedMs);
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_033
     * @tc.name      : get_image_dynamic_range_type_sendable_001
     * @tc.desc      : image get photoKeys.DYNAMIC_RANGE_TYPE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_dynamic_range_type_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_image_dynamic_range_type_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.DYNAMIC_RANGE_TYPE;
      const value: number = 0;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_034
     * @tc.name      : get_image_cover_position_sendable_001
     * @tc.desc      : common image get photoKeys.COVER_POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_cover_position_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_image_cover_position_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.COVER_POSITION;
      const value: number = 0;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_035
     * @tc.name      : get_video_cover_position_sendable_001
     * @tc.desc      : video get photoKeys.COVER_POSITION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_cover_position_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_video_cover_position_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.COVER_POSITION;
      const value: number = 0;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_036
     * @tc.name      : get_image_burst_key_sendable_001
     * @tc.desc      : image get photoKeys.BURST_KEY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_burst_key_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_image_burst_key_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      let burstKey: string | number = await getBurstKey(testContext, testName, fetchOps);
      console.log(`${testName} :: getBurstKey :: burstKey is '' :: ${burstKey === ''}`);
      expect(burstKey == '').assertTrue();
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_037
     * @tc.name      : get_video_burst_key_sendable_001
     * @tc.desc      : video get photoKeys.BURST_KEY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_burst_key_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_video_burst_key_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      let burstKey: string | number = await getBurstKey(testContext, testName, fetchOps);
      console.log(`${testName} :: getBurstKey :: burstKey is '' :: ${burstKey === ''}`);
      expect(burstKey == '').assertTrue();
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_038
     * @tc.name      : get_image_lcd_size_sendable_001
     * @tc.desc      : image get photoKeys.LCD_SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_lcd_size_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_image_lcd_size_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.LCD_SIZE;
      const value: string = "960:1280";
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_039
     * @tc.name      : get_video_lcd_size_sendable_001
     * @tc.desc      : video get photoKeys.LCD_SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_lcd_size_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_video_lcd_size_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.LCD_SIZE;
      const value: string = "480:640";
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_040
     * @tc.name      : get_image_thm_size_sendable_001
     * @tc.desc      : image get photoKeys.THM_SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_thm_size_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_image_thm_size_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.THM_SIZE;
      console.log(`${testName} :: get key success, THM_SIZE is ${key}`);
      const value: string = "350:466";
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_041
     * @tc.name      : get_video_thm_size_sendable_001
     * @tc.desc      : video get photoKeys.THM_SIZE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_thm_size_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_video_thm_size_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.THM_SIZE;
      console.log(`${testName} :: get key success, THM_SIZE is ${key}`);
      const value: string = "350:466";
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_042 // TODO
     * @tc.name      : get_image_detail_time_001
     * @tc.desc      : image get photoKeys.DETAIL_TIME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    /*    it('get_image_detail_time_001', Level.LEVEL1,
          async (done: Function) => {
            const testName = 'get_image_detail_time_001';
            const displayName = 'getTest.jpg';
            try {
              const fetchOps = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
              await checkProvisionAsset(done, testName, displayName);
              const key = photoKeys.DETAIL_TIME;
              console.log(`${testName} :: get key success, DETAIL_TIME is ${key}`);
              let asset = await getFileAsset(testContext, testName, fetchOps);
              let date = new Date();
              let year = date.getFullYear();
              let month: string =
                (date.getMonth() + 1) > 9 ? (date.getMonth() + 1).toString() : ('0' + (date.getMonth() + 1));
              let day: string = date.getDate() > 9 ? date.getDate().toString() : ('0' + date.getDate());
              let value = asset?.get(key);
              let detailTimeStr = year + ":" + month + ":" + day;
              console.log(`${testName} :: expect Date is ${detailTimeStr}, actual is ${value}`);
              expect(value).assertContain(detailTimeStr)
              done();
            } catch (error) {
              console.error(`${testName} :: get photoKeys.DETAIL_TIME failed , error is ${error}`);
              expect().assertFail();
              done();
            }
          })*/

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_043 // TODO
     * @tc.name      : get_video_detail_time_001
     * @tc.desc      : video get photoKeys.DETAIL_TIME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    /*    it('get_video_detail_time_001', Level.LEVEL1, async (done: Function) => {
          const testName = 'get_video_detail_time_00';
          const displayName = 'getTest.mp4';
          try {
            const fetchOps = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
            await checkProvisionAsset(done, testName, displayName);
            const key = photoKeys.DETAIL_TIME;
            console.log(`${testName} :: get key success, DETAIL_TIME is ${key}`);
            let asset = await getFileAsset(testContext, testName, fetchOps);
            let date = new Date();
            let year = date.getFullYear();
            let month: string =
              (date.getMonth() + 1) > 9 ? (date.getMonth() + 1).toString() : ('0' + (date.getMonth() + 1));
            let day: string = date.getDate() > 9 ? date.getDate().toString() : ('0' + date.getDate());
            let value = asset?.get(key);
            let detailTimeStr = year + ":" + month + ":" + day;
            console.log(`${testName} :: expect Date is ${detailTimeStr}, actual is ${value}`);
            expect(value).assertContain(detailTimeStr)
            done();
          } catch (error) {
            console.error(`${testName} :: get photoKeys.DETAIL_TIME failed , error is ${error}`);
            expect().assertFail();
            done();
          }
        })*/

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_044
     * @tc.name      : get_image_date_taken_ms_sendable_001
     * @tc.desc      : image get photoKeys.DATE_TAKEN_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_image_date_taken_ms_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_image_date_taken_ms_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      let asset = await getSendableFileAsset(testContext, testName, fetchOps);
      const dateTaken: ESObject = asset?.get(photoKeys.DATE_TAKEN);
      console.log(`${testName} :: asset photoKeys.DATE_TAKEN is ${dateTaken}`);
      const key = photoKeys.DATE_TAKEN_MS;
      const value = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
      const dateTakenMs: ESObject = asset.get(key);
      console.log(`${testName} :: asset photoKeys.DATE_TAKEN_MS is ${dateTakenMs}`);
      await checkPhotoKeysDateTime(done, testName, (dateTaken * 1000), dateTakenMs);
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_045
     * @tc.name      : get_video_date_taken_ms_sendable_001
     * @tc.desc      : video get photoKeys.DATE_TAKEN_MS
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('get_video_date_taken_ms_sendable_001', Level.LEVEL1, async (done: Function) => {
      const testName = 'get_video_date_taken_ms_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      let asset = await getSendableFileAsset(testContext, testName, fetchOps);
      const dateTaken: ESObject = asset?.get(photoKeys.DATE_TAKEN);
      console.log(`${testName} :: asset photoKeys.DATE_TAKEN is ${dateTaken}`);
      const key = photoKeys.DATE_TAKEN_MS;
      const value = 1;
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
      const dateTakenMs: ESObject = asset.get(key);
      console.log(`${testName} :: asset photoKeys.DATE_TAKEN_MS is ${dateTakenMs}`);
      await checkPhotoKeysDateTime(done, testName, (dateTaken * 1000), dateTakenMs);
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_046
     * @tc.name      : get_video_date_taken_ms_sendable_002
     * @tc.desc      : video get key '', error code 14000014
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_taken_ms_sendable_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_date_taken_ms_sendable_002';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await getFileAsset(testContext, testName, fetchOps);
      const key = '';
      const value = 1;
      await getNotExistKeysValue(done, testName, fetchOps, key, value);
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_047
     * @tc.name      : get_video_date_taken_ms_sendable_003
     * @tc.desc      : video get key undefined, error code 13900020 or 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_date_taken_ms_sendable_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_date_taken_ms_sendable_003';
      const displayName = 'getTest.mp4';
      const fetchOps = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await getFileAsset(testContext, testName, fetchOps);
      const value = 1;
      await getErrorKeysValue(done, testName, fetchOps, undefined, value);
      done();
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_048
     * @tc.name      : get_image_subtype_sendable_001
     * @tc.desc      : get Subtypes of media files.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_subtype_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_subtype_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.PHOTO_SUBTYPE;
      const value: number = photoAccessHelper.PhotoSubtype.DEFAULT; // TODO 待优化 photoAccessHelper.PhotoSubtype.
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_049
     * @tc.name      : get_video_subtype_sendable_001
     * @tc.desc      : get Subtypes of media files.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_subtype_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_subtype_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.PHOTO_SUBTYPE;
      const value: number = photoAccessHelper.PhotoSubtype.DEFAULT; // TODO 待优化 photoAccessHelper.PhotoSubtype.
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_050
     * @tc.name      : get_image_media_suffix_sendable_001
     * @tc.desc      : Get the suffix of file.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_media_suffix_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_image_media_suffix_sendable_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.MEDIA_SUFFIX;
      const value: string = 'jpg';
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_GET_051
     * @tc.name      : get_video_media_suffix_sendable_001
     * @tc.desc      : Get the suffix of file.
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_media_suffix_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'get_video_media_suffix_sendable_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testName, displayName);
      const key: string = photoKeys.MEDIA_SUFFIX;
      const value: string = 'mp4';
      await checkPhotoKeysValue(done, testName, fetchOps, key, value);
    })
  })
}