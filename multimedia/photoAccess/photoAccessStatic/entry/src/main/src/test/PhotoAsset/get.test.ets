/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from '../../../../hypium/index'
import Context from "application.Context"
import hilog from '@ohos.hilog'
import {
  photoFetchOption,
  getFileAsset,
  getAssetId,
  isBigInt,
  getBurstKey,
  getPermission,
  driveFn,
  sleep,
  pushCreateAsset
} from '../Common.test.ets'
import { BusinessError } from '@ohos.base'

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function getTest() {
  describe('getTest', (): void => {
    let testContext: Context = Hypium.get("context") as Context;
    const phAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    const fileNameList = ["getTest.jpg", "getTest.mp4"];

    let checkPhotoKeysValue = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      key: string, value: photoAccessHelper.MemberType | bigint): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        hilog.info(domain, tag, `${testNum} key: ${key}, value: ${value}, asset.key: ${asset.get(key)}`);
        if (key === 'uri') {
          const id: string = getAssetId(asset.get(key) as string);
          const expectUri = value + id;
          const uri = asset.get(key).toString();
          const isIncludes = uri.includes(expectUri);
          expect(isIncludes).assertTrue();
        } else if (key === 'date_added' || key === 'date_modified' || key === 'date_taken' ||
          key === 'date_added_ms' || key === 'date_modified_ms' || key === 'date_taken_ms') {
          expect(isBigInt(asset.get(key))).assertTrue();
        } else {
          expect(asset.get(key)).assertEqual(value);
        }
        done();
      } catch (error) {
        hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let getNotExistKeysValue = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      key: string, value: string | number): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        hilog.info(domain, tag, `${testNum} key: ${key}, value: ${value}, asset.key: ${asset.get(key)}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, `${testNum} failed; error: ${error} ${error.code}`);
        expect(error.code).assertEqual(14000014);
        done();
      }
    }

    let getErrorKeysValue = async (done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      key: string | undefined, value: string | number): Promise<void> => {
      try {
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        hilog.info(domain, tag, `${testNum} key: ${key}, value: ${value}, asset.key: ${asset.get(key as string)}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(domain, tag, `${testNum} failed; error: ${error} ${error.code}`);
        expect(error.code === 13900020 || error.code === 401).assertTrue();
        done();
      }
    }

    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await sleep(1000);
      await driveFn();
      await pushCreateAsset(testContext, fileNameList);
    });

    const checkProvisionAsset = async (done: () => void, testNum: string, displayName: string): Promise<void> => {
      try {
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await (phAccessHelper as photoAccessHelper.PhotoAccessHelper).getAssets(fetchOps);
        let fetchCount = fetchResult.getCount();
        hilog.info(domain, tag, `${testNum} :: fetchCount is ${fetchCount}`);
        if (fetchCount <= 0) {
          hilog.error(domain, tag, `${testNum} :: checkProvisionAsset :: have no Asset displayName is ${displayName}!`)
          expect(false).assertTrue();
          done();
        }
      } catch (error) {
        hilog.error(domain, tag, `${testNum} :: checkProvisionAsset failed, err ==> ${error}!`);
        expect(false).assertTrue();
        done();
      }
    }

    const checkPhotoKeysDateTime =
      async (done: () => void, testNum: string, expectDateMs: photoAccessHelper.MemberType,
        actualDateMs: photoAccessHelper.MemberType): Promise<void> => {
        try {
          hilog.info(domain, tag, `${testNum} :: expectDateMs is ${expectDateMs}, actualDateMs is ${actualDateMs}`);
          let expectDateMsLong = expectDateMs as int;
          hilog.info(domain, tag, `${testNum} :: expectDateMs as int success`);
          let actualDateMsLong = actualDateMs as int;
          hilog.info(domain, tag, `${testNum} :: actualDateMs as int success`);
          let lowRange = 0.998 * expectDateMsLong * 1000;
          let topRange = 1.002 * expectDateMsLong * 1000;
          if (lowRange <= actualDateMsLong && actualDateMsLong <= topRange) {
            hilog.info(domain, tag, `${testNum} :: ${actualDateMs} is between ${lowRange} and ${topRange} .`);
            done();
          } else {
            hilog.info(domain, tag,
              `${testNum} :: ${actualDateMs} is not between ${lowRange} and ${topRange}, failed !`);
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          hilog.info(domain, tag, `${testNum} :: checkPhotoKeysDateTime error , err is ${error} !`);
          expect(false).assertTrue();
          done();
        }
      }


    //callback
    //image
    /**
     * @tc.name   get_image_uri_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0000
     * @tc.desc   image get photoAccessHelper.PhotoKeys.URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_uri_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_uri_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.URI;
        const value: string = 'file://media/Photo/';
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_photo_type_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0100
     * @tc.desc   image get photoAccessHelper.PhotoKeys.PHOTO_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_photo_type_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_photo_type_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.PHOTO_TYPE;
        const value: int = photoAccessHelper.PhotoType.IMAGE;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_displayName_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0200
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DISPLAY_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_displayName_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_displayName_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DISPLAY_NAME;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, displayName);
      });

    /**
     * @tc.name   get_image_date_added_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0300
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DATE_ADDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_date_added_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_date_added_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DATE_ADDED;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_date_modified_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0400
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DATE_MODIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_date_modified_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_date_modified_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DATE_MODIFIED;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_duration_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0500
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_duration_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_duration_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DURATION;
        const value: int = 0;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_width_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0600
     * @tc.desc   image get photoAccessHelper.PhotoKeys.WIDTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_width_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_width_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.WIDTH;
        const value: int = 1279;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_height_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0700
     * @tc.desc   image get photoAccessHelper.PhotoKeys.HEIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_height_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_height_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.HEIGHT;
        const value: int = 1706;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_date_taken_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0800
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DATE_TAKEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_date_taken_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_date_taken_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DATE_TAKEN;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_orientation_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_0900
     * @tc.desc   image get photoAccessHelper.PhotoKeys.ORIENTATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_orientation_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_orientation_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.ORIENTATION;
        const value: int = 0;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_favorite_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_1000
     * @tc.desc   image get photoAccessHelper.PhotoKeys.FAVORITE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_favorite_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_favorite_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.FAVORITE;
        const value: int = 0;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_size_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_1100
     * @tc.desc   image get photoAccessHelper.PhotoKeys.SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_size_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_size_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.SIZE;
        const value: bigint = 348113n;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_title_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_1200
     * @tc.desc   image get photoAccessHelper.PhotoKeys.TITLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_title_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_title_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.TITLE;
        const value: string = 'getTest';
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_position_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_1300
     * @tc.desc   image get photoAccessHelper.PhotoKeys.POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_image_position_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_position_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.POSITION;
        const value: int = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_uri_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5000
     * @tc.desc   video get photoAccessHelper.PhotoKeys.URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_uri_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_uri_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.URI;
        const value: string = 'file://media/Photo/';
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_photo_type_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5100
     * @tc.desc   video get photoAccessHelper.PhotoKeys.PHOTO_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_photo_type_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_photo_type_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.PHOTO_TYPE;
        const value: int = photoAccessHelper.PhotoType.VIDEO;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_display_name_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5200
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DISPLAY_NAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_display_name_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_052';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DISPLAY_NAME;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, displayName);
      });

    /**
     * @tc.name   get_video_date_added_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5300
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DATE_ADDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_date_added_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_date_added_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DATE_ADDED;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_date_modified_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5400
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DATE_MODIFIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_date_modified_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_date_modified_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DATE_MODIFIED;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_duration_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5500
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DURATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_duration_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_duration_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DURATION;
        const value: int = 10100;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_width_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5600
     * @tc.desc   video get photoAccessHelper.PhotoKeys.WIDTH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_width_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_width_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.WIDTH;
        const value: int = 1280;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_height_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5700
     * @tc.desc   video get photoAccessHelper.PhotoKeys.HEIGHT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_height_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_height_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.HEIGHT;
        const value: int = 720;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_date_taken_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5800
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DATE_TAKEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_date_taken_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_date_taken_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DATE_TAKEN;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_orientation_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_5900
     * @tc.desc   video get photoAccessHelper.PhotoKeys.ORIENTATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_orientation_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_orientation_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.ORIENTATION;
        const value: int = 0;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_favorite_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_6000
     * @tc.desc   video get photoAccessHelper.PhotoKeys.FAVORITE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_favorite_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_favorite_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.FAVORITE;
        const value: int = 0;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_size_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_6100
     * @tc.desc   video get photoAccessHelper.PhotoKeys.SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_size_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_size_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.SIZE;
        const value: bigint = 4853005n;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_title_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_6200
     * @tc.desc   video get photoAccessHelper.PhotoKeys.TITLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_title_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_title_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.TITLE;
        const value: string = 'getTest';
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_position_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_6300
     * @tc.desc   video get photoAccessHelper.PhotoKeys.POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_position_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_position_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.POSITION;
        const value: int = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_date_add_ms_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_6600
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DATE_ADDED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_date_add_ms_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_date_add_ms_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        const dateAdded: photoAccessHelper.MemberType = asset.get(photoAccessHelper.PhotoKeys.DATE_ADDED);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_ADDED is ${dateAdded}`);
        const key: string = photoAccessHelper.PhotoKeys.DATE_ADDED_MS;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
        const dateAddedMs: photoAccessHelper.MemberType = asset.get(key);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_ADDED_MS is ${dateAddedMs}`);
        await checkPhotoKeysDateTime(done, testNum, dateAdded, dateAddedMs);
        done();
      });

    /**
     * @tc.name   get_video_date_added_ms_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_6700
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DATE_ADDED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_video_date_added_ms_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_date_add_ms_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        const dateAdded: photoAccessHelper.MemberType = asset.get(photoAccessHelper.PhotoKeys.DATE_ADDED);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_ADDED is ${dateAdded}`);
        const key: string = photoAccessHelper.PhotoKeys.DATE_ADDED_MS;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
        const dateAddedMs: photoAccessHelper.MemberType = asset.get(key);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_ADDED_MS is ${dateAddedMs}`);
        await checkPhotoKeysDateTime(done, testNum, dateAdded, dateAddedMs);
        done();
      });

    /**
     * @tc.name   get_image_date_modified_ms_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_6800
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_date_modified_ms_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_date_modified_ms_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        const dateModified: photoAccessHelper.MemberType = asset.get(photoAccessHelper.PhotoKeys.DATE_MODIFIED);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_MODIFIED is ${dateModified}`);
        const key: string = photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
        const dateModifiedMs: photoAccessHelper.MemberType = asset.get(key);
        hilog.info(domain, tag,
          `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS is ${dateModifiedMs}`);
        await checkPhotoKeysDateTime(done, testNum, dateModified, dateModifiedMs);
        done();
      });

    /**
     * @tc.name   get_video_date_modified_ms_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_6900
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_video_date_modified_ms_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_date_modified_ms_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        let asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
        const dateModified: photoAccessHelper.MemberType = asset.get(photoAccessHelper.PhotoKeys.DATE_MODIFIED);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_MODIFIED is ${dateModified}`);
        const key: string = photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS;
        const value: long = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
        const dateModifiedMs: photoAccessHelper.MemberType = asset.get(key);
        hilog.info(domain, tag,
          `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_MODIFIED_MS is ${dateModifiedMs}`);
        await checkPhotoKeysDateTime(done, testNum, dateModified, dateModifiedMs);
        done();
      });


    /**
     * @tc.name   get_image_dynamic_range_type_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7000
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DYNAMIC_RANGE_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_dynamic_range_type_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_dynamic_range_type_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.DYNAMIC_RANGE_TYPE;
        const value: int = 0;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_cover_position_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7001
     * @tc.desc   common image get photoAccessHelper.PhotoKeys.COVER_POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_cover_position_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_cover_position_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.COVER_POSITION;
        const value: bigint = 0n;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_cover_position_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7002
     * @tc.desc   video get photoAccessHelper.PhotoKeys.COVER_POSITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_video_cover_position_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_cover_position_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.COVER_POSITION;
        const value: bigint = 0n;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_burst_key_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7003
     * @tc.desc   image get photoAccessHelper.PhotoKeys.BURST_KEY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_burst_key_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_burst_key_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        let burstKey: string | number = await getBurstKey(testNum, fetchOps);
        hilog.info(domain, tag, `${testNum} :: getBurstKey :: burstKey is '' :: ${burstKey === ''}`);
        expect(burstKey == '').assertTrue();
        done();
      });

    /**
     * @tc.name   get_video_burst_key_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7004
     * @tc.desc   video get photoAccessHelper.PhotoKeys.BURST_KEY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_video_burst_key_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_burst_key_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        let burstKey: string | number = await getBurstKey(testNum, fetchOps);
        hilog.info(domain, tag, `${testNum} :: getBurstKey :: burstKey is '' :: ${burstKey === ''}`);
        expect(burstKey == '').assertTrue();
        done();
      });

    /**
     * @tc.name   get_image_lcd_size_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7005
     * @tc.desc   image get photoAccessHelper.PhotoKeys.LCD_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_lcd_size_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_lcd_size_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.LCD_SIZE;
        const value: string = "1279:1706";
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_lcd_size_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7006
     * @tc.desc   video get photoAccessHelper.PhotoKeys.LCD_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_video_lcd_size_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_lcd_size_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = photoAccessHelper.PhotoKeys.LCD_SIZE;
        const value: string = "1280:720";
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_thm_size_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7007
     * @tc.desc   image get photoAccessHelper.PhotoKeys.THM_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_thm_size_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_thm_size_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = "thumb_size";
        hilog.info(domain, tag, `${testNum} :: get key success, THM_SIZE is ${key}`);
        const value: string = "350:466";
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_video_thm_size_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_STATIC_7008
     * @tc.desc   video get photoAccessHelper.PhotoKeys.THM_SIZE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_video_thm_size_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_thm_size_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        const key: string = "thumb_size";
        hilog.info(domain, tag, `${testNum} :: get key success, THM_SIZE is ${key}`);
        const value: string = "622:350";
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
      });

    /**
     * @tc.name   get_image_detail_time_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_IMAGE_DETAIL_TIME_STATIC_001
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DETAIL_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_detail_time_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_detail_time_static_001';
        const displayName = 'getTest.jpg';
        try {
          const fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
          await checkProvisionAsset(done, testNum, displayName);
          const key = photoAccessHelper.PhotoKeys.DETAIL_TIME;
          hilog.info(domain, tag, `${testNum} :: get key success, DETAIL_TIME is ${key}`);
          let asset = await getFileAsset(testNum, fetchOps);
          let date = new Date();
          let year = date.getFullYear();
          let month: string = (date.getMonth() + 1) > 9 ? String(date.getMonth() + 1) : ('0' + (date.getMonth() + 1));
          let day: string = date.getDate() > 9 ? String(date.getDate()) : ('0' + date.getDate());
          let value = asset?.get(key);
          let detailTimeStr = year + ":" + month + ":" + day;
          hilog.info(domain, tag, `${testNum} :: expect Date is ${detailTimeStr}, actual is ${value}`);
          expect(value).assertContain(detailTimeStr)
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `${testNum} :: get photoAccessHelper.PhotoKeys.DETAIL_TIME failed , error is ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   get_video_detail_time_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_VIDEO_DETAIL_TIME_STATIC_002
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DETAIL_TIME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_video_detail_time_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_detail_time_static_00';
        const displayName = 'getTest.mp4';
        try {
          const fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
          await checkProvisionAsset(done, testNum, displayName);
          const key = photoAccessHelper.PhotoKeys.DETAIL_TIME;
          hilog.info(domain, tag, `${testNum} :: get key success, DETAIL_TIME is ${key}`);
          let asset = await getFileAsset(testNum, fetchOps);
          let date = new Date();
          let year = date.getFullYear();
          let month: string = (date.getMonth() + 1) > 9 ? String(date.getMonth() + 1) : ('0' + (date.getMonth() + 1));
          let day: string = date.getDate() > 9 ? String(date.getDate()) : ('0' + date.getDate());
          let value = asset?.get(key);
          let detailTimeStr = year + ":" + month + ":" + day;
          hilog.info(domain, tag, `${testNum} :: expect Date is ${detailTimeStr}, actual is ${value}`);
          expect(value).assertContain(detailTimeStr)
          done();
        } catch (error) {
          hilog.error(domain, tag,
            `${testNum} :: get photoAccessHelper.PhotoKeys.DETAIL_TIME failed , error is ${error}`);
          expect(false).assertTrue();
          done();
        }
      });

    /**
     * @tc.name   get_image_date_taken_ms_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_IMAGE_DATE_TAKEN_MS_STATIC_001
     * @tc.desc   image get photoAccessHelper.PhotoKeys.DATE_TAKEN_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_image_date_taken_ms_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_image_date_taken_ms_static_001';
        const displayName = 'getTest.jpg';
        const fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        let asset = await getFileAsset(testNum, fetchOps);
        const dateTaken: photoAccessHelper.MemberType = asset.get(photoAccessHelper.PhotoKeys.DATE_TAKEN);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_TAKEN is ${dateTaken}`);
        const key = photoAccessHelper.PhotoKeys.DATE_TAKEN_MS;
        const value = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
        const dateTakenMs: photoAccessHelper.MemberType = asset.get(key);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_TAKEN_MS is ${dateTakenMs}`);
        await checkPhotoKeysDateTime(done, testNum, dateTaken, dateTakenMs);
        done();
      });

    /**
     * @tc.name   get_video_date_taken_ms_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_VIDEO_DATE_TAKEN_MS_STATIC_001
     * @tc.desc   video get photoAccessHelper.PhotoKeys.DATE_TAKEN_MS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('get_video_date_taken_ms_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_date_taken_ms_static_001';
        const displayName = 'getTest.mp4';
        const fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await checkProvisionAsset(done, testNum, displayName);
        let asset = await getFileAsset(testNum, fetchOps);
        const dateTaken: photoAccessHelper.MemberType = asset.get(photoAccessHelper.PhotoKeys.DATE_TAKEN);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_TAKEN is ${dateTaken}`);
        const key = photoAccessHelper.PhotoKeys.DATE_TAKEN_MS;
        const value = 1;
        await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
        const dateTakenMs: photoAccessHelper.MemberType = asset.get(key);
        hilog.info(domain, tag, `${testNum} :: asset photoAccessHelper.PhotoKeys.DATE_TAKEN_MS is ${dateTakenMs}`);
        await checkPhotoKeysDateTime(done, testNum, dateTaken, dateTakenMs);
        done();
      });

    /**
     * @tc.name   get_video_date_taken_ms_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_VIDEO_DATE_TAKEN_MS_STATIC_002
     * @tc.desc   video get key '', error code 14000014
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('get_video_date_taken_ms_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'get_video_date_taken_ms_static_002';
        const displayName = 'getTest.mp4';
        const fetchOps = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, displayName);
        await getFileAsset(testNum, fetchOps);
        const key = '';
        const value = 1;
        await getNotExistKeysValue(done, testNum, fetchOps, key, value);
        done();
      });
  })
}