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
import dataSharePredicates from '@ohos.data.dataSharePredicates'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { photoKeys, fetchOption, getPermission, driveFn, sleep, pushCreateAsset} from '../common'
import common from '@ohos.app.ability.common'
import { BusinessError } from '@ohos.base';

export default function mediaAssetChangeRequestErrorTest() {
  describe('mediaAssetChangeRequestErrorTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
      const fileNames: Array<string> = [
        "testSaveCameraPhoto02.jpg",
      ];
      await pushCreateAsset(testContext, fileNames);
    });

    /**
     * @tc.name   create_image_asset_request_error_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_IMAGE_ASSET_REQUEST_ERROR_0000
     * @tc.desc   without jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('create_image_asset_request_error_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'create_image_asset_request_error_000';
      try {
        let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, fileUri);
        await helper.applyChanges(assetChangeRequest);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(error.code).assertEqual('13900002');
        done();
      }
    });
    /**
     * @tc.name   create_image_asset_request_error_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_IMAGE_ASSET_REQUEST_ERROR_0100
     * @tc.desc   with unindefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('create_image_asset_request_error_001', Level.LEVEL0, async (done: Function) => {
        let testNum = 'create_image_asset_request_error_001';
        try {
          let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(undefined, fileUri);
          await helper.applyChanges(assetChangeRequest);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('13900002');
          done();
        }
      });
    /**
     * @tc.name   create_image_asset_request_error_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_IMAGE_ASSET_REQUEST_ERROR_0200
     * @tc.desc   with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('create_image_asset_request_error_002', Level.LEVEL0, async (done: Function) => {
        let testNum = 'create_image_asset_request_error_002';
        try {
          let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.jpg';
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(null, null);
          await helper.applyChanges(assetChangeRequest);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('401');
          done();
        }
      });

    /**
     * @tc.name   create_video_asset_request_error_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_VIDEO_ASSET_REQUEST_ERROR_0000
     * @tc.desc   without jpg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('create_video_asset_request_error_000', Level.LEVEL0, async (done: Function) => {
        let testNum = 'create_video_asset_request_error_000';
        try {
          let fileUri = 'file://com.example.temptest/data/storage/el2/base/haps/entry/files/test.mp4';
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, fileUri);
          await helper.applyChanges(assetChangeRequest);
          console.info('apply createVideoAssetRequest successfully');
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('13900002');
          done();
        }
      });
    /**
     * @tc.name   create_video_asset_request_error_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CREATE_VIDEO_ASSET_REQUEST_ERROR_0100
     * @tc.desc   with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('create_video_asset_request_error_001', Level.LEVEL0, async (done: Function) => {
        let testNum = 'create_video_asset_request_error_001';
        try {
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(null, null);
          await helper.applyChanges(assetChangeRequest);
          console.info('apply createVideoAssetRequest successfully');
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('401');
          done();
        }
      });

    /**
     * @tc.name   set_orientation_error_000
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ORIENTITION_ERROR_0000
     * @tc.desc   with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_orientation_error_000', Level.LEVEL0, async (done: Function) => {
        let testNum = 'set_orientation_error_000';
        try {
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };

          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions)
          let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          console.info(`set_orientation_error_000 photoAsset is ${photoAsset.uri}`);
          let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
          assetChangeRequest.setOrientation(null);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('401');
          done();
        }
      });
    /**
     * @tc.name   set_album_name_error_000
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ALBUM_NAME_ERROR_0000
     * @tc.desc   with wrong title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_album_name_error_000', Level.LEVEL0, async (done: Function) => {
        let testNum = 'set_album_name_error_000';
        try {
          let album:ESObject = await helper.createAlbum(testNum);
          let albumChangeRequest:ESObject = new photoAccessHelper.MediaAlbumChangeRequest(album);
          console.info(`set_album_name_error_000 album.albumUri is ${album.albumUri}`);
          let newAlbumName: string = 'newAlbumName' + new Date().getTime() + 'adf啊发发！@#￥%……&*（）——+';
          albumChangeRequest.setAlbumName(newAlbumName);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('401');
          done();
        }
      });
    /**
     * @tc.name   set_album_name_error_001
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_ALBUM_NAME_ERROR_0100
     * @tc.desc   with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_album_name_error_001', Level.LEVEL0, async (done: Function) => {
        let testNum = 'set_album_name_error_001';
        try {
          let album:ESObject = await helper.createAlbum(testNum);
          let albumChangeRequest:ESObject = new photoAccessHelper.MediaAlbumChangeRequest(album);
          console.info(`set_album_name_error_001 album.albumUri is ${album.albumUri}`);
          albumChangeRequest.setAlbumName(null);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('401');
          done();
        }
      });
    /**
     * @tc.name   add_asserts_error_000
     * @tc.number SUB_PHOTOACCESS_HELPER_ADD_ASSERTS_ERROR_0000
     * @tc.desc   with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('add_asserts_error_000', Level.LEVEL0, async (done: Function) => {
        let testNum = 'add_asserts_error_000';
        try {
          //查询相片
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };
          //创造相册
          let album:ESObject = await helper.createAlbum(testNum);
          let albumChangeRequest:ESObject = new photoAccessHelper.MediaAlbumChangeRequest(album);
          console.info(`${testNum} album.albumUri is ${album.albumUri}`);
          //添加相片
          albumChangeRequest.addAssets(null);
          console.info(`${testNum} addAssets successfully`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('401');
          done();
        }
      });

    /**
     * @tc.name   remove_assets_error_000
     * @tc.number SUB_PHOTOACCESS_HELPER_REMOVE_ASSETS_ERROR_0000
     * @tc.desc   with null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('remove_assets_error_000', Level.LEVEL0, async (done: Function) => {
        let testNum = 'remove_assets_error_000';
        try {
          //查询相片
          let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
          let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
          };
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOptions);
          let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          console.info(`${testNum} photoAsset is ${asset.uri}`);

          //创造相册
          let album:ESObject = await helper.createAlbum(testNum);
          let albumChangeRequest:ESObject = new photoAccessHelper.MediaAlbumChangeRequest(album);
          console.info(`${testNum} album.albumUri is ${album.albumUri}`);

          albumChangeRequest.removeAssets(null);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(error.code).assertEqual('401');
          done();
        }
      });
  })
}