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
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import {
  sleep,
  genRadomStr,
  getPermission,
  albumFetchOption
} from '../../common'

export default function sendableAlbumModifyTest () {
  describe('sendableAlbumModifyTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(globalContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      sleep(10);
    });
    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Album_CommitModify_001
     * @tc.name      : sendable_album_commitModify_promise_001
     * @tc.desc      : album change new name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('sendable_album_commitModify_promise_001', 0, async (done: Function) => {
      const testNum = 'sendable_album_commitModify_promise_001';
      try {
        let albumName = testNum + genRadomStr(20);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = photoAccessHelper.MediaAlbumChangeRequest.createAlbumRequest(globalContext, albumName);
        await helper.applyChanges(albumChangeRequest);
        console.log(`${testNum} :: create album success .`);
        let newName = Date.now() + genRadomStr(20);
        let albumFetchOptions = albumFetchOption(testNum, 'album_name', albumName);
        let albumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER, sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC, albumFetchOptions);
        let album: sendablePhotoAccessHelper.Album = await albumList.getFirstObject();
        console.log(`${testNum} ::sendableAlbum get success.`);
        album.albumName = newName;
        console.log(`${testNum} :: album new name is ${album.albumName}`);
        await album.commitModify();
        console.log(`${testNum} :: commit new name success`);
        let newOps = albumFetchOption(testNum, 'album_name', newName);
        let newAlbumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER, sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC, newOps);
        console.log(`${testNum} :: newAlbumList 's  len = ${newAlbumList.getCount()}`);
        if (newAlbumList === undefined || newAlbumList.getCount() <= 0) {
          expect(false).assertTrue();
          done();
        }
        done();
      }
      catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
