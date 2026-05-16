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
import { albumType, albumSubtype, genRadomStr, fetchOption, albumKeys, getPermission, driveFn, sleep } from '../common'
import common from '@ohos.app.ability.common'
import dataSharePredicates from '@ohos.data.dataSharePredicates'

export default function setAlbumNameChangeRequestTest() {
  describe('setAlbumNameChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext);
    
    let getAlbum = async (testNum: string, type: photoAccessHelper.AlbumType, subtype: photoAccessHelper.AlbumSubtype, key: string = '', value: string | number = '') => {
      let predicatesAlbum: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
      if (key != '') {
        predicatesAlbum.equalTo(key, value);
      }
      let fetchOptionsAlbum: photoAccessHelper.FetchOptions = {
        fetchColumns: ['upload_status'],
        predicates: predicatesAlbum
      };
      let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await helper.getAlbums(type, subtype, fetchOptionsAlbum);
      console.info(testNum + ' album count is ' + albumFetchResult.getCount());
      let album: photoAccessHelper.Album = await albumFetchResult.getLastObject();
      return album;
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   album_name_change_request_000
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0000
     * @tc.desc   change album name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_name_change_request_000', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'album_name_change_request_000';
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
     * @tc.name   album_name_change_request_001
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0100
     * @tc.desc   change album name with invalid long albumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_name_change_request_001', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_name_change_request_001';
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
        console.info(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   album_name_change_request_002
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0200
     * @tc.desc   change album name with albumName containing invalid characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_name_change_request_002', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_name_change_request_002';
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
            console.info(`${testNum} error: ${error.code}`);
            expect(error.code == 401).assertTrue();
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

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0300
     * @tc.name   album_name_change_request_003
     * @tc.desc   change system album name.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('album_name_change_request_003', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_name_change_request_003';
      try {

        let newName = '987123';
        let count = 0;
        let albumSubtypeList = [
          albumSubtype.TRASH, albumSubtype.SCREENSHOT, albumSubtype.CAMERA, 
          albumSubtype.FAVORITE, albumSubtype.VIDEO, albumSubtype.IMAGE
        ]
        for (let i = 0; i < albumSubtypeList.length; i++) {
          try {
            let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SYSTEM, albumSubtypeList[i]);
            let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
            albumChangeRequest.setAlbumName(newName);
            await helper.applyChanges(albumChangeRequest);
            console.error(`${testNum} set album name successfully: ${albumSubtypeList[i]}`);
            expect(false).assertTrue();
          } catch (error) {
            console.info(`${testNum} error: ${error.code}`);
            expect(error.code == 401).assertTrue();
            count++;
          }
        }
        expect(count).assertEqual(albumSubtypeList.length);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0400
     * @tc.name   album_name_change_request_004
     * @tc.desc   change user album name whit repeat name.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('album_name_change_request_004', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_name_change_request_004';
      try {
        let newName = testNum;
        let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.USER, albumSubtype.USER_GENERIC, albumKeys.ALBUM_NAME, newName);
        console.info(testNum + 'new album name is : ' + album.albumName);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(error.code == 14000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0500
     * @tc.name   album_name_change_request_005
     * @tc.desc   User albums are not allowed to be named with the same name in uppercase or lowercase.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_005', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_005';
      try {
        let oldName = 'abcd'
        let newName = oldName.toUpperCase();
        console.error(`${testNum} newName is : ${newName}`);
        let album: photoAccessHelper.Album = await helper.createAlbum(oldName);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.USER, albumSubtype.USER_GENERIC, albumKeys.ALBUM_NAME, newName);
        console.info(testNum + 'new album name is : ' + album.albumName);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(error.code == 14000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0600
     * @tc.name   album_name_change_request_006
     * @tc.desc   change user album name whit empty name.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('album_name_change_request_006', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_name_change_request_006';
      try {
        let newName = '';
        let album: photoAccessHelper.Album = helper.createAlbum(testNum);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0700
     * @tc.name   album_name_change_request_007
     * @tc.desc   Rename source album name length to 1.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_007', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_007';
      try {
        let newName = 'm';
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        console.info(`${testNum} album new name is ${album.albumName}`);
        console.info(`${testNum} album old uri is ${albumChangeRequest.getAlbum().albumUri}`);
        console.info(`${testNum} album new uri is ${album.albumUri}`);
        expect(album.albumUri).not().assertEqual(albumChangeRequest.getAlbum().albumUri);
        expect(album.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
        expect(album.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
        expect(album.albumName).assertEqual(albumChangeRequest.getAlbum().albumName);
        expect(album.count).assertEqual(albumChangeRequest.getAlbum().count);
        expect(album.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0800
     * @tc.name   album_name_change_request_008
     * @tc.desc   Rename source album name length to 255.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_008', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_008';
      try {
        let newName = 'm'.repeat(255);
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        console.info(`${testNum} album new name is ${album.albumName}`);
        console.info(`${testNum} album old uri is ${albumChangeRequest.getAlbum().albumUri}`);
        console.info(`${testNum} album new uri is ${album.albumUri}`);
        expect(album.albumUri).not().assertEqual(albumChangeRequest.getAlbum().albumUri);
        expect(album.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
        expect(album.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
        expect(album.albumName).assertEqual(albumChangeRequest.getAlbum().albumName);
        expect(album.count).assertEqual(albumChangeRequest.getAlbum().count);
        expect(album.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_0900
     * @tc.name   album_name_change_request_009
     * @tc.desc   Rename source album name is '@#￥'.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_009', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_009';
      try {
        let newName = '@#￥';
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        console.info(`${testNum} album new name is ${album.albumName}`);
        console.info(`${testNum} album old uri is ${albumChangeRequest.getAlbum().albumUri}`);
        console.info(`${testNum} album new uri is ${album.albumUri}`);
        expect(album.albumUri).not().assertEqual(albumChangeRequest.getAlbum().albumUri);
        expect(album.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
        expect(album.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
        expect(album.albumName).assertEqual(albumChangeRequest.getAlbum().albumName);
        expect(album.count).assertEqual(albumChangeRequest.getAlbum().count);
        expect(album.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1000
     * @tc.name   album_name_change_request_010
     * @tc.desc   Renaming Source Album Multiple Times.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_010', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_010';
      try {
        let newName = testNum;
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        console.info(`${testNum} album new name is ${album.albumName}`);
        console.info(`${testNum} album old uri is ${albumChangeRequest.getAlbum().albumUri}`);
        console.info(`${testNum} album new uri is ${album.albumUri}`);
        expect(album.albumUri).not().assertEqual(albumChangeRequest.getAlbum().albumUri);
        expect(album.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
        expect(album.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
        expect(album.albumName).assertEqual(albumChangeRequest.getAlbum().albumName);
        expect(album.count).assertEqual(albumChangeRequest.getAlbum().count);
        expect(album.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1100
     * @tc.name   album_name_change_request_011
     * @tc.desc   Rename source album name to system album name.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_011', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_011';
      let albumNames: Array<string> = ['隐藏相册','回收站','云增强相册'];
      try {
        for (let i = 0; i < albumNames.length; i++) {
          console.info(`${testNum} start to set name ${albumNames[i]}`);
          let newName = albumNames[i];
          let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
          let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
          albumChangeRequest.setAlbumName(newName);
          await helper.applyChanges(albumChangeRequest);
          console.info(`${testNum} set album name successfully`);
          album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
          console.info(`${testNum} album new name is ${album.albumName}`);
          console.info(`${testNum} album old uri is ${albumChangeRequest.getAlbum().albumUri}`);
          console.info(`${testNum} album new uri is ${album.albumUri}`);
          expect(album.albumUri).not().assertEqual(albumChangeRequest.getAlbum().albumUri);
          expect(album.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
          expect(album.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
          expect(album.albumName).assertEqual(albumChangeRequest.getAlbum().albumName);
          expect(album.count).assertEqual(albumChangeRequest.getAlbum().count);
          expect(album.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        }
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1200
     * @tc.name   album_name_change_request_012
     * @tc.desc   Renaming source albums with cloud sync enabled.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_012', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_012';
      try {
        let newName = testNum;
        let allowUpload: boolean = false;
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        await photoAccessHelper.MediaAlbumChangeRequest.setUploadStatus(testContext, [album], allowUpload);
        console.info(`${testNum} album upload status is ${album.uploadStatus}`);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);        
        album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        console.info(`${testNum} album new name is ${album.albumName}`);
        console.info(`${testNum} album old uri is ${albumChangeRequest.getAlbum().albumUri}`);
        console.info(`${testNum} album new uri is ${album.albumUri}`);
        console.info(`${testNum} album upload status is ${album.uploadStatus}`);
        expect(album.albumUri).not().assertEqual(albumChangeRequest.getAlbum().albumUri);
        expect(album.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
        expect(album.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
        expect(album.albumName).assertEqual(albumChangeRequest.getAlbum().albumName);
        expect(album.count).assertEqual(albumChangeRequest.getAlbum().count);
        expect(album.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        expect(album.uploadStatus).assertEqual(0);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1300
     * @tc.name   album_name_change_request_013
     * @tc.desc   change source album name whit invalid name.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('album_name_change_request_013', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_name_change_request_013';
      let albumNames: Array<string> = ['', '.', '\\',  '/', ':', '*', '?', '<', '>', '|', '{', '}', '[', ']', '"', "'", '`', '1'.repeat(256)];
      for (let i = 0; i < albumNames.length; i++) {
        console.info(`${testNum} start set album name to ${albumNames[i]}`);
        try {
          let newName = albumNames[i];
          let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
          let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
          albumChangeRequest.setAlbumName(newName);
          await helper.applyChanges(albumChangeRequest);
          console.info(`${testNum} set album name successfully is ${albumNames[i]}`);
          expect(false).assertTrue();
        } catch (error) {
          console.error(`${testNum} failed; error: ${error.code}`);
          expect(error.code == 401).assertTrue();
        }
      }
      done();
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1400
     * @tc.name   album_name_change_request_014
     * @tc.desc   change source album name whit null.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('album_name_change_request_014', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_name_change_request_014';
      try {
        let newName = null;
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully is`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code}`);
        expect(error.code == 401).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1500
     * @tc.name   album_name_change_request_015
     * @tc.desc   change source album name whit repeat name.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_015', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_015';
      try {
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(album.albumName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        console.info(testNum + 'new album name is : ' + album.albumName);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(error.code == 14000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1600
     * @tc.name   album_name_change_request_016
     * @tc.desc   Rename the source album without calling applyChange.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_016', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_016';
      try {
        let newName: string = testNum;
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let oldName: string = album.albumName
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        console.info(testNum + 'new album name is : ' + album.albumName);
        expect(album.albumName).assertEqual(oldName);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1700
     * @tc.name   album_name_change_request_017
     * @tc.desc   source albums are not allowed to be named with the same name in uppercase or lowercase.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_017', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_017';
      try {
        let oldName = 'pypnb1'
        let newName = oldName.toUpperCase();
        console.error(`${testNum} newName is : ${newName}`);
        let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(oldName);
        await helper.applyChanges(albumChangeRequest);
        albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        albumChangeRequest.setAlbumName(newName);
        await helper.applyChanges(albumChangeRequest);
        console.info(`${testNum} set album name successfully`);
        album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC, albumKeys.ALBUM_NAME, oldName);
        console.info(testNum + 'new album name is : ' + album.albumName);
        expect().assertFail();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error.code} ${error.message}`);
        expect(error.code == 14000011).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_NAME_CHANGE_REQUEST_1800
     * @tc.name   album_name_change_request_018
     * @tc.desc   Rename the source album name to the name in the whitelist.
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('album_name_change_request_018', Level.LEVEL1, async (done: Function) => {
      let testNum: string = 'album_name_change_request_018';
      let albumNames: Array<string> = ["相机", "屏幕录制", "截图", "根目录","下载", "已导入", "杂志锁屏", "编辑过的在线照片", "下载中心",
      "图片", "视频", "视频编辑", "拼图", "其他设备保存", "预置图片", "华为分享", "蓝牙分享", "畅连", "白板", "批注", "360清理大师", "中国移动手机营业厅", 
      "乐秀视频", "360浏览器", "库柏", "支付宝", "安居客", "汽车之家", "汽车报价大全", "百度网盘", "百度新闻", "暴风影音", "黄油相机", "糖果照相机", "唱吧", 
      "网易云音乐", "可米酷漫画", "携程旅行", "百度手机卫士", "大众点评", "大导演", "懂球帝", "凤凰新闻", "手机百度", "同花顺炒股票", "好看锁屏", "花粉俱乐郿", 
      "锁屏壁纸", "工银融e联", "拼立得", "爱奇艺", "掌阅iReader", "京东", "全民K歌", "巧影", "快看漫画", "酷我音乐", "驴妈妈旅游", "马蜂窝", "脉脉", "美团", 
      "秒拍", "米聊", "墨迹天气", "魔漫相机", "魔漫相机绘图", "魔漫相机照片", "魔漫相机表情", "陌陌", "美图贴贴", 
      "美图秀秀", "美颜相机", "网易新闻", "便签"];
      for (let i = 0; i < albumNames.length; i++) {
        try {
          console.info(`${testNum} start to set name ${albumNames[i]}`);
          let newName = albumNames[i];
          let album: photoAccessHelper.Album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
          let oldName: string = album.albumName;
          let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
          albumChangeRequest.setAlbumName(newName);
          await helper.applyChanges(albumChangeRequest);
          console.info(`${testNum} set album name successfully ${albumNames[i]}`);
          album = await getAlbum(testNum, albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
          console.info(`${testNum} album new name is ${album.albumName}`);
          console.info(`${testNum} album old uri is ${albumChangeRequest.getAlbum().albumUri}`);
          console.info(`${testNum} album new uri is ${album.albumUri}`);
          expect(album.albumUri).assertEqual(albumChangeRequest.getAlbum().albumUri);
          expect(album.albumType).assertEqual(albumChangeRequest.getAlbum().albumType);
          expect(album.albumSubtype).assertEqual(albumChangeRequest.getAlbum().albumSubtype);
          expect(album.albumName).assertEqual(oldName);
          expect(album.count).assertEqual(albumChangeRequest.getAlbum().count);
          expect(album.coverUri).assertEqual(albumChangeRequest.getAlbum().coverUri);
        } catch (error) {
          console.error(`${testNum} failed to set ${albumNames[i]}; error: ${error.code}`);
          expect(error.code == 14000011).assertTrue();
          done();
        }
      }
      console.info(`${testNum} end`);
      done();
    })
  })
}
