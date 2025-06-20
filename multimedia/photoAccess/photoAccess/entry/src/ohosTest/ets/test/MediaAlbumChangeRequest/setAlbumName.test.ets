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
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import { albumType, albumSubtype, genRadomStr, fetchOption, albumKeys, getPermission, driveFn, sleep } from '../common'
import common from '@ohos.app.ability.common'

export default function setAlbumNameChangeRequestTest() {
  describe('setAlbumNameChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0000
     * @tc.name      : album_name_change_request_000
     * @tc.desc      : change album name
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_name_change_request_000', 0, async (done: Function) => {
      let testNum = 'album_name_change_request_000';
      try {
        let album:ESObject = await helper.createAlbum(testNum);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        let newName:ESObject = Date.now() + album.albumName;
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);

        let fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, newName);
        let fetchResult:ESObject = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        let curAlbum:ESObject = await fetchResult.getFirstObject();
        expect(curAlbum.albumName).assertEqual(newName);
        expect(curAlbum.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
        expect(curAlbum.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
        expect(curAlbum.albumName).assertEqual(albumChangeRequest.getAlbum().albumName);
        // 相册融合会先删除当前相册后新建
        expect(curAlbum.albumUri).not().assertEqual(albumChangeRequest.getAlbum().albumUri);
        expect(curAlbum.count).assertEqual(albumChangeRequest.getAlbum().count);
        expect(curAlbum.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0100
     * @tc.name      : album_name_change_request_001
     * @tc.desc      : change album name with invalid long albumName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('album_name_change_request_001', 2, async (done: Function) => {
      let testNum = 'album_name_change_request_001';
      try {
        let album:ESObject = await helper.createAlbum(testNum);
        let invalidName = genRadomStr(256);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(invalidName);
        await helper.applyChanges(albumChangeRequest);
        console.error(`${testNum} set album name successfully: ${invalidName}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0200
     * @tc.name      : album_name_change_request_002
     * @tc.desc      : change album name with albumName containing invalid characters
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('album_name_change_request_002', 2, async (done: Function) => {
      let testNum = 'album_name_change_request_002';
      try {
        let album:ESObject = await helper.createAlbum(testNum);
        let TITLE_REGEX_CHECK = '\\/:*?"\'`<>|{}\[\]';
        let count = 0;
        for (let i = 0; i < TITLE_REGEX_CHECK.length; i++) {
          try {
            let invalidName = testNum + TITLE_REGEX_CHECK[i];
            let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
            albumChangeRequest.setAlbumName(invalidName);
            await helper.applyChanges(albumChangeRequest);
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
