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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';

import {
  sleep,
  genRadomStr,
  fetchOption,
  albumFetchOption,
  photoKeys,
  getPermission,
  pushCreateAsset
} from '../../common'

export default function getSendableAlbumAssetsTest () {
  describe('getSendableAlbumAssetsTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(globalContext);
    let fileNameList: Array<string> = ['addPro0001.jpg'];

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(1000);
      await pushCreateAsset(globalContext, fileNameList);
    });


    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Get_Album_Asset_001
     * @tc.name      : addAssets_promise_001
     * @tc.desc      : add image asset to user album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('addAssets_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'addAssets_promise_001';
      try {
        // 创建相册
        let albumName: string = genRadomStr(20) + new Date().getTime();
        console.log(`${testNum} :: album name is ${albumName}`);
        let albumChangeRequest1: photoAccessHelper.MediaAlbumChangeRequest = photoAccessHelper.MediaAlbumChangeRequest.createAlbumRequest(globalContext, albumName);
        await helper.applyChanges(albumChangeRequest1);
         console.log(`${testNum} :: createAlbum success`);
        // 获取照片
        let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addPro0001.jpg');
        let commonFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await helper.getAssets(fetchOps);
        let asset: photoAccessHelper.PhotoAsset = await commonFetchResult.getFirstObject();
        expect(asset !== undefined).assertTrue();
        console.log(`${testNum} :: get Asset success`);
        let ops: photoAccessHelper.FetchOptions = albumFetchOption(testNum, 'album_name', albumName);
        // 查询上面创建的相册
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await helper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC, ops);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        console.log(`${testNum} :: getAlbum success, album name is ${album.albumName}`);
        // 添加一个照片进入相册
        let albumChangeRequest2: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest2.addAssets([asset]);
        await helper.applyChanges(albumChangeRequest2);
        console.log(`${testNum} :: add asset to album success`);
        // sendable 相册
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> = await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER, sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC, ops);
        let sendableAlbum: sendablePhotoAccessHelper.Album = await fetchResult.getFirstObject();
        console.log(`${testNum} :: get  sendable album success, imageCount = ${sendableAlbum.imageCount}`);
        expect(sendableAlbum.imageCount).assertEqual(1);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });


  })
}
