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
import common from '@ohos.app.ability.common';
import { getPermission, driveFn, sleep, photoType, getFileAsset, fetchOption, photoKeys, pushCreateAsset, albumSubtype, albumType } from '../common';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import fileio from '@ohos.fileio';
import { fileUri } from '@kit.CoreFileKit';

const URI_FORMAT_ERROR = 0;
const FILE_NOT_EXIST = 1;
const READ_PERMISSION = 2;
const NO_READ_PERMISSION = 3;

export default function checkPhotoUrisReadPermissionTest () {
  describe('checkPhotoUrisReadPermissionTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    const createAssetPromise = async (done: Function, testNum: string): Promise<string> => {
      const type = photoType.IMAGE;
      const extension = 'jpg';
      const options: photoAccessHelper.CreateOptions = {
        title: testNum
      };
      let photoAssetUri: string = '';
      try {
        photoAssetUri = await helper.createAsset(type, extension, options);
        return photoAssetUri;
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        return photoAssetUri;
      }
    }

    const getAlbumAssets = async (testNum: string, album: photoAccessHelper.Album, key: string, value: string | number) => {
      const predicates = new dataSharePredicates.DataSharePredicates();
      predicates.equalTo(key, value);
      const ops: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      const fetchResult = await album.getAssets(ops);
      console.info(`${testNum} asset count is: ${fetchResult.getCount()}`);
      const asset = await fetchResult.getLastObject();
      fetchResult.close();
      return asset
    }

    const getAlbum = async (testNum: string, type: photoAccessHelper.AlbumType, subtype: photoAccessHelper.AlbumSubtype) => {
      let predicatesAlbum: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptionsAlbum: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicatesAlbum
      };
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await helper.getAlbums(type, subtype, fetchOptionsAlbum);
      console.info(testNum + ' album count is ' + albumFetchResult.getCount());
      let album: photoAccessHelper.Album = await albumFetchResult.getLastObject();
      return album;
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Test_0100
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Test_0100
     * @tc.desc        check normal photo uri, return normal
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Test_0100', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Test_0100';
        try {
            let photoAssetUri = await createAssetPromise(done, testNum);
            const result = await helper.checkPhotoUrisReadPermission([photoAssetUri]);
            const state = result.get(photoAssetUri);
            expect(state).assertEqual(READ_PERMISSION);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0100
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0100
     * @tc.desc        check file uri, return URI_FORMAT_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0100', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0100';
      try {
          const result = await helper.checkPhotoUrisReadPermission(['file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg']);
          const state = result.get('file://ohos.acts.multimedia.photoaccess/data/storage/el2/base/haps/entry_test/photos/test_mov_1.jpg');
          expect(state).assertEqual(URI_FORMAT_ERROR);
          done();
      } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
      }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0200
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0200
     * @tc.desc        check abnormal_uri, return URI_FORMAT_ERROR
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0200', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0200';
      try {
          const result = await helper.checkPhotoUrisReadPermission(['abnormal_uri']);
          const state = result.get('abnormal_uri');
          expect(state).assertEqual(URI_FORMAT_ERROR);
          done();
      } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(false).assertTrue();
          done();
      }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0300
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0300
     * @tc.desc        check empty uri, error code is 23800151
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0300', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0300';
      try {
          const result = await helper.checkPhotoUrisReadPermission(['']);
          expect().assertFail();
          done();
      } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(Number(error.code)).assertEqual(23800151);
          done();
      }
    })

    /** 
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0400
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0400
     * @tc.desc        check over 500 uris, error code is 23800151
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0400', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0400';
      try {
          let photoAssetUri = await createAssetPromise(done, testNum);
          let uris: Array<string> = [];
          for (let i = 0; i < 501; i++) {
            uris.push(photoAssetUri);
          }
          const result = await helper.checkPhotoUrisReadPermission(uris);
          expect().assertFail();
          done();
      } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect(Number(error.code)).assertEqual(23800151);
          done();
      }
    })

    /** 
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0500
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0500
     * @tc.desc        check hidden asset uri, return FILE_NOT_EXIST
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0500', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0500';
      try {
          await pushCreateAsset(testContext, ['SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0500.jpg']);
          const fetchOps = fetchOption(testNum, photoKeys.TITLE, testNum);
          let asset = await getFileAsset(testContext, testNum, fetchOps);
          await asset.setHidden(true);
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper.getHiddenAlbums(photoAccessHelper.HiddenPhotosDisplayMode.ASSETS_MODE);
          console.info(testNum + 'album count is : ' + fetchResult.getCount());
          let album: photoAccessHelper.Album = await fetchResult.getLastObject();
          asset = await getAlbumAssets(testNum, album, photoKeys.TITLE, testNum);
          const result = await helper.checkPhotoUrisReadPermission([asset.uri]);
          const state = result.get(asset.uri);
          expect(state).assertEqual(FILE_NOT_EXIST);
          done();
      } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect().assertFail();
          done();
      }
    })

    /** 
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0600
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0600
     * @tc.desc        check trash asset uri, return FILE_NOT_EXIST
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0600', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0600';
      try {
          await pushCreateAsset(testContext, ['SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0600.jpg']);
          const fetchOps = fetchOption(testNum, photoKeys.TITLE, testNum);
          let asset = await getFileAsset(testContext, testNum, fetchOps);
          await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
          let trashAlbum: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
          asset = await getAlbumAssets(testNum, trashAlbum, photoKeys.TITLE, testNum);
          const result = await helper.checkPhotoUrisReadPermission([asset.uri]);
          const state = result.get(asset.uri);
          expect(state).assertEqual(FILE_NOT_EXIST);
          done();
      } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect().assertFail();
          done();
      }
    })

    /** 
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0700
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0700
     * @tc.desc        check deleted asset uri, return FILE_NOT_EXIST
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0700', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0700';
      try {
          await pushCreateAsset(testContext, ['SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0700.jpg']);
          const fetchOps = fetchOption(testNum, photoKeys.TITLE, testNum);
          let asset = await getFileAsset(testContext, testNum, fetchOps);
          await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, [asset]);
          let trashAlbum: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtype.TRASH);
          asset = await getAlbumAssets(testNum, trashAlbum, photoKeys.TITLE, testNum);
          let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(trashAlbum);
          albumChangeRequest.deleteAssets([asset]);
          await helper.applyChanges(albumChangeRequest);
          const result = await helper.checkPhotoUrisReadPermission([asset.uri]);
          const state = result.get(asset.uri);
          expect(state).assertEqual(FILE_NOT_EXIST);
          done();
      } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect().assertFail();
          done();
      }
    })

    /** 
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0800
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0800
     * @tc.desc        check not exit asset uri, return FILE_NOT_EXIST
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0800', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0800';
      try {
          const photoUri = 'file://media/Photo/0/IMG/not_exit.jpg'
          console.info(`${testNum} photo uri is: ${photoUri}`);
          const result = await helper.checkPhotoUrisReadPermission([photoUri]);
          const state = result.get(photoUri);
          expect(state).assertEqual(FILE_NOT_EXIST);
          done();
      } catch (error) {
          console.error(`${testNum} fail, error is ${error}, ${error.code}`);
          expect().assertFail();
          done();
      }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0900
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0900
     * @tc.desc        check empty, error code is 23800151
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0900', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_0900';
      try {
        const result = await helper.checkPhotoUrisReadPermission([]);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testNum} fail, error is ${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_1000
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_1000
     * @tc.desc        check empty uri, error code is 23800151
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_1000', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_1000';
      try {
        const result = await helper.checkPhotoUrisReadPermission(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testNum} fail, error is ${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_1100
     * @tc.name        SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_1100
     * @tc.desc        check empty uri, error code is 23800151
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_1100', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_checkPhotoUrisReadPermission_Abnormal_1100';
      try {
        const result = await helper.checkPhotoUrisReadPermission(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testNum} fail, error is ${error}, ${error.code}`);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    })

    /**
     * @tc.number      SUB_MultiMedia_MediaLibrary_MediaAssetPermissionState_Test_0000
     * @tc.name        SUB_MultiMedia_MediaLibrary_MediaAssetPermissionState_Test_0000
     * @tc.desc        check MediaAssetPermissionState value
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level 0
     */
    it('SUB_MultiMedia_MediaLibrary_MediaAssetPermissionState_Test_0000', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_MultiMedia_MediaLibrary_MediaAssetPermissionState_Test_0000';
      try {
        expect(photoAccessHelper.MediaAssetPermissionState.URI_FORMAT_ERROR).assertEqual(URI_FORMAT_ERROR);
        expect(photoAccessHelper.MediaAssetPermissionState.FILE_NOT_EXIST).assertEqual(FILE_NOT_EXIST);
        expect(photoAccessHelper.MediaAssetPermissionState.READ_PERMISSION).assertEqual(READ_PERMISSION);
        expect(photoAccessHelper.MediaAssetPermissionState.NO_READ_PERMISSION).assertEqual(NO_READ_PERMISSION);
        done();
      } catch (error) {
        console.error(`${testNum} fail, error is ${error}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
  })

  })
}
