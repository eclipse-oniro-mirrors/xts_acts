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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { describe, it, expect, beforeAll, Level } from "@ohos/hypium";
import { common } from '@kit.AbilityKit';
import {
  photoKeys,
  photoType,
  driveFn,
  photoFetchOption,
  sleep,
  getPermission,
  getAssetId,
  getFileAsset,
  isNum,
  createResource
} from '../../util/common'

export default function getTest () {
  describe('getTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['getTest.jpg', 'getTest.mp4'];

    beforeAll(async () => {
      await getPermission();
      await sleep(10);
      await driveFn();
      await createResource(globalContext, fileNameList);
    });

    let checkPhotoKeysValue = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
      key: string, value: string | number) => {
      try {
        let asset: sendablePhotoAccessHelper.PhotoAsset = await getFileAsset(globalContext, testNum, fetchOps);
        console.info(`${testNum} key: ${key}, value: ${value}, asset.key: ${asset.get(key)}`);
        if (key === 'uri') {
          const id: string = getAssetId(asset.get(key));
          const expectUri = value + id;
          const uri = asset.get(key).toString();
          const isIncludes = uri.includes(expectUri);
          expect(isIncludes).assertTrue();
        } else if (key === 'date_added' || key === 'date_modified' || key === 'date_taken' || key === 'date_added_ms' || key === 'date_modified_ms' || key === 'date_taken_ms') {
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

    const checkProvisionAsset = async (done: Function, testNum: string, displayName: string) => {
      try {
        const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await sendablePhAccessHelper.getAssets(fetchOps);
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

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_Get_MemberType_001
     * @tc.name      : get_image_uri_001
     * @tc.desc      : image get photoKeys.URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_uri_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'get_image_uri_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key: string = photoKeys.URI;
      const value: string = 'file://media/Photo/';
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_Get_MemberType_002
     * @tc.name      : get_video_uri_001
     * @tc.desc      : video get photoKeys.URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_photo_type_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'get_image_photo_type_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key: string = photoKeys.PHOTO_TYPE;
      const value: number = photoType.IMAGE;
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_Get_MemberType_003
     * @tc.name      : get_image_title_001
     * @tc.desc      : image get photoKeys.TITLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_image_title_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'get_image_title_001';
      const displayName = 'getTest.jpg';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key: string = photoKeys.TITLE;
      const value: string = 'getTest';
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_Get_MemberType_004
     * @tc.name      : get_video_title_001
     * @tc.desc      : video get photoKeys.TITLE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_video_title_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'get_video_title_001';
      const displayName = 'getTest.mp4';
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, displayName);
      await checkProvisionAsset(done, testNum, displayName);
      const key: string = photoKeys.TITLE;
      const value: string = 'getTest';
      await checkPhotoKeysValue(done, testNum, fetchOps, key, value);
    });
    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_GET_ASSETS_ERROR_0000
     * @tc.name      : sendable_get_assets_error_000
     * @tc.desc      : get assets with title set to fetchColumns by mistake
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_get_assets_error_000', Level.LEVEL0, async (done: Function) => {
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['xx'],
          predicates: predicates
        };
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.TITLE;
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title.toString());
        console.info('photoAsset Get photoAssetTitle = ', photoAssetTitle);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`sendable_get_assets_error_000 failed, error: ${error}, ${error.code}`);
        expect(String(error.code) === '13900020' || String(error.code) === '401').assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_SET_ASSETS_0000
     * @tc.name      : sendable_set_assets_000
     * @tc.desc      : Set and get assets title to verify consistency
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_set_assets_000', Level.LEVEL0, async (done: Function) => {
      try {
        // Set new title
        let predicatesSet: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptionSet: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicatesSet
        };
        let fetchResultSet: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOptionSet);
        let photoAssetSet: sendablePhotoAccessHelper.PhotoAsset = await fetchResultSet.getFirstObject();
        let titleKey: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        let newTitle: string = 'newTitle';
        photoAssetSet.set(titleKey, newTitle);
        console.info('sendable_set_assets_000: suc');
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(`sendable_set_assets_000 failed, error: ${error}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_SENADABLE_SET_ERROR_0000
     * @tc.name      : sendable_error_set_assets_title_undefined
     * @tc.desc      : Set undefined title to verify error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_error_set_assets_title_undefined_000', Level.LEVEL0, async (done: Function) => {
      try {
        // Set new title
        let predicatesSet: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptionSet: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicatesSet
        };
        let fetchResultSet: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOptionSet);
        let photoAssetSet: sendablePhotoAccessHelper.PhotoAsset = await fetchResultSet.getFirstObject();
        let titleKey: string = photoAccessHelper.PhotoKeys.TITLE.toString();
        photoAssetSet.set(titleKey, undefined as ESObject);
        console.error('sendable_error_set_assets_title_undefined_000: expected to throw error');
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`sendable_error_set_assets_title_undefined_000: ${error}, ${error.code}`);
        expect(String(error.code) === '13900020' || String(error.code) === '401').assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_SENADABLE_ERROR_0100
     * @tc.name      : sendable_error_set_assets_key_invalid
     * @tc.desc      : Set invalid key to verify error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_error_set_assets_key_invalid_001', Level.LEVEL0, async (done: Function) => {
      try {
        // Set new title
        let predicatesSet: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptionSet: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicatesSet
        };
        let fetchResultSet: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOptionSet);
        let photoAssetSet: sendablePhotoAccessHelper.PhotoAsset = await fetchResultSet.getFirstObject();
        let titleKey: string = '!@#$%$%^^&**()_+卡拉胶奥拉夫';
        let newTitle: string = 'newTitle';
        photoAssetSet.set(titleKey, newTitle);
        console.error('sendable_error_set_assets_key_invalid_001: expected to throw error');
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`sendable_error_set_assets_key_invalid_001: ${error}, ${error.code}`);
        expect(error.code).assertEqual('14000014');
        done();
      }
    });
    /**
     * @tc.number    : SUB_SENDABLE_PHOTO_ACCESS_HELPER_SENADABLE_SET_ERROR_0200
     * @tc.name      : sendable_error_set_assets_key_undefined
     * @tc.desc      : Set undefined key to verify error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_error_set_assets_key_undefined_002', Level.LEVEL0, async (done: Function) => {
      try {
        // Set new title
        let predicatesSet: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptionSet: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicatesSet
        };
        let fetchResultSet: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOptionSet);
        let photoAssetSet: sendablePhotoAccessHelper.PhotoAsset = await fetchResultSet.getFirstObject();
        let newTitle: string = 'newTitle';
        photoAssetSet.set(undefined as ESObject, newTitle);
        console.error('sendable_error_set_assets_key_undefined_002: expected to throw error');
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`sendable_error_set_assets_key_undefined_002: ${error}, ${error.code}`);
        expect(String(error.code) === '13900020' || String(error.code) === '401').assertTrue();
        done();
      }
    });
  })
}