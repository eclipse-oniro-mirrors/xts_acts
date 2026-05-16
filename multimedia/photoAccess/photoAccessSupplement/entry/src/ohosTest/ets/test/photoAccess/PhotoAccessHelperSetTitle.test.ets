/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level, beforeEach, afterAll, afterEach } from '@ohos/hypium'
import { getPermission, driveFn, sleep, LOG_TAG, isEmpty, createUserAlbum } from '../common'
import common from '@ohos.app.ability.common'
import { Driver, MatchPattern, On, ON } from '@ohos.UiTest';
import { dataSharePredicates } from '@kit.ArkData';
import { JSON } from '@kit.ArkTS';
import { image } from '@kit.ImageKit';
import { sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = LOG_TAG + 'PhotoSetTitleSupp';

class MovingPhotoHandler implements photoAccessHelper.MediaAssetDataHandler<photoAccessHelper.MovingPhoto> {
  async onDataPrepared(movingPhoto: photoAccessHelper.MovingPhoto) {
    if (movingPhoto === undefined) {
      console.error('Error occurred when preparing data');
      return;
    }
    let uri = movingPhoto.getUri();
    console.info("moving photo acquired successfully, uri: " + movingPhoto.getUri());
    expect(isEmpty(uri)).assertFalse();
  }
}
export default function PhotoSetTitleTestSupp() {
  describe('PhotoSetTitleTestSupp', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let PhAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
    let driver: Driver | undefined = Driver.create();
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
      await createUserAlbum(testContext, TAG, 'PhotoSetTitleTestSupp');
      await sleep(500);
      AppStorage.setOrCreate('emptyString', '');
    });
    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });
    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });
    afterAll(() => {
      console.info(TAG, 'afterAll case.');
      AppStorage.delete('emptyString');
    });
    /**
     * @tc.number    SUB_PHOTO_VIEW_PICKER_SELECT_PROMISE_00001
     * @tc.name      SUB_PHOTO_VIEW_PICKER_SELECT_PROMISE_00001
     * @tc.desc      PhotoViewPicker.select-参数属性覆盖-true
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_VIEW_PICKER_SELECT_PROMISE_00001', Level.LEVEL0, async (done: Function) => {
      let testName= 'SUB_PHOTO_VIEW_PICKER_SELECT_PROMISE_00001';
      try {
        let photoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 5;
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        photoSelectOptions.isEditSupported = true;
        photoSelectOptions.isOriginalSupported = true;
        photoSelectOptions.isDestroyedWithNavigation = true;
        photoSelectOptions.isReturnToPhotoBrowserEnabled = true;
        photoSelectOptions.subWindowName = "";
        photoSelectOptions.completeButtonText = 0;
        let phAsset = {albumUri :'',displayName:'',gridLevel:0} as photoAccessHelper.ContextRecoveryInfo;
        photoPicker.select(photoSelectOptions).then((photoSelectResult)=>{
          console.info(TAG,testName,'PhotoViewPicker.select successfully, photoSelectResult uri: ' + JSON.stringify(photoSelectResult));
          expect(isEmpty(photoSelectResult)).assertFalse();
          done();
        })
        await sleep(3000);
        await driver?.click(400,550)
        await sleep(3000);
        let power = await driver?.waitForComponent(ON.text('完成', MatchPattern.EQUALS), 500);
        await power?.click();
      }
      catch (error) {
        console.error(TAG,`${testName} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_VIEW_PICKER_SELECT_PROMISE_00008
     * @tc.name      SUB_PHOTO_VIEW_PICKER_SELECT_PROMISE_00008
     * @tc.desc      PhotoViewPicker.select-第一个参数为null
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_VIEW_PICKER_SELECT_PROMISE_00008', Level.LEVEL0, async (done: Function) => {
      let testName= 'SUB_PHOTO_VIEW_PICKER_SELECT_PROMISE_00008';
      try {
        let photoSelectOptions = new photoAccessHelper.PhotoSelectOptions();
        photoSelectOptions.MIMEType = photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE;
        photoSelectOptions.maxSelectNumber = 5;
        let photoPicker = new photoAccessHelper.PhotoViewPicker();
        let photoSelectResult = await photoPicker.select(null);
        console.info(TAG,testName,'PhotoViewPicker.select successfully, photoSelectResult uri: '+ JSON.stringify(photoSelectResult) );
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testName} failed; error: ${error.code}`,JSON.stringify(error));
        expect(error.code).assertUndefined();
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_SUPPORTED_PHOTO_FORMATS_001
     * @tc.name     SUB_GET_SUPPORTED_PHOTO_FORMATS_001
     * @tc.desc     getSupportedPhotoFormats-非空覆盖PhotoType-IMAGE
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_SUPPORTED_PHOTO_FORMATS_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_SUPPORTED_PHOTO_FORMATS_001";
      try {
        let outputText: string;
        outputText = 'The supported types are:\n';
        let imageFormat = await PhAccessHelper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.IMAGE);
        console.info(TAG, testName, "successfully", imageFormat);
        expect(imageFormat.length > 0).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed getSupportedPhotoFormats', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_SUPPORTED_PHOTO_FORMATS_002
     * @tc.name     SUB_GET_SUPPORTED_PHOTO_FORMATS_002
     * @tc.desc     getSupportedPhotoFormats-非空覆盖PhotoType-VIDEO
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_SUPPORTED_PHOTO_FORMATS_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_SUPPORTED_PHOTO_FORMATS_002";
      try {
        let outputText: string;
        outputText = 'The supported types are:\n';
        let imageFormat = await PhAccessHelper.getSupportedPhotoFormats(photoAccessHelper.PhotoType.VIDEO);
        console.info(TAG, testName, "successfully", imageFormat);
        expect(imageFormat.length > 0).assertTrue()
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed getSupportedPhotoFormats', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_TITLE_TEST_001
     * @tc.name     SUB_SET_TITLE_TEST_001
     * @tc.desc     setTitle-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_TITLE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_TITLE_TEST_001";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setTitle', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_TITLE_TEST_002
     * @tc.name     SUB_SET_TITLE_TEST_002
     * @tc.desc     setTitle-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_TITLE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_TITLE_TEST_002";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setTitle', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_TITLE_TEST_003
     * @tc.name     SUB_SET_TITLE_TEST_003
     * @tc.desc     setTitle-第一个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_TITLE_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_TITLE_TEST_003";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(AppStorage.get('emptyString'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setTitle', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ORIENTATION_TEST_001
     * @tc.name     SUB_SET_ORIENTATION_TEST_001
     * @tc.desc     setOrientation-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ORIENTATION_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ORIENTATION_TEST_001";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setOrientation(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setOrientation', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ORIENTATION_TEST_002
     * @tc.name     SUB_SET_ORIENTATION_TEST_002
     * @tc.desc     setOrientation-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ORIENTATION_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ORIENTATION_TEST_002";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setOrientation(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setOrientation', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ORIENTATION_TEST_003
     * @tc.name     SUB_SET_ORIENTATION_TEST_003
     * @tc.desc     setOrientation-第一个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ORIENTATION_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ORIENTATION_TEST_003";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset = await fetchResult.getFirstObject();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setOrientation(AppStorage.get('emptyString'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setOrientation', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number   SUB_DELETE_ASSETS_STRING_TEST_004
     * @tc.name     SUB_DELETE_ASSETS_STRING_TEST_004
     * @tc.desc     deleteAssets-第二参数为Array<String>型-第二个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_DELETE_ASSETS_STRING_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_DELETE_ASSETS_STRING_TEST_004";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let res = await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, null);
        console.info(TAG, testName, 'deleteAssets successfully', res);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed deleteAssets', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_DELETE_ASSETS_STRING_TEST_005
     * @tc.name     SUB_DELETE_ASSETS_STRING_TEST_005
     * @tc.desc     deleteAssets-第二参数为Array<String>型-第二个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_DELETE_ASSETS_STRING_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_DELETE_ASSETS_STRING_TEST_005";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {

        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await PhAccessHelper.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let res = await photoAccessHelper.MediaAssetChangeRequest.deleteAssets(testContext, undefined);
        console.info(TAG, testName, 'deleteAssets successfully', res);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed deleteAssets', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_ADD_ASSETS_TEST_001
     * @tc.name     SUB_ADD_ASSETS_TEST_001
     * @tc.desc     MediaAlbumChangeRequest.addAssets-第一参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ADD_ASSETS_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ADD_ASSETS_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.addAssets(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed addAssetsDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_ADD_ASSETS_TEST_002
     * @tc.name     SUB_ADD_ASSETS_TEST_002
     * @tc.desc     MediaAlbumChangeRequest.addAssets-第一参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ADD_ASSETS_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ADD_ASSETS_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.addAssets(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed addAssetsDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_ADD_ASSETS_TEST_003
     * @tc.name     SUB_ADD_ASSETS_TEST_003
     * @tc.desc     MediaAlbumChangeRequest.addAssets-第一参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ADD_ASSETS_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ADD_ASSETS_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.addAssets([]);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed addAssetsDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_REMOVE_ASSETS_TEST_001
     * @tc.name     SUB_REMOVE_ASSETS_TEST_001
     * @tc.desc     MediaAlbumChangeRequest.removeAssets-第一参数null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REMOVE_ASSETS_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REMOVE_ASSETS_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.removeAssets(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed removeAssetsDemo  ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_REMOVE_ASSETS_TEST_002
     * @tc.name     SUB_REMOVE_ASSETS_TEST_002
     * @tc.desc     MediaAlbumChangeRequest.removeAssets-第一参数undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REMOVE_ASSETS_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REMOVE_ASSETS_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.removeAssets(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed removeAssetsDemo  ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_REMOVE_ASSETS_TEST_003
     * @tc.name     SUB_REMOVE_ASSETS_TEST_003
     * @tc.desc     MediaAlbumChangeRequest.removeAssets-第一参数空数组覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REMOVE_ASSETS_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REMOVE_ASSETS_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.removeAssets([]);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed removeAssetsDemo  ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ALBUM_NAME_TEST_001
     * @tc.name     SUB_SET_ALBUM_NAME_TEST_001
     * @tc.desc     setAlbumName-第一参数null覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ALBUM_NAME_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ALBUM_NAME_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setAlbumNameDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ALBUM_NAME_TEST_002
     * @tc.name     SUB_SET_ALBUM_NAME_TEST_002
     * @tc.desc     setAlbumName-第一参数undefined覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ALBUM_NAME_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ALBUM_NAME_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setAlbumNameDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SET_ALBUM_NAME_TEST_003
     * @tc.name     SUB_SET_ALBUM_NAME_TEST_003
     * @tc.desc     setAlbumName-第一参数空字符串覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SET_ALBUM_NAME_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SET_ALBUM_NAME_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(AppStorage.get('emptyString'));
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed setAlbumNameDemo ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number   SUB_GET_ALBUM_TEST_001
     * @tc.name     SUB_GET_ALBUM_TEST_001
     * @tc.desc     getAlbum-所有属性覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ALBUM_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ALBUM_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.ANY);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
          new photoAccessHelper.MediaAlbumChangeRequest(album);
        let changeRequestAlbum: photoAccessHelper.Album = albumChangeRequest.getAlbum();
        console.info(TAG, testName, 'change request album uri: ' + changeRequestAlbum.albumUri);
        console.info(TAG, testName, 'change request album uri1: ' + changeRequestAlbum.imageCount);
        console.info(TAG, testName, 'change request album uri2: ' + changeRequestAlbum.videoCount);
        expect(changeRequestAlbum.imageCount != undefined).assertTrue();
        expect(changeRequestAlbum.videoCount != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAlbumDemo Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_003
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_003
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_003";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        await PhAccessHelper.showSingleAssetCreationDialogEx(null, creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_004
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_004
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_004";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        await PhAccessHelper.showSingleAssetCreationDialogEx(undefined, creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_005
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_005
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为空字符串
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_005";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        await PhAccessHelper.showSingleAssetCreationDialogEx(AppStorage.get('emptyString'), creationSetting,
          isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName,
          'showSingleAssetCreationDialogEx failed, errCode is ' + error.code + ', errMsg is ' + error.message);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_TEST_001
     * @tc.name     SUB_AlBUM_ADD_ASSETS_TEST_001
     * @tc.desc     Album.AddAssets-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets(null, () => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_TEST_002
     * @tc.name     SUB_AlBUM_ADD_ASSETS_TEST_002
     * @tc.desc     Album.AddAssets-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets(undefined, () => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_TEST_003
     * @tc.name     SUB_AlBUM_ADD_ASSETS_TEST_003
     * @tc.desc     Album.AddAssets-第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets([], (err) => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_001
     * @tc.name     SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_001
     * @tc.desc     Album.AddAssets-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets(null).then(() => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_002
     * @tc.name     SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_002
     * @tc.desc     Album.AddAssets-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets(undefined).then(() => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_003
     * @tc.name     SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_003
     * @tc.desc     Album.AddAssets-第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_ADD_ASSETS_PROMISE_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.addAssets([]).then(() => {
          console.info(TAG, testName, 'addAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets with null param Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_001
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_001
     * @tc.desc     RemoveAssets-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets(null, () => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_002
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_002
     * @tc.desc     RemoveAssets-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets(undefined, () => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_003
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_003
     * @tc.desc     RemoveAssets-第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_CALLBACK_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets([], () => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_TEST_001
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_TEST_001
     * @tc.desc     RemoveAssets-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_TEST_001";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets(null).then(() => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_TEST_002
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_TEST_002
     * @tc.desc     RemoveAssets-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_TEST_002";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets(undefined).then(() => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_AlBUM_REMOVE_ASSETS_TEST_003
     * @tc.name     SUB_AlBUM_REMOVE_ASSETS_TEST_003
     * @tc.desc     RemoveAssets-第一个参数为空数组
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_AlBUM_REMOVE_ASSETS_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_AlBUM_REMOVE_ASSETS_TEST_003";
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        album.removeAssets([]).then(() => {
          console.info(TAG, testName, 'album removeAssets successfully');
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'album addAssets Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });

    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_001
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_001
     * @tc.desc     requestPhotoUrisReadPermissionEx-空数组覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_001";
      try {
        let srcFileUris: Array<string> = [];
        let requestReadPermissionResult: photoAccessHelper.RequestReadPermissionResult =
          await PhAccessHelper.requestPhotoUrisReadPermissionEx(srcFileUris);
        console.info('requestPhotoUrisReadPermissionEx success, data is ' + requestReadPermissionResult);
        expect(isEmpty(requestReadPermissionResult)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermissionEx failed', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_002
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_002
     * @tc.desc     requestPhotoUrisReadPermissionEx-第一个参数null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_002";
      try {
        let requestReadPermissionResult: photoAccessHelper.RequestReadPermissionResult =
          await PhAccessHelper.requestPhotoUrisReadPermissionEx(null);
        console.info(TAG, testName, 'requestPhotoUrisReadPermissionEx success, data is ' + requestReadPermissionResult);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermissionEx failed', error, 'failed', error.code);
        expect(isEmpty(error)).assertFalse();
        done();
      }
    });
    /**
     * @tc.number   SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_003
     * @tc.name     SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_003
     * @tc.desc     requestPhotoUrisReadPermissionEx-第一个参数undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_REQUEST_PHOTO_URIS_READ_PERMISSION_EX_003";
      try {
        let requestReadPermissionResult: photoAccessHelper.RequestReadPermissionResult =
          await PhAccessHelper.requestPhotoUrisReadPermissionEx(undefined);
        console.info(TAG, testName, 'requestPhotoUrisReadPermissionEx success, data is ' + requestReadPermissionResult);
        expect(isEmpty(requestReadPermissionResult)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'requestPhotoUrisReadPermissionEx failed', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_CHANGE_TEST_001
     * @tc.name     SUB_ON_SINGLE_PHOTO_CHANGE_TEST_001
     * @tc.desc     onSinglePhotoChange-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_CHANGE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_CHANGE_TEST_001";
      try {
        PhAccessHelper.onSinglePhotoChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_CHANGE_TEST_002
     * @tc.name     SUB_ON_SINGLE_PHOTO_CHANGE_TEST_002
     * @tc.desc     onSinglePhotoChange-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_CHANGE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_CHANGE_TEST_002";
      try {
        PhAccessHelper.onSinglePhotoChange(undefined, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001
     * @tc.name     SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001
     * @tc.desc     onSinglePhotoAlbumChange-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001";
      try {
        PhAccessHelper.onSinglePhotoAlbumChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002
     * @tc.name     SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002
     * @tc.desc     onSinglePhotoAlbumChange-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002";
      try {
        PhAccessHelper.onSinglePhotoAlbumChange(undefined, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001
     * @tc.name     SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001
     * @tc.desc     offSinglePhotoAlbumChange-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_001";
      try {
        PhAccessHelper.offSinglePhotoAlbumChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002
     * @tc.name     SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002
     * @tc.desc     offSinglePhotoAlbumChange-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_SINGLE_PHOTO_ALBUM_CHANGE_TEST_002";
      try {
        PhAccessHelper.offSinglePhotoAlbumChange(undefined, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_001
     * @tc.name     SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_001
     * @tc.desc     offSinglePhotoChange-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_001";
      try {
        PhAccessHelper.offSinglePhotoChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_002
     * @tc.name     SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_002
     * @tc.desc     offSinglePhotoChange-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_002";
      try {
        PhAccessHelper.offSinglePhotoChange(null, () => {
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_003
     * @tc.name     SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_003
     * @tc.desc     onSinglePhotoAlbumChange-返回值属性覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_ALBUM_CHANGE_TEST_003";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => {
        console.info(TAG,testName,'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        expect(changeData.type == 2).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
        expect(isEmpty(changeData.albumChangeDatas)).assertFalse()
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        PhAccessHelper.onSinglePhotoAlbumChange(album, onCallback);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName'+ new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await PhAccessHelper.applyChanges(albumChangeRequest);
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_CHANGE_TEST_003
     * @tc.name     SUB_ON_SINGLE_PHOTO_CHANGE_TEST_003
     * @tc.desc     onSinglePhotoChange-返回值属性覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_CHANGE_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_CHANGE_TEST_003";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG,testName,'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        expect(changeData.type == 1).assertTrue();
        expect(changeData.isForRecheck).assertFalse();
        expect(isEmpty(changeData.assetChangeDatas)).assertFalse()
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        PhAccessHelper.onSinglePhotoChange(asset, onCallback);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(newTitle);
        PhAccessHelper.applyChanges(assetChangeRequest);
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_CHANGE_TEST_004
     * @tc.name     SUB_ON_SINGLE_PHOTO_CHANGE_TEST_004
     * @tc.desc     onSinglePhotoChange-第一个参数属性uri''覆盖,photoType枚举覆盖,displayName''覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_CHANGE_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_CHANGE_TEST_004";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG,testName,'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let asset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
        PhAccessHelper.onSinglePhotoChange(asset, onCallback);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_003
     * @tc.name     SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_003
     * @tc.desc     offSinglePhotoChange-第一个参数属性uri''覆盖,photoType枚举IMAGE覆盖,displayName''覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_003";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG,testName,'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let asset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
        PhAccessHelper.offSinglePhotoChange(asset, onCallback);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_ASSET_TEST_001
     * @tc.name     SUB_GET_ASSET_TEST_001
     * @tc.desc     getAsset-所有属性覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_ASSET_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_ASSET_TEST_001";
      try {
        let fileUri = testContext.filesDir + '/01.jpg';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        let asset: photoAccessHelper.PhotoAsset = assetChangeRequest.getAsset();
        console.info(TAG, testName, 'create asset successfully with uri = ' + asset.uri);
        expect(asset.uri.length > 0).assertTrue();
        expect(asset.displayName.length > 0).assertTrue();
        expect(asset.photoType).assertEqual(photoAccessHelper.PhotoType.IMAGE);
        done();
      } catch (error) {
        console.error(TAG, testName, ' getAssetDemo  Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_ASSET_REQUEST_TEST_001
     * @tc.name     SUB_CREATE_ASSET_REQUEST_TEST_001
     * @tc.desc     createAssetRequest-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_ASSET_REQUEST_TEST_001", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_ASSET_REQUEST_TEST_001";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(null, photoType, extension, options);
        let fileUri = testContext.filesDir + '/01.jpg';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect(assetChangeRequest != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_ASSET_REQUEST_TEST_002
     * @tc.name     SUB_CREATE_ASSET_REQUEST_TEST_002
     * @tc.desc     createAssetRequest-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_ASSET_REQUEST_TEST_002", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_ASSET_REQUEST_TEST_002";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(undefined, photoType, extension, options);
        let fileUri = testContext.filesDir + '/01.jpg';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        console.info(TAG, testName, 'apply createAssetRequest successfully', fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect(assetChangeRequest != undefined).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_SUPPORTED_PHOTO_FORMATS_003
     * @tc.name     SUB_GET_SUPPORTED_PHOTO_FORMATS_003
     * @tc.desc     getSupportedPhotoFormats-null-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_SUPPORTED_PHOTO_FORMATS_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_SUPPORTED_PHOTO_FORMATS_003";
      try {
        let outputText: string;
        outputText = 'The supported types are:\n';
        let imageFormat = await PhAccessHelper.getSupportedPhotoFormats(null);
        console.info(TAG, testName, "successfully", imageFormat);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed getSupportedPhotoFormats', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_GET_SUPPORTED_PHOTO_FORMATS_004
     * @tc.name     SUB_GET_SUPPORTED_PHOTO_FORMATS_004
     * @tc.desc     getSupportedPhotoFormats-undefined-13900020
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_GET_SUPPORTED_PHOTO_FORMATS_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_GET_SUPPORTED_PHOTO_FORMATS_004";
      try {
        let outputText: string;
        outputText = 'The supported types are:\n';
        let imageFormat = await PhAccessHelper.getSupportedPhotoFormats(undefined);
        console.info(TAG, testName, "successfully", imageFormat);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, 'Failed getSupportedPhotoFormats', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_ASSET_REQUEST_TEST_003
     * @tc.name     SUB_CREATE_ASSET_REQUEST_TEST_003
     * @tc.desc     createAssetRequest-第四个参数属性覆盖default
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_ASSET_REQUEST_TEST_003", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_ASSET_REQUEST_TEST_003";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        options.subtype = 0;
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        let fileUri = testContext.filesDir + '/01.jpg';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        console.info(TAG, testName, 'apply createAssetRequest successfully', fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect(isEmpty(assetChangeRequest)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_ASSET_REQUEST_TEST_004
     * @tc.name     SUB_CREATE_ASSET_REQUEST_TEST_004
     * @tc.desc     createAssetRequest-第四个参数属性覆盖burst
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_ASSET_REQUEST_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_ASSET_REQUEST_TEST_004";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        options.subtype = 4;
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        let fileUri = testContext.filesDir + '/01.jpg';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        console.info(TAG, testName, 'apply createAssetRequest successfully', fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });


    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_009
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_009
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为""
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_009", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_009";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        PhAccessHelper.showSingleAssetCreationDialogEx("", creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0010
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0010
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为null
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0010", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0010";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        PhAccessHelper.showSingleAssetCreationDialogEx(null, creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0011
     * @tc.name     SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0011
     * @tc.desc     showSingleAssetCreationDialogEx-第一个参数为undefined
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0011", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_SHOW_SINGLE_ASSET_CREATION_DIALOG_EX_TEST_0011";
      try {
        let creationSetting: photoAccessHelper.CreationSetting = {
          title: 'test',
          fileNameExtension: 'jpg',
          photoType: photoAccessHelper.PhotoType.IMAGE
        }
        let isImageFullyDisplayed: boolean = true
        PhAccessHelper.showSingleAssetCreationDialogEx(undefined, creationSetting, isImageFullyDisplayed);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number   SUB_CREATE_ASSET_REQUEST_TEST_005
     * @tc.name     SUB_CREATE_ASSET_REQUEST_TEST_005
     * @tc.desc     createAssetRequest-返回值属性comment覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_CREATE_ASSET_REQUEST_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_CREATE_ASSET_REQUEST_TEST_005";
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        let fileUri = testContext.filesDir + '/01.jpg';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        console.info(TAG, testName, 'apply createAssetRequest successfully', fileUri);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        console.info(TAG, testName, 'apply createAssetRequest successfully', assetChangeRequest);
        expect(isEmpty(assetChangeRequest.comment)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, ' Failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });


    /**
     * @tc.number   SUB_ON_SINGLE_PHOTO_CHANGE_TEST_005
     * @tc.name     SUB_ON_SINGLE_PHOTO_CHANGE_TEST_005
     * @tc.desc     onSinglePhotoChange-第一个参数属性uri''覆盖,photoType枚举video覆盖,displayName''覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_ON_SINGLE_PHOTO_CHANGE_TEST_005", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_ON_SINGLE_PHOTO_CHANGE_TEST_005";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG,testName,'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let asset = {uri : '',photoType:2,displayName:''} as photoAccessHelper.PhotoAsset;
        PhAccessHelper.onSinglePhotoChange(asset, onCallback);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number   SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_004
     * @tc.name     SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_004
     * @tc.desc     offSinglePhotoChange-第一个参数属性uri''覆盖,photoType枚举VIDEO覆盖,displayName''覆盖
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it("SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_004", Level.LEVEL0, async (done: Function) => {
      const testName = "SUB_OFF_SINGLE_PHOTO_CHANGE_TEST_004";
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG,testName,'onCallback1 success, changeData: ' + JSON.stringify(changeData));
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let asset = {uri : '',photoType:2,displayName:''} as photoAccessHelper.PhotoAsset;
        PhAccessHelper.offSinglePhotoChange(asset, onCallback);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, testName, 'Failed ', JSON.stringify(error), error.code);
        expect(Number(error.code)).assertEqual(23800151);
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_000001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_000001
     * @tc.desc      getThumbnail-补充返回值属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_000001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_000001';
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
        photoAsset.getThumbnail((err, pixelMap) => {
            console.info(TAG, testNum,'getThumbnail successful ' + pixelMap.isEditable);
            expect(pixelMap.isEditable).assertFalse();
            done();
        });
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_000002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_000002
     * @tc.desc      getThumbnail-返回值属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_000002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_THUMBNAIL_000002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let size: image.Size = { width: 720, height: 720 };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        photoAsset.getThumbnail(size,(err, pixelMap) => {
            console.info(TAG,testNum,'getThumbnail successful ' + pixelMap);
            expect(pixelMap.isEditable == true).assertFalse();
            done();
        });
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_00001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_00001
     * @tc.desc      clone-返回值属性枚举覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_00001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_CLONE_00001';
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
        let title: string = 'title';
        let newAsset: photoAccessHelper.PhotoAsset = await photoAsset.clone(title);
        expect(isEmpty(newAsset.uri)).assertFalse();
        expect(photoAsset.photoType == 1 || photoAsset.photoType == 2).assertTrue();
        expect(isEmpty(newAsset.displayName)).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_000001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_000001
     * @tc.desc      getPhotoAccessHelper-返回值属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_000001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_000001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      try {
        let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
        console.info(TAG,testNum,'succeed',JSON.stringify(phAccessHelper))
        expect(isEmpty([phAccessHelper])).assertFalse();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_00001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_00001
     * @tc.desc      getLastObject-返回值所有属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_00001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_ASSET_GET_LAST_OBJECT_00001';
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
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
        expect(isEmpty(photoAsset.uri)).assertFalse();
        expect(isEmpty(photoAsset.displayName)).assertFalse();
        expect(photoAsset.photoType == 1 || photoAsset.photoType == 2).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_PHOTO_ASSET_GET_NEXT_OBJECT_CALLBACK_00001
     * @tc.name      SUB_PHOTO_PHOTO_ASSET_GET_NEXT_OBJECT_CALLBACK_00001
     * @tc.desc      getNextObject-返回值所有属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_PHOTO_ASSET_GET_NEXT_OBJECT_CALLBACK_00001', Level.LEVEL0, async (done: Function) => {
      let testName= 'SUB_PHOTO_PHOTO_ASSET_GET_NEXT_OBJECT_CALLBACK_00001';
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
        await fetchResult.getFirstObject();
          fetchResult.getNextObject((err, photoAsset) => {
            console.info(TAG,testName,'succeed');
            expect(isEmpty(photoAsset.uri)).assertFalse();
            expect(isEmpty(photoAsset.displayName)).assertFalse();
            expect(photoAsset.photoType == 1 || photoAsset.photoType == 2).assertTrue();
            done();
          });
        }
      catch (error) {
        console.error(TAG,`${testName} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_PHOTO_ASSET_GET_NEXT_OBJECT_PROMISE_00001
     * @tc.name      SUB_PHOTO_PHOTO_ASSET_GET_NEXT_OBJECT_PROMISE_00001
     * @tc.desc      getNextObject-返回值所有属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_PHOTO_ASSET_GET_NEXT_OBJECT_PROMISE_00001', Level.LEVEL0, async (done: Function) => {
      let testName= 'SUB_PHOTO_PHOTO_ASSET_GET_NEXT_OBJECT_PROMISE_00001';
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
        await fetchResult.getFirstObject();
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getNextObject();
        console.info(TAG,testName,'succeed');
          expect(isEmpty(photoAsset.uri)).assertFalse();
          expect(isEmpty(photoAsset.displayName)).assertFalse();
          expect(photoAsset.photoType == 1 || photoAsset.photoType == 2).assertTrue();
          done();
      }
      catch (error) {
        console.error(TAG,`${testName} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name     SUB_SENDABLE_PHOTO_GET_TEST_00001
     * @tc.number   SUB_SENDABLE_PHOTO_GET_TEST_00001
     * @tc.desc     SendAblePhotoAsset get 返回值覆盖
     * @tc.type     FUNCTION
     * @tc.size     MEDIUMTEST
     * @tc.level    LEVEL0
     */
    it('SUB_SENDABLE_PHOTO_GET_TEST_00001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_SENDABLE_PHOTO_GET_TEST_00001'
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        console.info(TAG, testName, "getAssets start");
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: ['title'],
          predicates: predicates
        };
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let title: photoAccessHelper.PhotoKeys = photoAccessHelper.PhotoKeys.TITLE;
        let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get(title.toString());
        expect(isEmpty(photoAssetTitle)).assertFalse();
        done();
      } catch (error) {
        console.error(TAG, testName, 'getAssets failed ', JSON.stringify(error), error.code);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_PHOTO_ASSET_GET_NEXT_OBJECT_PROMISE_00001
     * @tc.name      SUB_SENDABLE_PHOTO_ASSET_GET_NEXT_OBJECT_PROMISE_00001
     * @tc.desc      sendable-getNextObject-返回值所有属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_SENDABLE_PHOTO_ASSET_GET_NEXT_OBJECT_PROMISE_00001', Level.LEVEL0, async (done: Function) => {
      let testName= 'SUB_SENDABLE_PHOTO_ASSET_GET_NEXT_OBJECT_PROMISE_00001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        await fetchResult.getFirstObject();
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getNextObject();
        console.info(TAG,testName,'succeed');
        expect(isEmpty(photoAsset.uri)).assertFalse();
        expect(isEmpty(photoAsset.displayName)).assertFalse();
        expect(photoAsset.photoType == 1 || photoAsset.photoType == 2).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testName} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });
    /**
     * @tc.name   SUB_ON_PHOTO_ALBUM_CHANGE_001
     * @tc.number SUB_ON_PHOTO_ALBUM_CHANGE_001
     * @tc.desc   PhotoAccessHelper.on_photoAlbumChange-返回值所有属性覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ON_PHOTO_ALBUM_CHANGE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_ON_PHOTO_ALBUM_CHANGE_001';
      let onCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => {
        console.info(TAG,testName,'onCallback success, changData: ' + JSON.stringify(changeData));
        expect(changeData.type == 0).assertTrue();
        expect(isEmpty(changeData.albumChangeDatas)).assertFalse();
        expect(changeData.isForRecheck).assertFalse();
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        PhAccessHelper.on('photoAlbumChange', onCallback);

        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName'+ new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await PhAccessHelper.applyChanges(albumChangeRequest);
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.number    SUB_SENDABLE_PHOTO_ASSET_GET_LAST_OBJECT_PROMISE_00001
     * @tc.name      SUB_SENDABLE_PHOTO_ASSET_GET_LAST_OBJECT_PROMISE_00001
     * @tc.desc      sendable-getLastObject-返回值所有属性覆盖
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_SENDABLE_PHOTO_ASSET_GET_LAST_OBJECT_PROMISE_00001', Level.LEVEL0, async (done: Function) => {
      let testName= 'SUB_SENDABLE_PHOTO_ASSET_GET_LAST_OBJECT_PROMISE_00001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let phAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOption: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> =
          await phAccessHelper.getAssets(fetchOption);
        await fetchResult.getFirstObject();
        let photoAsset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getLastObject();
        console.info(TAG,testName,'succeed');
        expect(isEmpty(photoAsset.uri)).assertFalse();
        expect(isEmpty(photoAsset.displayName)).assertFalse();
        expect(photoAsset.photoType == 1 || photoAsset.photoType == 2).assertTrue();
        done();
      }
      catch (error) {
        console.error(TAG,`${testName} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_000001
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_000001
     * @tc.desc      requestMovingPhoto-photoAsset-第二个参数属性覆盖-photoType为IMAGE
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_000001', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_000001';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = {uri : '',photoType:1,displayName:''} as photoAccessHelper.PhotoAsset;
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.number    SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_000002
     * @tc.name      SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_000002
     * @tc.desc      requestMovingPhoto-photoAsset-第二个参数属性覆盖-photoType为VIDEO
     * @tc.size      MEDIUM
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_000002', Level.LEVEL0, async (done: Function) => {
      let testNum = 'SUB_PHOTO_ACCESS_HELPER_PHOTO_REQUEST_MOVING_PHOTO_000002';
      let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
      let photoAsset = {uri : '',photoType:2,displayName:''} as photoAccessHelper.PhotoAsset;
      let requestOptions: photoAccessHelper.RequestOptions = {
        deliveryMode: photoAccessHelper.DeliveryMode.BALANCE_MODE,
      };
      const handler = new MovingPhotoHandler();
      try {
        let requestId: string = await photoAccessHelper.MediaAssetManager.requestMovingPhoto(testContext, photoAsset, requestOptions, handler);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(TAG,`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });
    /**
     * @tc.name   SUB_ON_PHOTO_CHANGE_001
     * @tc.number SUB_ON_PHOTO_CHANGE_001
     * @tc.desc   PhotoAccessHelper.on_photoChange-返回值所有属性覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ON_PHOTO_CHANGE_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_ON_PHOTO_CHANGE_001';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let onCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
        console.info(TAG,testName,'onCallback success, changData: ' + JSON.stringify(changeData));
        expect(changeData.type == 1).assertTrue();
        expect(isEmpty(changeData.assetChangeDatas)).assertFalse();
        expect(changeData.isForRecheck).assertFalse();
        done();
      }
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await PhAccessHelper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
          await album.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        PhAccessHelper.on('photoChange', onCallback);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        let newTitle: string = 'newTitle';
        assetChangeRequest.setTitle(newTitle);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        await sleep(1000)
        PhAccessHelper.off('photoChange', onCallback);
      } catch (error) {
        console.error(TAG, testName, `fetch failed with err: ${error.code}, ${error.message}`);
        expect().assertFail()
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_002
     * @tc.number SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_002
     * @tc.desc   PhotoAccessHelper.unRegisterChange-第1个参数undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_002';
      try {
        PhAccessHelper.unRegisterChange(undefined);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_001
     * @tc.number SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_001
     * @tc.desc   PhotoAccessHelper.unRegisterChange-第1个参数null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_001';
      try {
        PhAccessHelper.unRegisterChange(null);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(13900020);
        done();
      }
    });
    /**
     * @tc.name   SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_003
     * @tc.number SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_003
     * @tc.desc   PhotoAccessHelper.unRegisterChange-第1个参数""覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_PHOTO_ACCESS_HELPER_UNREGISTER_CHANGE_CALLBACK_003';
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await PhAccessHelper.getAssets(fetchOptions);
        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let isCallbackTriggered = false;
        let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
          isCallbackTriggered = true;
          console.info(TAG,testName,'onCallback1 on',changeData.type);
          expect(changeData.type == 1 ).assertTrue();
        }
        PhAccessHelper.registerChange(photoAsset.uri, false, onCallback1);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(photoAsset);
        let newTitle: string = 'newTitle22';
        assetChangeRequest.setTitle(newTitle);
        await PhAccessHelper.applyChanges(assetChangeRequest);
        await sleep(1000)
        PhAccessHelper.unRegisterChange("",onCallback1);
        expect(isCallbackTriggered).assertTrue();
        done();
      } catch (error) {
        console.error(TAG, testName, `getAlbumsCallback failed with err: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}