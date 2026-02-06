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
import { getPermission, driveFn, LOG_TAG, fetchAllOption, sleep, isEmpty, copyImageToSandbox } from '../common';
import common from '@ohos.app.ability.common';
import { Driver } from '@kit.TestKit';
import { dataSharePredicates } from '@kit.ArkData';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';
import { systemDateTime } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'sendableSuppAll';

async function sendableGetObjectByPositionPromiseTest(testName: string, callback: (fetchResult:sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset>) => void) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
  let fetchOption: photoAccessHelper.FetchOptions = {
    fetchColumns: [],
    predicates: predicates
  };
  let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOption);
  console.info(TAG, testName,'sendablePhotoAccessHelper.FetchResult success: ', fetchResult, callback);
  callback(fetchResult);
}
let power: ESObject;
export default function sendablePhotoAccessHelperSuppAllTest() {
  describe('sendablePhotoAccessHelperSuppAllTest', () => {
    let dr = Driver.create();
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(500);
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('empty');
    });


    /**
     * @tc.number   SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_001
     * @tc.name     SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_001
     * @tc.desc     sendable phAccessHelper.createAsset extension 255
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'qabcd123def456ghi789jkl012mno345pqr678stu901vwx234yzA567BC890DE123FG456HI789JK012LM345NO678PQ901RS234TU567VW890XY012ZA345BC678DE901FG234HI567JK890LM012NO345PQ678RS901TU234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnoa';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG,testName,'createAsset uri' + uri);
        console.info(TAG,testName,'createAsset successfully');
      } catch (err) {
        console.error(TAG,testName,`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('14000001');
      }
      done();
    })
    /**
     * @tc.number   SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_002
     * @tc.name     SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_002
     * @tc.desc     sendable phAccessHelper.createAsset extension 256
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'qabcd123def456ghi789jkl012mno345pqr678stu901vwx234yzA567BC890DE123FG456HI789JK012LM345NO678PQ901RS234TU567VW890XY012ZA345BC678DE901FG234HI567JK890LM012NO345PQ678RS901TU234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnoaq';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG,testName,'createAsset uri' + uri);
        console.info(TAG,testName,'createAsset successfully');
      } catch (err) {
        console.error(TAG,testName,`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('14000001');
      }
      done();
    })
    /**
     * @tc.number   SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_003
     * @tc.name     SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_003
     * @tc.desc     sendable phAccessHelper.createAsset extension 0
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_003';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = '';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG,testName,'createAsset uri' + uri);
        console.info(TAG,testName,'createAsset successfully');
      } catch (err) {
        console.error(TAG,testName,`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('14000001');
      }
      done();
    })
    /**
     * @tc.number   SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_004
     * @tc.name     SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_004
     * @tc.desc     sendable phAccessHelper.createAsset extension 1
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_createAsset_extension_004';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: sendablePhotoAccessHelper.PhotoType = sendablePhotoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'j';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
        console.info(TAG,testName,'createAsset uri' + uri);
        console.info(TAG,testName,'createAsset successfully');
      } catch (err) {
        console.error(TAG,testName,`createAsset failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('14000011');
      }
      done();
    })

    /**
     * @tc.number   SENDABLE_PHOTO_ACCESS_HELPER_clone_001
     * @tc.name     SENDABLE_PHOTO_ACCESS_HELPER_clone_001
     * @tc.desc     clone phAccessHelper title 255
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_clone_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_clone_001';
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
        console.info(TAG, testName, 'sendablePhotoAccessHelper.FetchResult success: ', fetchResult);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = 'qabcd123def456ghi789jkl012mno345pqr678stu901vwx234yzA567BC890DE123FG456HI789JK012LM345NO678PQ901RS234TU567VW890XY012ZA345BC678DE901FG234HI567JK890LM012NO345PQ678RS901TU234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnoa';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        console.info(TAG,testName,'photoAsset.PhotoAsset :' +newAsset);
      } catch (err) {
        console.error(TAG, testName, `getBurstAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.number   SENDABLE_PHOTO_ACCESS_HELPER_clone_002
     * @tc.name     SENDABLE_PHOTO_ACCESS_HELPER_clone_002
     * @tc.desc     clone phAccessHelper title 256
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_clone_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_clone_002';
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
        console.info(TAG, testName, 'sendablePhotoAccessHelper.FetchResult success: ', fetchResult);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = 'q1abcd123def456ghi789jkl012mno345pqr678stu901vwx234yzA567BC890DE123FG456HI789JK012LM345NO678PQ901RS234TU567VW890XY012ZA345BC678DE901FG234HI567JK890LM012NO345PQ678RS901TU234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890abcdefghijklmnoa';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        console.info(TAG,testName,'photoAsset.PhotoAsset :' +newAsset);
      } catch (err) {
        console.error(TAG, testName, `getBurstAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.number   SENDABLE_PHOTO_ACCESS_HELPER_clone_003
     * @tc.name     SENDABLE_PHOTO_ACCESS_HELPER_clone_003
     * @tc.desc     clone phAccessHelper title 0
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_clone_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_clone_003';
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
        console.info(TAG, testName, 'sendablePhotoAccessHelper.FetchResult success: ', fetchResult);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        console.info(TAG,testName,'photoAsset.PhotoAsset :' +newAsset);
      } catch (err) {
        console.error(TAG, testName, `getBurstAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })
    /**
     * @tc.number   SENDABLE_PHOTO_ACCESS_HELPER_clone_004
     * @tc.name     SENDABLE_PHOTO_ACCESS_HELPER_clone_004
     * @tc.desc     clone phAccessHelper title 1
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('SENDABLE_PHOTO_ACCESS_HELPER_clone_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SENDABLE_PHOTO_ACCESS_HELPER_clone_004';
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
        console.info(TAG, testName, 'sendablePhotoAccessHelper.FetchResult success: ', fetchResult);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: string = '1';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        console.info(TAG,testName,'photoAsset.PhotoAsset :' +newAsset);
      } catch (err) {
        console.error(TAG, testName, `getBurstAssets failed, error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      done();
    })

    /**
     * @tc.number    MEDIA_LIBRARY_KIT_SENDABLEPHOTO_GET_BURST_001
     * @tc.name      MEDIA_LIBRARY_KIT_SENDABLEPHOTO_GET_BURST_001
     * @tc.desc      Testing GetBurstAssets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT_SENDABLEPHOTO_GET_BURST_001", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT_SENDABLEPHOTO_GET_BURST_001';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(context);
        await phAccessHelper.getBurstAssets('e719d696-09fa-44f8-8e9e-ec3f215aa62a', null as ESObject);
        console.info(TAG, testName, 'getBurstAssets success');
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual('14000011');
      }
      done();
    })

    /**
     * @tc.number    MEDIA_LIBRARY_KIT_SENDABLEPHOTO_GET_BURST_002
     * @tc.name      MEDIA_LIBRARY_KIT_SENDABLEPHOTO_GET_BURST_002
     * @tc.desc      Testing GetBurstAssets
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT_SENDABLEPHOTO_GET_BURST_002", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT_SENDABLEPHOTO_GET_BURST_002';
      try {
        let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
        let phAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(context);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };

        let result = await phAccessHelper.getBurstAssets(null as ESObject,fetchOptions);
        console.info(TAG, testName, 'getBurstAssets success', result);
        expect().assertFail();
      }
      catch (error){
        console.error(TAG, testName, error.message, error.code);
        expect(error.code).assertEqual('401');
      }
      done();
    })


    /**
     * @tc.number    MEDIA_LIBRARY_KIT_SENDABLEPHOTO_ALBUM_GETASSETS_001
     * @tc.name      MEDIA_LIBRARY_KIT_SENDABLEPHOTO_ALBUM_GETASSETS_001
     * @tc.desc      Testing AbsAlbum getAssets 14000011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("MEDIA_LIBRARY_KIT_SENDABLEPHOTO_ALBUM_GETASSETS_001", Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_LIBRARY_KIT_SENDABLEPHOTO_ALBUM_GETASSETS_001';
      let context: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(context);
      console.info('getAlbumsDemo');
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        phAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.SYSTEM, sendablePhotoAccessHelper.AlbumSubtype.CAMERA, fetchOptions).then( async (fetchResult) => {
          if (fetchResult === undefined) {
            console.error(TAG,testName,'getAlbumsPromise fetchResult is undefined');
            return;
          }
          let album: sendablePhotoAccessHelper.Album = await fetchResult.getFirstObject();
          console.info(TAG,testName,'getAlbumsPromise successfully, albumName: ' + album.albumName);
          album.getAssets(undefined as ESObject);
          fetchResult.close();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG,testName,`getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
          expect(err.code).assertEqual('14000011');
          done();
        });
      } catch (err) {
        console.error(TAG,testName,`try getAlbumsPromise failed with err: ${err.code}, ${err.message}`);
        done();
      }
    })

  })
}