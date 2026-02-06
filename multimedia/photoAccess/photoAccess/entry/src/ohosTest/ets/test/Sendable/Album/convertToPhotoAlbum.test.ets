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
  getPermission,
  albumFetchOption
} from '../../common'

export default function convertToPhotoAlbumTest () {
  describe('convertToPhotoAlbumTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(globalContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Covert_Album_001
     * @tc.name      : covert_photo_album_promise_000
     * @tc.desc      : covert photoAlbum
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('covert_photo_album_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'covert_photo_album_promise_000';
      try {
        let albumName: string = genRadomStr(20) + testNum;
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = photoAccessHelper.MediaAlbumChangeRequest.createAlbumRequest(globalContext, albumName);
        await helper.applyChanges(albumChangeRequest);
        let ops: photoAccessHelper.FetchOptions = albumFetchOption(testNum, 'album_name', albumName);
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER, sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC, ops);
        let sendableAlbum: sendablePhotoAccessHelper.Album = await fetchResult.getFirstObject();
        console.log(`${testNum} ::sendableAlbum get success`);
        let commonAlbum: photoAccessHelper.Album = sendableAlbum.convertToPhotoAlbum();
        if (commonAlbum === undefined) {
          expect(false).assertTrue();
          done();
        }
        expect(commonAlbum.imageCount !== undefined && commonAlbum.imageCount >= 0).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} :: convertToSendableAlbum failed, err is ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
