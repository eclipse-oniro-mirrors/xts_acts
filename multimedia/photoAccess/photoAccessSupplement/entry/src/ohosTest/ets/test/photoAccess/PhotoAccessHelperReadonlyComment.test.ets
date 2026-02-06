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
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr, fetchOption } from '../common';
import common from '@ohos.app.ability.common';
import { dataSharePredicates } from '@kit.ArkData';

const TAG = LOG_TAG + 'photo.PhotoAccessHelperReadonlyComment';


async function photoAccessHelperSetTest(done: Function, testName: string, member:string,value:string,newTitle:string|undefined|null,callback: (errCode?: number) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOption);
    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    photoAsset.set(member, value);
    let result = photoAsset.get(member)
    console.info(TAG, testName, `photoAsset.title is: ${result},photoAsset set member and value success`);
    expect(result).assertEqual(newTitle);
  } catch (error) {
    console.error(TAG, testName, `failed; error:${error.message},${error}and:${error.code}`);
    callback(error.code);
    done();
  }
}

export default function PhotoAccessHelperReadonlyCommentSupp() {
  describe('PhotoAccessHelperReadonlyCommentSupp', () => {
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
     * @tc.number    Photo_Access_Helper_Readonly_MediaAssetChangeRequest_001
     * @tc.name      Photo_Access_Helper_Readonly_MediaAssetChangeRequest_001
     * @tc.desc      photoAccessHelper.MediaAssetChangeRequest
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_Readonly_MediaAssetChangeRequest_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_Readonly_MediaAssetChangeRequest_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        console.info(TAG, testName, 'photoAccessHelper.FetchResult success: ', fetchResult);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        console.info(TAG, testName, 'assetChangeRequest success: ', assetChangeRequest.comment);
        expect(assetChangeRequest.comment.length >0 ).assertTrue();
      }catch (err) {
        console.error(TAG,testName, `failed; error:${err.message},${err}and:${err.code}`)
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    Photo_Access_Helper_Readonly_MediaChangeRequest_001
     * @tc.name      Photo_Access_Helper_Readonly_MediaChangeRequest_001
     * @tc.desc      photoAccessHelper.MediaChangeRequest
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_Readonly_MediaChangeRequest_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_Readonly_MediaChangeRequest_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
        console.info(TAG, testName, 'photoAccessHelper.FetchResult success: ', fetchResult);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        console.info(TAG, testName, 'assetChangeRequest success: ', assetChangeRequest.comment);
        expect(assetChangeRequest.comment.length >0 ).assertTrue();
      }catch (err) {
        console.error(TAG,testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    Photo_Access_Helper_Readonly_MediaAlbumChangeRequest_001
     * @tc.name      Photo_Access_Helper_Readonly_MediaAlbumChangeRequest_001
     * @tc.desc      photoAccessHelper.MediaAlbumChangeRequest
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_Readonly_MediaAlbumChangeRequest_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_Readonly_MediaAlbumChangeRequest_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE, fetchOptions);
        console.info(TAG, testName, 'photoAccessHelper.FetchResult success: ', fetchResult);
        let album: photoAccessHelper.Album = await fetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =  new photoAccessHelper.MediaAlbumChangeRequest(album);
        console.info(TAG, testName, 'assetChangeRequest success: ', albumChangeRequest.comment);
        expect(albumChangeRequest.comment.length >0 ).assertTrue();
      }catch (err) {
        console.error(TAG,testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.number    Photo_Access_Helper_createPhotoAsset_001
     * @tc.name      Photo_Access_Helper_createPhotoAsset_001
     * @tc.desc      photoAccessHelper.createPhotoAsset
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_createPhotoAsset_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_createPhotoAsset_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        const uri = await phAccessHelper.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, 'jpg');
        console.info(TAG,testName,  `createPhotoAsset success; uri: ${uri}`);
        expect(uri.length > 0).assertTrue();
      }catch (err) {
        console.error(TAG,testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    Photo_Access_Helper_createPhotoAsset_002
     * @tc.name      Photo_Access_Helper_createPhotoAsset_002
     * @tc.desc      photoAccessHelper.createPhotoAsset
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_createPhotoAsset_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_createPhotoAsset_002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        const uri = await phAccessHelper.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, 'mp4');
        console.info(TAG, testName,`createPhotoAsset success; uri: ${uri}`);
        expect(uri.length > 0).assertTrue();
      }catch (err) {
        console.error(TAG,testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.number    Photo_Access_Helper_createPhotoAsset_003
     * @tc.name      Photo_Access_Helper_createPhotoAsset_003
     * @tc.desc      photoAccessHelper.createPhotoAsset
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_createPhotoAsset_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_createPhotoAsset_003';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        const uri = await phAccessHelper.createPhotoAsset(null, 'mp4');
        console.info(TAG,testName, `createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
      }catch (err) {
        console.error(TAG,testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect(err.code).assertEqual('23800151');
      }
      done();
    })

    /**
     * @tc.number    Photo_Access_Helper_createPhotoAsset_004
     * @tc.name      Photo_Access_Helper_createPhotoAsset_004
     * @tc.desc      photoAccessHelper.createPhotoAsset
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_createPhotoAsset_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_createPhotoAsset_004';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        const uri = await phAccessHelper.createPhotoAsset(undefined, 'mp4');
        console.info(TAG, testName,`createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect(err.code).assertEqual('23800151');
      }
      done();
    })
    /**
     * @tc.number    Photo_Access_Helper_createPhotoAsset_005
     * @tc.name      Photo_Access_Helper_createPhotoAsset_005
     * @tc.desc      photoAccessHelper.createPhotoAsset
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_createPhotoAsset_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_createPhotoAsset_005';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        const uri = await phAccessHelper.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, 'jpg');
        console.info(TAG, testName,`createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect(err.code).assertEqual('23800151');
      }
      done();
    })
    /**
     * @tc.number    Photo_Access_Helper_createPhotoAsset_006
     * @tc.name      Photo_Access_Helper_createPhotoAsset_006
     * @tc.desc      photoAccessHelper.createPhotoAsset
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_createPhotoAsset_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_createPhotoAsset_006';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        const uri = await phAccessHelper.createPhotoAsset(photoAccessHelper.PhotoType.VIDEO, '');
        console.info(TAG, testName,`createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect(err.code).assertEqual('23800151');
      }
      done();
    })
    /**
     * @tc.number    Photo_Access_Helper_createPhotoAsset_007
     * @tc.name      Photo_Access_Helper_createPhotoAsset_007
     * @tc.desc      photoAccessHelper.createPhotoAsset
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('Photo_Access_Helper_createPhotoAsset_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'Photo_Access_Helper_createPhotoAsset_007';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        const uri = await phAccessHelper.createPhotoAsset(photoAccessHelper.PhotoType.IMAGE, '');
        console.info(TAG, testName,`createPhotoAsset success; uri: ${uri}`);
        expect().assertFail();
      }catch (err) {
        console.error(TAG, testName, `failed; error:${err.message},${err}and:${err.code}`);
        expect(err.code).assertEqual('23800151');
      }
      done();
    })


    /**
     * @tc.number    PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_0001
     * @tc.name      PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_0001
     * @tc.desc      AlbumKeys.CHANGE_TIME == 'change_time'
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_0001', Level.LEVEL1, async (done:Function)=> {
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_0001---------')
      expect(photoAccessHelper.AlbumKeys.CHANGE_TIME == 'change_time').assertTrue();
      console.info(TAG,'--------PHOTO_ACCESS_HELPER_GET_ALBUMKEYS_0001,end here---------')
      done();
    })

  })
}