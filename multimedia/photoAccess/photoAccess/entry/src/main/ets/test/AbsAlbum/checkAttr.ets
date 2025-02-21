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
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {
  albumType,
  albumSubtype,
  fetchOption,
  getFileAsset,
  getAlbumId,
  photoKeys,
  albumKeys,
  fetchAllOption,
  pushCreateAsset,
  sleep,
  getPermission
} from '../../../../../../../common'

export default function checkAlbumAttrTest () {
  describe('checkAlbumAttrTest', function () {

    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
    let fileNameList = ['checkAttr.jpg'];







    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep();
      await pushCreateAsset(fileNameList);
    });

    async function checkAssetAttr (done, testNum) {
      try {
        const album = await helper.createAlbum(testNum);
        expect(album.albumType).assertEqual(albumType.USER);
        expect(album.albumSubtype).assertEqual(albumSubtype.USER_GENERIC);
        expect(album.albumName).assertEqual(testNum);
        const id = getAlbumId(album.albumUri);
        expect(album.albumUri).assertEqual('file://media/PhotoAlbum/' + id);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'checkAttr.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        await album.addAssets([asset]);
        const fetchAlbumOps = fetchOption(testNum, albumKeys.URI, album.albumUri);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchAlbumOps);
        const newAlbum = await fetchResult.getFirstObject();
        console.info(`${testNum} count: ${newAlbum.count}, coverUri: ${newAlbum.coverUri}`)
        expect(newAlbum.count).assertEqual(1);
        let albumAssetList: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await newAlbum.getAssets(fetchAllOption());
        let coverAsset: photoAccessHelper.PhotoAsset = await albumAssetList.getFirstObject();
        expect(newAlbum.coverUri).assertEqual(coverAsset.uri);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function checkImageVideoCount (album, testNum, iCount, vCount) {
      console.info(`${testNum} image count: ${album.imageCount}, expect: ${iCount}`);
      expect(album.imageCount).assertEqual(iCount);
      console.info(`${testNum} video count: ${album.videoCount}, expect: ${vCount}`);
      expect(album.videoCount).assertEqual(vCount);
      expect(album.count).assertEqual(iCount + vCount);
    }

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_0000
      * @tc.name      : album_000
      * @tc.desc      : chech album attr
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_000', 0, async function (done) {
      const testNum = 'album_000';
      await checkAssetAttr(done, testNum);
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_0100
      * @tc.name      : album_001
      * @tc.desc      : check album attribute - count, image count and video count - user album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_001', 0, async function (done) {
      const testNum = 'album_001';
      try {
        let album = await helper.createAlbum(testNum);
        const id = getAlbumId(album.albumUri);
        expect(album.albumUri).assertEqual('file://media/PhotoAlbum/' + id);
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumImageVideoCount01.jpg');
        const imageAsset1 = await getFileAsset(testNum, fetchOps);
        fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumImageVideoCount02.jpg');
        const imageAsset2 = await getFileAsset(testNum, fetchOps);
        fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumImageVideoCount01.mp4');
        const videoAsset = await getFileAsset(testNum, fetchOps);
        await album.addAssets([imageAsset1, imageAsset2, videoAsset]);
        checkImageVideoCount(album, testNum, 2, 1);
        const fetchAlbumOps = fetchOption(testNum, albumKeys.URI, album.albumUri);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchAlbumOps);
        album = await fetchResult.getFirstObject();
        checkImageVideoCount(album, testNum, 2, 1);
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(photoKeys.DISPLAY_NAME, ['albumImageVideoCount02.jpg', 'albumImageVideoCount01.mp4']);
        let assetFetchOps : photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await album.getAssets(assetFetchOps);
        let photoAssetList: Array<photoAccessHelper.PhotoAsset> = await albumFetchResult.getAllObjects();
        await album.removeAssets(photoAssetList);
        checkImageVideoCount(album, testNum, 1, 0);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_0200
      * @tc.name      : album_002
      * @tc.desc      : check album attribute - count, image count and video count - system album
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_002', 0, async function (done) {
      const testNum = 'album_002';
      try {
        let fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        let favAlbum = await fetchResult.getFirstObject();
        let initImageCount = favAlbum.imageCount;
        let initVideoCount = favAlbum.videoCount;
        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumImageVideoCount01.jpg');
        const imageAsset1 = await getFileAsset(testNum, fetchOps);
        fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumImageVideoCount02.jpg');
        const imageAsset2 = await getFileAsset(testNum, fetchOps);
        fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumImageVideoCount01.mp4');
        const videoAsset = await getFileAsset(testNum, fetchOps);
        await imageAsset1.setFavorite(true);
        await videoAsset.setFavorite(true);
        fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        favAlbum = await fetchResult.getFirstObject();
        checkImageVideoCount(favAlbum, testNum, initImageCount + 1, initVideoCount + 1);
        await imageAsset2.setFavorite(true);
        await videoAsset.setFavorite(false);
        fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.FAVORITE);
        favAlbum = await fetchResult.getFirstObject();
        checkImageVideoCount(favAlbum, testNum, initImageCount + 2, initVideoCount);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
