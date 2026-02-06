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
import { genRadomStr, fetchOption, getPermission, driveFn, sleep } from '../Common.test.ets'
import Context from "application.Context"

export default function setAlbumNameChangeRequestTest() {
  describe('setAlbumNameChangeRequestTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   album_name_change_request_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_STATIC_0000
     * @tc.desc   change album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_name_change_request_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'album_name_change_request_static_000';
        try {
          let fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
          let newName = Date.now() + album.albumName;
          albumChangeRequest.setAlbumName(newName);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(albumChangeRequest);

          let fetchOps = fetchOption(testNum, photoAccessHelper.AlbumKeys.ALBUM_NAME, newName);
          fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO,
              fetchOps);
          console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
          let curAlbum = await fetchResult.getFirstObject();
          expect(curAlbum.albumName).assertEqual(newName);
          expect(curAlbum.albumType).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).albumType);
          expect(curAlbum.albumSubtype).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).albumSubtype);
          expect(curAlbum.albumName).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).albumName);
          expect(curAlbum.albumUri).not().assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).albumUri);
          expect(curAlbum.count).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).count);
          expect(curAlbum.coverUri).assertEqual((albumChangeRequest.getAlbum() as photoAccessHelper.Album).coverUri);
          fetchResult.close();
          done();
        } catch (error) {
          console.error(`${testNum} success; error: ${error}`);
          done();
        }
      })

    /**
     * @tc.name   album_name_change_request_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_STATIC_0100
     * @tc.desc   change album name with invalid long albumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_name_change_request_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'album_name_change_request_static_001';
        try {
          const fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          let invalidName = genRadomStr(256);
          let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
          albumChangeRequest.setAlbumName(invalidName);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(albumChangeRequest);
          console.error(`${testNum} set album name successfully: ${invalidName}`);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.info(`${testNum} success; error: ${error}`);
          done();
        }
      })

    /**
     * @tc.name   album_name_change_request_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_STATIC_0200
     * @tc.desc   change album name with albumName containing invalid characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_name_change_request_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let testNum = 'album_name_change_request_static_002';
        try {
          const fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          let TITLE_REGEX_CHECK = '\\/:*?"\'`<>|{}\[\]';
          let count = 0;
          for (let i = 0; i < TITLE_REGEX_CHECK.length; i++) {
            try {
              let invalidName = testNum + TITLE_REGEX_CHECK[i];
              let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
              albumChangeRequest.setAlbumName(invalidName);
              await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(albumChangeRequest);
              console.error(`${testNum} set album name successfully: ${invalidName}`);
              expect(false).assertTrue();
            } catch (error) {
              console.info(`${testNum} error: ${error}`);
              count++;
            }
          }
          expect(count).assertEqual(TITLE_REGEX_CHECK.length);
          done();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error}`);
          expect(false).assertTrue();
          done();
        }
      })
  })
}