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
import { describe, it, expect, beforeAll, Hypium, TestType, Size, Level } from '../../../../hypium/index'
import Context from "application.Context"
import { getPermission, driveFn, sleep } from '../Common.test.ets';

export default function getAlbumChangeRequestTest() {
  describe('getAlbumChangeRequestTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   get_album_change_request_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_ALBUM_CHANGE_REQUEST_STATIC_0000
     * @tc.desc   get album
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('get_album_change_request_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'get_album_change_request_static_000';
        try {
          const fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);

          expect(album.albumType).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).albumType);
          expect(album.albumSubtype).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).albumSubtype);
          expect(album.albumName).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).albumName);
          expect(album.albumUri).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).albumUri);
          expect(album.count).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).count);
          expect(album.coverUri).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).coverUri);
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      })
  })
}