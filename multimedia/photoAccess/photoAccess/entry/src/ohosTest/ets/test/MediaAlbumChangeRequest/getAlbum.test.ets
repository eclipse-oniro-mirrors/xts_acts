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
import { getPermission, driveFn, sleep } from '../common';

export default function getAlbumChangeRequestTest() {
  describe('getAlbumChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_ALBUM_CHANGE_REQUEST_0000
     * @tc.name      : get_album_change_request_000
     * @tc.desc      : get album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('get_album_change_request_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'get_album_change_request_000';
      try {
        let album:ESObject = await helper.createAlbum(testNum);
        let albumChangeRequest:ESObject = new photoAccessHelper.MediaAlbumChangeRequest(album);

        expect(album.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
        expect(album.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
        expect(album.albumName).assertEqual(albumChangeRequest.getAlbum().albumName);
        expect(album.albumUri).assertEqual(albumChangeRequest.getAlbum().albumUri);
        expect(album.count).assertEqual(albumChangeRequest.getAlbum().count);
        expect(album.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}