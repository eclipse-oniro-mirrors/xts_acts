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

import image from '@ohos.multimedia.image'
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base'
import { createMovingPhoto, fetchOption, getPermission } from "../Common.test";
import { Context } from '@kit.ArkUI';
import { beforeAll, describe, expect, Hypium, it, Level, Size, TAG, TestType } from '../../../../hypium';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { fileIo } from '@kit.CoreFileKit';
import { createUserAlbum } from '../Common.test';
let testContext: Context = Hypium.get('Context') as Context;

export default function MediaAssetChangeRequestStaticTest(): void {
  describe('MediaAssetChangeRequestStaticTest', () => {
    beforeAll(async (): Promise<void> => {
      await getPermission();
      await createUserAlbum(testContext, TAG, 'PhotoSetTitleTestSupp');
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_IMAGE_ASSET_REQUEST_STATIC_0100
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_IMAGE_ASSET_REQUEST_STATIC_0100
     * @tc.desc   createImageAssetRequest-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_IMAGE_ASSET_REQUEST_STATIC_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_IMAGE_ASSET_REQUEST_STATIC_0100';
      let testContext: Context = Hypium.get('Context') as Context;
      try {
        let fileUri = testContext.filesDir + '/test_mov_1.jpg';
        let MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, fileUri);
        console.info(TAG + 'apply createImageAssetRequest successfully',JSON.stringify(MediaAssetChangeRequest));
        expect(MediaAssetChangeRequest != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_IMAGE_ASSET_REQUEST_STATIC_0200
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_IMAGE_ASSET_REQUEST_STATIC_0200
     * @tc.desc   createImageAssetRequest-401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_IMAGE_ASSET_REQUEST_STATIC_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_IMAGE_ASSET_REQUEST_STATIC_0200';
      let testContext: Context = Hypium.get('Context') as Context;
      try {
        let MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createImageAssetRequest(testContext, '');
        console.info(TAG + 'apply createImageAssetRequest successfully');
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900002);
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_VIDEO_ASSET_REQUEST_STATIC_0300
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_VIDEO_ASSET_REQUEST_STATIC_0300
     * @tc.desc   createVideoAssetRequest-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_VIDEO_ASSET_REQUEST_STATIC_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_VIDEO_ASSET_REQUEST_STATIC_0300';
      let testContext: Context = Hypium.get('Context') as Context;
      try {
        let fileUri = testContext.filesDir + '/test_mov_1.mp4';
        let MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, fileUri);
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect(MediaAssetChangeRequest != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_VIDEO_ASSET_REQUEST_STATIC_0400
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_VIDEO_ASSET_REQUEST_STATIC_0400
     * @tc.desc   createVideoAssetRequest-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_VIDEO_ASSET_REQUEST_STATIC_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_VIDEO_ASSET_REQUEST_STATIC_0400';
      let testContext: Context = Hypium.get('Context') as Context;
      try {
        let MediaAssetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, '');
        console.info(TAG + 'apply createVideoAssetRequest successfully');
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(13900002);
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0500
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0500
     * @tc.desc   createAssetRequest-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0500';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      try {
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: 'testPhoto'
        }
        let asset = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect(asset != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0600
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0600
     * @tc.desc   createAssetRequest-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0600';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      try {
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          subtype:photoAccessHelper.PhotoSubtype.DEFAULT
        }
        let asset = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        expect(asset != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0700
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0700
     * @tc.desc   createAssetRequest-401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_CREATE_ASSET_REQUEST_STATIC_0700';
      let testContext: Context = Hypium.get('Context') as Context;
      let photoType:  photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
      try {
        let options: photoAccessHelper.CreateOptions = {
          subtype:photoAccessHelper.PhotoSubtype.DEFAULT
        }
        let asset = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, '', options);
        expect().assertFail();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_STATIC_1300
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_STATIC_1300
     * @tc.desc   addResource-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_STATIC_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_STATIC_1300';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null= photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        let fileUri = testContext.filesDir + '/test_mov_1.jpg';
        if (assetChangeRequest !== null) {
          assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
          await helper!.applyChanges(assetChangeRequest);
          expect(assetChangeRequest != undefined).assertTrue();
        }
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_STATIC_1400
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_STATIC_1400
     * @tc.desc   addResource-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_STATIC_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_ADD_RESOURCE_STATIC_1400';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest | null= photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        let buffer: ArrayBuffer = new ArrayBuffer(2048);
        if (assetChangeRequest !== null) {
          assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, buffer);
          await helper!.applyChanges(assetChangeRequest);
          expect(assetChangeRequest != undefined).assertTrue();
        }
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_STATIC_1500
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_STATIC_1500
     * @tc.desc   saveCameraPhoto-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_STATIC_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_STATIC_1500';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOptions);
      let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.saveCameraPhoto();
        await helper!.applyChanges(assetChangeRequest);
        expect(assetChangeRequest != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_STATIC_1600
     * @tc.number SUB_MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_STATIC_1600
     * @tc.desc   saveCameraPhoto-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_STATIC_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ASSET_CHANGE_REQUEST_SAVE_CAMERA_PHOTO_STATIC_1600';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOptions);
      let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
      try {
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.saveCameraPhoto(photoAccessHelper.ImageFileType.JPEG);
        assetChangeRequest.saveCameraPhoto(photoAccessHelper.ImageFileType.HEIF);
        await helper!.applyChanges(assetChangeRequest);
        expect(assetChangeRequest != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ALBUM_STATIC_1900
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ALBUM_STATIC_1900
     * @tc.desc   getAlbum-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ALBUM_STATIC_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ALBUM_STATIC_1900';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        let changeRequestAlbum: photoAccessHelper.Album | null = albumChangeRequest.getAlbum();
        expect(changeRequestAlbum != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_2100
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_2100
     * @tc.desc   setAlbumName-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_SET_ALBUM_NAME_STATIC_2100';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newAlbumName: string = 'newAlbumName' + new Date().getTime();
        albumChangeRequest.setAlbumName(newAlbumName);
        await helper!.applyChanges(albumChangeRequest);
        expect(albumChangeRequest != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_2200
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_2200
     * @tc.desc   addAssets-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_STATIC_2200';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.addAssets([asset]);
        await helper!.applyChanges(albumChangeRequest);
        expect(albumChangeRequest != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_2300
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_2300
     * @tc.desc   removeAssets-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_STATIC_2300';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      let fetchOptions: photoAccessHelper.FetchOptions = {
        fetchColumns: [],
        predicates: predicates
      };
      try {
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper!.getAssets(fetchOptions);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.removeAssets([asset]);
        await helper!.applyChanges(albumChangeRequest);
        expect(albumChangeRequest != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2400
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2400
     * @tc.desc   getAssets-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2400';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        album.getAssets(fetchOption, (error: BusinessError<void> | null, albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> | undefined) => {
          if (albumFetchResult !== undefined) {
            console.info('album getAssets successfully, getCount: ' + albumFetchResult.getCount());
            expect(albumFetchResult.getCount() != undefined).assertTrue();
          }
        });
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2500
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2500
     * @tc.desc   getAssets-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2500';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        let res = await album.getAssets(fetchOption);
        expect(res != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2800
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2800
     * @tc.desc   lpath-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2800';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        let res = album.lpath;
        expect(res != undefined).assertTrue();
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2900
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2900
     * @tc.desc   changeTime-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_2900';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let fetchOption: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        if (album.changeTime !== undefined) {
          let res: number = Number(album.changeTime ?? 0);
          expect(res >= 0).assertTrue();
        }
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_3000
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_3000
     * @tc.desc   changeTime-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_GET_ASSETS_STATIC_3000';
      expect(photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_ADD == 0).assertTrue();
      expect(photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_REMOVE == 2).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_COMMIT_MODIFY_STATIC_3100
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_COMMIT_MODIFY_STATIC_3100
     * @tc.desc   commitModify-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_COMMIT_MODIFY_STATIC_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_COMMIT_MODIFY_STATIC_3100';
      let testContext: Context = Hypium.get('Context') as Context;
      const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
      try {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let albumFetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper!.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
        let album: photoAccessHelper.Album = await albumList.getFirstObject();
        album.albumName = 'hello';
        album.commitModify((err:BusinessError<void> | null) => {
          if (err !== undefined) {
            console.error(`commitModify failed `);
            expect().assertFail();
          } else {
            console.info('commitModify successfully');
          }
        });
        done();
      }
      catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ALBUM_CHANGE_INFO_STATIC_3400
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ALBUM_CHANGE_INFO_STATIC_3400
     * @tc.desc   albumType-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ALBUM_CHANGE_INFO_STATIC_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ALBUM_CHANGE_INFO_STATIC_3400';
      expect(photoAccessHelper.VideoMode.DEFAULT == 0).assertTrue();
      expect(photoAccessHelper.VideoMode.LOG_VIDEO == 1).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MEDIA_ALBUM_CHANGE_REQUEST_ALBUM_CHANGE_INFO_STATIC_3600
     * @tc.number SUB_MEDIA_ALBUM_CHANGE_REQUEST_ALBUM_CHANGE_INFO_STATIC_3600
     * @tc.desc   DefaultChangeUri-success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_ALBUM_CHANGE_REQUEST_ALBUM_CHANGE_INFO_STATIC_3600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let testNum = 'SUB_MEDIA_ALBUM_CHANGE_REQUEST_ALBUM_CHANGE_INFO_STATIC_3600';
      expect(photoAccessHelper.DefaultChangeUri.DEFAULT_ALBUM_URI).assertEqual('file://media/PhotoAlbum');
      done();
    });

  })
}