/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {
  sleep,
  fetchOption,
  photoKeys,
  getFileAsset,
  photoFetchOption,
  fetchAllOption,
  sleep,
  getPermission
} from '../../../../../../../common'

export default function registerChangeTest () {
  describe('registerChangeTest', function () {

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep();
    });

    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    const { NOTIFY_ADD, NOTIFY_UPDATE, NOTIFY_REMOVE, NOTIFY_ALBUM_ADD_ASSET, NOTIFY_ALBUM_REMOVE_ASSET } =
      photoAccessHelper.NotifyType;
    const DEFAULT_PHOTO_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_PHOTO_URI;
    const DEFAULT_ALBUM_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_ALBUM_URI;

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REGISTERCHANGE_CALLBACK_0100
     * @tc.name      : registerChange_callback_001
     * @tc.desc      : listening motify file title, type NOTIFY_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('registerChange_callback_001', 0, async function (done) {
      const testNum = 'registerChange_callback_001';
      try {
        let fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'on01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count = 0;
        await sleep(550);
        helper.registerChange(asset.uri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          helper.unRegisterChange(asset.uri);
          expect(changeData.type).assertEqual(NOTIFY_UPDATE);
          expect(changeData.uris[0]).assertEqual(asset.uri);
        });
        await sleep(550);
        const newTitle = testNum + asset.get(photoKeys.TITLE);
        asset.set(photoKeys.TITLE, newTitle);
        await asset.commitModify();
        await sleep(1000);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REGISTERCHANGE_CALLBACK_0700
     * @tc.name      : registerChange_callback_007
     * @tc.desc      : listening create album, type NOTIFY_ADD
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('registerChange_callback_007', 0, async function (done) {
      const testNum = 'registerChange_callback_007';
      try {
        let changeDataUri = '';
        let listenCount = 0;
        helper.registerChange(DEFAULT_ALBUM_URI, true, async (changeData) => {
          listenCount++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          helper.unRegisterChange(DEFAULT_ALBUM_URI);
          changeDataUri = changeData.uris[0];
          expect(changeData.type).assertEqual(NOTIFY_ADD);
        });
        await sleep(550);
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        let creatAlbumUri = album.albumUri;
        await sleep(1000);
        helper.unRegisterChange(DEFAULT_ALBUM_URI);
        expect(creatAlbumUri).assertEqual(changeDataUri);
        expect(listenCount).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REGISTERCHANGE_CALLBACK_0800
     * @tc.name      : registerChange_callback_008
     * @tc.desc      : listening change albumName, type NOTIFY_UPDATE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('registerChange_callback_008', 0, async function (done) {
      const testNum = 'registerChange_callback_008';
      try {
        let albumUri = '';
        let count = 0;
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        albumUri = album.albumUri;
        await sleep(550);
        helper.registerChange(DEFAULT_ALBUM_URI, true, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          expect(changeData.type).assertEqual(NOTIFY_UPDATE);
        });
        await sleep(550);
        album.albumName = Date.now() + album.albumName;
        await album.commitModify();
        await sleep(1000);
        helper.unRegisterChange(DEFAULT_ALBUM_URI);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REGISTERCHANGE_CALLBACK_1100
     * @tc.name      : registerChange_callback_011
     * @tc.desc      : listening album addAssets, type NOTIFY_ALBUM_ADD_ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('registerChange_callback_011', 2, async function (done) {
      const testNum = 'registerChange_callback_011';
      try {
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on11.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count = 0;
        await sleep(550);
        helper.registerChange(album.albumUri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          expect(changeData.type).assertEqual(NOTIFY_ALBUM_ADD_ASSET);
          expect(changeData.uris[0]).assertEqual(album.albumUri);
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = album.getAssets(fetchAllOption());
          let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
          expect(changeData.extraUris[0]).assertEqual(newAsset.uri);
        });
        await sleep(550);
        await album.addAssets([asset]);
        await sleep(1000);
        helper.unRegisterChange(album.albumUri);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_REGISTERCHANGE_CALLBACK_1200
     * @tc.name      : registerChange_callback_012
     * @tc.desc      : listening album removeAssets, type NOTIFY_ALBUM_REMOVE_ASSET
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('registerChange_callback_012', 2, async function (done) {
      const testNum = 'registerChange_callback_012';
      try {
        let albumName = 'testAlbum' + Date.now();
        let album = await helper.createAlbum(albumName);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'on12.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        let count = 0;
        await album.addAssets([asset]);
        await sleep(550);
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(fetchAllOption());
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        helper.registerChange(album.albumUri, false, async (changeData) => {
          count++;
          console.info(`${testNum} changeData: ${JSON.stringify(changeData)}`);
          expect(changeData.type).assertEqual(NOTIFY_ALBUM_REMOVE_ASSET);
          expect(changeData.uris[0]).assertEqual(album.albumUri);
          expect(changeData.extraUris[0]).assertEqual(newAsset.uri);
        });
        await sleep(550);
        await album.removeAssets([newAsset]);
        await sleep(1000);
        helper.unRegisterChange(album.albumUri);
        expect(count).assertEqual(1);
        done();
      } catch (error) {
        console.log(`${testNum}: tryError: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
