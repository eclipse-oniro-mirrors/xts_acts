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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, afterAll, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import fs from "@ohos.file.fs"
import dataSharePredicates from '@ohos.data.dataSharePredicates';

import {
  photoKeys,
  createSandboxFileUri,
  getPermission,
  driveFn,
  sleep,
  fetchAllOption,
} from '../../common'

export default function onSinglePhotoChangeTest() {
  describe('onSinglePhotoChangeTest', (done: Function) => {

    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(2000);
    });

    afterAll(async () => {
      console.info('afterAll case');
      try {
        let files: string[] = fs.listFileSync(testContext.filesDir);
        for (let i = 0; i < files.length; i++) {
          if (files[i].includes('test')) {
            console.info(`requestVideoTest listFiles need to delete:${JSON.stringify(files[i])}}`)
            fs.unlinkSync(`${testContext.filesDir}/${files[i]}`);
          }
        }
      } catch (error) {
        console.error(`requestVideoTest listFiles failed; error: ${error.code}  ${error.message}`)
      }
    });

    let createImageAsset = async (done: Function, title: string) => {
      try {
        let fileUri: string =
          `file://ohos.acts.multimedia.photoaccess.xts/data/storage/el2/base/haps/entry_test/photos/cloneTest.jpg`;
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.IMAGE;
        let extension: string = 'jpg';
        let options: photoAccessHelper.CreateOptions = {
          title: title,
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, fileUri);
        await helper.applyChanges(assetChangeRequest);
        await sleep(500);
        console.info('addResourceByFileUri successfully');
      } catch (err) {
        console.error(`createImageAsset:: failed to createMovingPhoto::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    }
    let createVideoAsset = async (done: Function, title: string) => {
      try {
        let fileUri: string =
          `file://ohos.acts.multimedia.photoaccess.xts/data/storage/el2/base/haps/entry_test/photos/cloneTest.mp4`;
        let photoType: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        let extension: string = 'mp4';
        let options: photoAccessHelper.CreateOptions = {
          title: title,
        }
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension, options);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, fileUri);
        await helper.applyChanges(assetChangeRequest);
        await sleep(500);
        console.info('addResourceByFileUri successfully');
      } catch (err) {
        console.error(`createVideoAsset:: failed to createMovingPhoto::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    }

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0100
     * @tc.name       onSinglePhotoChange_001
     * @tc.desc       onSinglePhotoChange asset setTitle
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoChange_001', Level.LEVEL0, async (done: Function) => {
      try {
        await createImageAsset(done, 'onSinglePhotoChange_001');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let isChange: boolean = false;
        let newTitle: string = 'newTitle' + new Date().getTime();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let assetUri = asset.uri
        const newCallback2 = (changeData:photoAccessHelper.PhotoAssetChangeInfos) => {
          isChange = true;
          console.info('onSinglePhotoChange_001 changData:type ' + changeData.type);
          expect(changeData.type).assertEqual(photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_UPDATE);
          console.info('onSinglePhotoChange_001 changData:albumChangeDatas ' +
          JSON.stringify(changeData.assetChangeDatas));
          let assetChangeDatas = changeData.assetChangeDatas
          expect(assetChangeDatas? assetChangeDatas[0].assetBeforeChange?.uri : '').assertEqual(assetUri);
          expect(assetChangeDatas?assetChangeDatas[0].assetAfterChange?.uri : '').assertContain(newTitle);
          console.info('onSinglePhotoChange_001 changData:isForRecheck ' +
          JSON.stringify(changeData.isForRecheck));
          expect(changeData.assetChangeDatas? !changeData.isForRecheck : changeData.isForRecheck).assertTrue();
        };
        helper.onSinglePhotoChange(asset, newCallback2);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(newTitle);
        await helper.applyChanges(assetChangeRequest);
        await sleep(2000);
        helper.offSinglePhotoChange();
        expect(isChange).assertTrue();
        done();
      } catch (err) {
        console.error(`onSinglePhotoChange_001:: failed ::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0200
     * @tc.name       offSinglePhotoChange_002
     * @tc.desc       offSinglePhotoChang no params
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('offSinglePhotoChange_002', Level.LEVEL0, async (done: Function) => {
      try {
        await createImageAsset(done, 'offSinglePhotoChange_002');
        await createImageAsset(done, 'offSinglePhotoChange_002_2');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let newTitle: string = 'newTitle' + new Date().getTime();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        let asset2: photoAccessHelper.PhotoAsset = await fetchResult.getNextObject();
        let isChange1: boolean = false;
        let isChange2: boolean = false;
        const newCallback1 = (changeData:photoAccessHelper.PhotoAssetChangeInfos) => {
          isChange1 = true;
          console.log(`offSinglePhotoChange_002: newCallback1` )
          expect(false).assertTrue();
          done();
        };
        const newCallback2 = (changeData:photoAccessHelper.PhotoAssetChangeInfos) => {
          isChange2 = true;
          console.log(`offSinglePhotoChange_002: newCallback2` )
          expect(false).assertTrue();
          done();
        };
        helper.onSinglePhotoChange(asset, newCallback1);
        helper.onSinglePhotoChange(asset2, newCallback2);
        helper.offSinglePhotoChange();
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(newTitle);
        await helper.applyChanges(assetChangeRequest);
        let assetChangeRequest2: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset2);
        assetChangeRequest2.setTitle(newTitle);
        await helper.applyChanges(assetChangeRequest2);
        await sleep(2000);
        expect(!isChange1).assertTrue();
        expect(!isChange2).assertTrue();
        done();
      } catch (err) {
        console.error(`offSinglePhotoChange_002:: failed ::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0300
     * @tc.name       offSinglePhotoChange_003
     * @tc.desc       offSinglePhotoChang by asset
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('offSinglePhotoChange_003', Level.LEVEL0, async (done: Function) => {
      try {
        await createImageAsset(done, 'offSinglePhotoChange_003');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let isChange1: boolean = false;
        let isChange2: boolean = false;
        let newTitle: string = 'newTitle' + new Date().getTime();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        const newCallback1 = (changeData:photoAccessHelper.PhotoAssetChangeInfos) => {
          isChange1 = true;
          console.log(`offSinglePhotoChange_003: newCallback1` )
          expect(false).assertTrue();
          done();
        };
        const newCallback2 = (changeData:photoAccessHelper.PhotoAssetChangeInfos) => {
          isChange1 = true;
          console.log(`offSinglePhotoChange_003: newCallback2` )
          expect(false).assertTrue();
          done();
        };
        helper.onSinglePhotoChange(asset, newCallback1);
        helper.onSinglePhotoChange(asset, newCallback2);
        helper.offSinglePhotoChange(asset);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(newTitle);
        await helper.applyChanges(assetChangeRequest);
        await sleep(2000);
        expect(!isChange1).assertTrue();
        expect(!isChange2).assertTrue();
        done();
      } catch (err) {
        console.error(`offSinglePhotoChange_003:: failed ::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0400
     * @tc.name       offSinglePhotoChange_004
     * @tc.desc       offSinglePhotoChang by asset and Callback
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('offSinglePhotoChange_004', Level.LEVEL0, async (done: Function) => {
      try {
        await createImageAsset(done, 'offSinglePhotoChange_004');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let isChange1: boolean = false;
        let isChange2: boolean = false;
        let newTitle: string = 'newTitle' + new Date().getTime();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        const newCallback1 = (changeData:photoAccessHelper.PhotoAssetChangeInfos) => {
          isChange1 = true;
          console.log(`offSinglePhotoChange_004: newCallback1` )
        };
        const newCallback2 = (changeData:photoAccessHelper.PhotoAssetChangeInfos) => {
          isChange1 = true;
          console.log(`offSinglePhotoChange_004: newCallback2` )
          expect(false).assertTrue();
          done();
        };
        helper.onSinglePhotoChange(asset, newCallback1);
        helper.onSinglePhotoChange(asset, newCallback2);
        helper.offSinglePhotoChange(asset, newCallback2);
        let assetChangeRequest: photoAccessHelper.MediaAssetChangeRequest =
          new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(newTitle);
        await helper.applyChanges(assetChangeRequest);
        await sleep(2000);
        expect(isChange1).assertTrue();
        expect(!isChange2).assertTrue();
        helper.offSinglePhotoChange();
        done();
      } catch (err) {
        console.error(`offSinglePhotoChange_004:: failed ::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0500
     * @tc.name       onSinglePhotoAlbumChange_005
     * @tc.desc       onSinglePhotoAlbumChange asset clone
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoAlbumChange_005', Level.LEVEL0, async (done: Function) => {
      try {
        await createImageAsset(done, 'onSinglePhotoAlbumChange_005');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let conut : number = album.count
        let isChange: boolean = false;
        const newCallback = (changeData:photoAccessHelper.AlbumChangeInfos) => {
          isChange = true;
          console.info('onSinglePhotoAlbumChange_005 changData:type ' + JSON.stringify(changeData.type));
          expect(changeData.type).assertEqual(photoAccessHelper.NotifyChangeType.NOTIFY_CHANGE_UPDATE);
          let albumChangeDatas = changeData.albumChangeDatas
          console.info('onSinglePhotoAlbumChange_005 changData:albumChangeDatas ' + JSON.stringify(albumChangeDatas));
          expect(albumChangeDatas? albumChangeDatas[0].albumBeforeChange?.count : '').assertEqual(conut);
          expect(albumChangeDatas? albumChangeDatas[0].albumAfterChange?.count : '').assertEqual(conut+1);
          console.info('onSinglePhotoAlbumChange_005 changData:isForRecheck ' + JSON.stringify(changeData.isForRecheck));
          expect(changeData.albumChangeDatas? !changeData.isForRecheck : changeData.isForRecheck).assertTrue();
        };
        helper.onSinglePhotoAlbumChange(album, newCallback);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await asset.clone('clone' + new Date().getTime())
        await sleep(2000);
        expect(isChange).assertTrue();
        helper.offSinglePhotoAlbumChange();
        done();
      } catch (err) {
        console.error(`onSinglePhotoAlbumChange_005:: failed ::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0600
     * @tc.name       offSinglePhotoAlbumChange_006
     * @tc.desc       offSinglePhotoAlbumChange no params
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('offSinglePhotoAlbumChange_006', Level.LEVEL0, async (done: Function) => {
      try {
        await createVideoAsset(done, 'offSinglePhotoAlbumChange_006');
        await createImageAsset(done, 'offSinglePhotoAlbumChange_006');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let albumFetchResult2: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
        let album2: photoAccessHelper.Album = await albumFetchResult2.getFirstObject();
        let isChange1: boolean = false;
        let isChange2: boolean = false;
        const newCallback1 = (changeData:photoAccessHelper.AlbumChangeInfos) => {
          isChange1 = true
          console.log(`offSinglePhotoAlbumChange_006: newCallback1` )
          expect(false).assertTrue();
          done();
        };
        const newCallback2 = (changeData:photoAccessHelper.AlbumChangeInfos) => {
          isChange2 = true
          console.log(`offSinglePhotoAlbumChange_006: newCallback2` )
          expect(false).assertTrue();
          done();
        };
        helper.onSinglePhotoAlbumChange(album, newCallback1);
        helper.onSinglePhotoAlbumChange(album2, newCallback2);
        helper.offSinglePhotoAlbumChange();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await asset.clone('clone' + new Date().getTime())
        let fetchResult2: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album2.getAssets(fetchOps);
        let asset2: photoAccessHelper.PhotoAsset = await fetchResult2.getFirstObject();
        await asset2.clone('clone' + new Date().getTime())
        await sleep(3000);
        expect(!isChange1).assertTrue();
        expect(!isChange2).assertTrue();
        done();
      } catch (err) {
        console.error(`offSinglePhotoAlbumChange_006:: failed ::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0700
     * @tc.name       offSinglePhotoAlbumChange_007
     * @tc.desc       offSinglePhotoAlbumChange by album
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('offSinglePhotoAlbumChange_007', Level.LEVEL0, async (done: Function) => {
      try {
        await createImageAsset(done, 'offSinglePhotoAlbumChange_007');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let isChange1: boolean = false;
        let isChange2: boolean = false;
        const newCallback1 = (changeData:photoAccessHelper.AlbumChangeInfos) => {
          isChange1 = true
          console.log(`offSinglePhotoAlbumChange_007: newCallback1` )
          expect(false).assertTrue();
          done();
        };
        const newCallback2 = (changeData:photoAccessHelper.AlbumChangeInfos) => {
          isChange2 = true
          console.log(`offSinglePhotoAlbumChange_007: newCallback2` )
          expect(false).assertTrue();
          done();
        };
        helper.onSinglePhotoAlbumChange(album, newCallback1);
        helper.onSinglePhotoAlbumChange(album, newCallback2);
        helper.offSinglePhotoAlbumChange(album);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await asset.clone('clone' + new Date().getTime())
        await sleep(2000);
        expect(!isChange1).assertTrue();
        expect(!isChange2).assertTrue();
        done();
      } catch (err) {
        console.error(`offSinglePhotoAlbumChange_007:: failed ::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0800
     * @tc.name       offSinglePhotoAlbumChange_008
     * @tc.desc       offSinglePhotoAlbumChange by album and Callback
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('offSinglePhotoAlbumChange_008', Level.LEVEL0, async (done: Function) => {
      try {
        await createVideoAsset(done, 'offSinglePhotoAlbumChange_008');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let isChange1: boolean = false;
        let isChange2: boolean = false;
        const newCallback1 = (changeData:photoAccessHelper.AlbumChangeInfos) => {
          isChange1 = true;
          console.log(`offSinglePhotoAlbumChange_008: newCallback1` )
        };
        const newCallback2 = (changeData:photoAccessHelper.AlbumChangeInfos) => {
          console.log(`offSinglePhotoAlbumChange_008: newCallback2` )
          isChange2 = true;
          expect(false).assertTrue();
          done();
        };
        helper.onSinglePhotoAlbumChange(album, newCallback1);
        helper.onSinglePhotoAlbumChange(album, newCallback2);
        helper.offSinglePhotoAlbumChange(album, newCallback2);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        await asset.clone('clone' + new Date().getTime())
        await sleep(2000);
        expect(isChange1).assertTrue();
        expect(!isChange2).assertTrue();
        helper.offSinglePhotoAlbumChange();
        done();
      } catch (err) {
        console.error(`offSinglePhotoAlbumChange_008:: failed ::${err.code}, ${err.message} !`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_0900
     * @tc.name       onSinglePhotoChange_009
     * @tc.desc       offSinglePhotoAlbumChange by Callback = undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoChange_009', Level.LEVEL0, async (done: Function) => {
      try {
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        helper.onSinglePhotoChange(asset, undefined);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`onSinglePhotoChange_009:: failed ::${err.code}, ${err.message} !`);
        expect(err.code).assertEqual('23800151');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_1000
     * @tc.name       onSinglePhotoChange_010
     * @tc.desc       offSinglePhotoAlbumChange by asset = null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoChange_010', Level.LEVEL0, async (done: Function) => {
      try {
        helper.onSinglePhotoChange(null, () => {});
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`onSinglePhotoChange_010:: failed ::${err.code}, ${err.message} !`);
        expect(err.code).assertEqual('23800151');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_1100
     * @tc.name       onSinglePhotoAlbumChange_011
     * @tc.desc       onSinglePhotoAlbumChange by Callback = null
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoAlbumChange_011', Level.LEVEL0, async (done: Function) => {
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        helper.onSinglePhotoAlbumChange(album, null);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`onSinglePhotoAlbumChange_011:: failed ::${err.code}, ${err.message} !`);
        expect(err.code).assertEqual('23800151');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_1200
     * @tc.name       onSinglePhotoAlbumChange_012
     * @tc.desc       onSinglePhotoAlbumChange by album = undefined
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoAlbumChange_012', Level.LEVEL0, async (done: Function) => {
      try {
        helper.onSinglePhotoAlbumChange(undefined, ()=>{});
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`onSinglePhotoAlbumChange_012:: failed ::${err.code}, ${err.message} !`);
        expect(err.code).assertEqual('23800151');
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_1300
     * @tc.name       onSinglePhotoChange_013
     * @tc.desc       onSinglePhotoChange maximum number of listener 201
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoChange_013', Level.LEVEL0, async (done: Function) => {
      let tag: string = 'onSinglePhotoChange_013';
      try {
        await createImageAsset(done, 'onSinglePhotoChange_013');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.log(`${tag} start create callback`);
        // 定义回调函数类型
        type PhotoChangeCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => void;
        // 创建回调函数生成器
        const createCallback = (index: number): PhotoChangeCallback => {
          return (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
            console.log(`${tag} : newCallback${index}`);
            expect(false).assertTrue();
            done();
          };
        };
        // 生成并注册201个回调
        const callbacks: PhotoChangeCallback[] = [];
        for (let i = 1; i <= 201; i++) {
          console.log(`${tag} start create callback${i}`);
          const callback = createCallback(i);
          callbacks.push(callback);
          helper.onSinglePhotoChange(asset, callback);
        }
        console.error(`${tag} success, expect fail`);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${tag} failed :: ${err}, ${err.code}`);
        expect(err.code).assertEqual('23800151');
        helper.offSinglePhotoChange();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_1400
     * @tc.name       onSinglePhotoAlbumChange_014
     * @tc.desc       onSinglePhotoAlbumChange maximum number of listener 51
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoAlbumChange_014', Level.LEVEL0, async (done: Function) => {
      let tag: string = 'onSinglePhotoAlbumChange_014';
      try {
        await createImageAsset(done, 'onSinglePhotoAlbumChange_014');
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        console.log(`${tag} start create callback`);
        // 定义回调函数类型
        type PhotoChangeCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => void;
        // 创建回调函数生成器
        const createCallback = (index: number): PhotoChangeCallback => {
          return (changeData: photoAccessHelper.AlbumChangeInfos) => {
            console.log(`${tag} : newCallback${index}`);
            expect(false).assertTrue();
            done();
          };
        };
        // 生成并注册51个回调
        const callbacks: PhotoChangeCallback[] = [];
        for (let i = 1; i <= 51; i++) {
          console.log(`${tag} start create callback${i}`);
          const callback = createCallback(i);
          callbacks.push(callback);
          helper.onSinglePhotoAlbumChange(album, callback);
        }
        console.error(`${tag} success, expect fail`);
        expect().assertFail();
        done();
      } catch (err) {
        console.error(`${tag} failed :: ${err}, ${err.code}`);
        expect(err.code).assertEqual('23800151');
        helper.offSinglePhotoAlbumChange();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_1500
     * @tc.name       onSinglePhotoChange_015
     * @tc.desc       onSinglePhotoChange maximum number of listener 200
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoChange_015', Level.LEVEL0, async (done: Function) => {
      let tag: string = 'onSinglePhotoChange_015';
      try {
        await createImageAsset(done, 'onSinglePhotoChange_015');
        let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        console.log(`${tag} start create callback`);
        // 定义回调函数类型
        type PhotoChangeCallback = (changeData: photoAccessHelper.PhotoAssetChangeInfos) => void;
        // 创建回调函数生成器
        const createCallback = (index: number): PhotoChangeCallback => {
          return (changeData: photoAccessHelper.PhotoAssetChangeInfos) => {
            console.log(`${tag} : newCallback${index}`);
            expect(false).assertTrue();
            done();
          };
        };
        // 生成并注册200个回调
        const callbacks: PhotoChangeCallback[] = [];
        for (let i = 1; i <= 200; i++) {
          console.log(`${tag} start create callback${i}`);
          const callback = createCallback(i);
          callbacks.push(callback);
          helper.onSinglePhotoChange(asset, callback);
        }
        console.log(`${tag} success`);
        helper.offSinglePhotoChange();
        done();
      } catch (err) {
        console.error(`${tag} failed :: ${err}, ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     SUB_PHOTOACCESS_HELPER_CHANGE_1600
     * @tc.name       onSinglePhotoAlbumChange_016
     * @tc.desc       onSinglePhotoAlbumChange maximum number of listener 50
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('onSinglePhotoAlbumChange_016', Level.LEVEL0, async (done: Function) => {
      let tag: string = 'onSinglePhotoAlbumChange_016';
      try {
        await createImageAsset(done, 'onSinglePhotoAlbumChange_016');
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
          await helper.getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.IMAGE);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        // 定义回调函数类型
        type PhotoChangeCallback = (changeData: photoAccessHelper.AlbumChangeInfos) => void;
        // 创建回调函数生成器
        const createCallback = (index: number): PhotoChangeCallback => {
          return (changeData: photoAccessHelper.AlbumChangeInfos) => {
            console.log(`${tag} : newCallback${index}`);
            expect(false).assertTrue();
            done();
          };
        };
        // 生成并注册50个回调
        const callbacks: PhotoChangeCallback[] = [];
        for (let i = 1; i <= 50; i++) {
          console.log(`${tag} start create callback${i}`);
          const callback = createCallback(i);
          callbacks.push(callback);
          helper.onSinglePhotoAlbumChange(album, callback);
        }
        console.log(`${tag} success`);
        helper.offSinglePhotoAlbumChange();
        done();
      } catch (err) {
        console.error(`${tag} failed :: ${err}, ${err.code}`);
        expect(false).assertTrue();
        done();
      }
    });

  });
}