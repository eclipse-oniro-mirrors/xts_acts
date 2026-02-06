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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import {
  sleep,
  getPermission
} from '../../common'

export default function getSendableAlbumsTest () {
  describe('getSendableAlbumsTest', () => {

    let globalContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
    let helper: photoAccessHelper.PhotoAccessHelper  = photoAccessHelper.getPhotoAccessHelper(globalContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
    });

    const checkSendableUserAlbum = (testNum: string, album: sendablePhotoAccessHelper.Album, expectedName: string , expectedCover: string) : void =>{
      console.info(`${testNum} checkSendableUserAlbum album.albumName: ${album.albumName}, expectedName: ${expectedName}`);
      expect(album.albumType).assertEqual(sendablePhotoAccessHelper.AlbumType.USER);
      expect(album.albumSubtype).assertEqual(sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC);
      expect(album.albumName).assertEqual(expectedName);
      if (expectedCover === '') {
        expect(album.coverUri).assertEqual('');
      } else {
        expect(album.coverUri).assertEqual(expectedCover);
      }
      expect(album.albumUri !== '').assertEqual(true);
      expect(album.count).assertEqual(0);
    }

    /**
     * @tc.name   getSendableAlbums_promise_000
     * @tc.number Sub_Photo_Access_Sendable_Get_Album_001
     * @tc.desc   get an user album
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSendableAlbums_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getSendableAlbums_promise_000';
      try {
        let albumNames = [
          'getSendableAlbums_promise_000_01',
          'getSendableAlbums_promise_000_02',
          'getSendableAlbums_promise_000_03',
          'getSendableAlbums_promise_000_04',
          'getSendableAlbums_promise_000_05'
        ];
        let beforeResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER, sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC);
        const count: number = beforeResult.getCount();
        beforeResult.close();
        // Firstly, create some albums
        for (let i = 0; i < albumNames.length; i++) {
          await helper.createAlbum(albumNames[i]);
        }
        // Secondly, get albums and check
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
          await sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER, sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC);
        const totalCount: number = fetchResult.getCount();
        expect(totalCount).assertEqual(count + albumNames.length);
        let albumList: Array<sendablePhotoAccessHelper.Album>  = await fetchResult.getAllObjects();
        fetchResult.close();
        for (let i = count; i < totalCount; i++) {
          checkSendableUserAlbum(testNum, albumList[i], albumNames[i - count], '');
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   getSendableAlbums_promise_001
     * @tc.number Sub_Photo_Access_Sendable_Get_Album_001
     * @tc.desc   get an user album
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getSendableAlbums_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'getSendableAlbums_promise_001';
      try {
        let albumNames = [
          'getSendableAlbums_promise_001_01',
          'getSendableAlbums_promise_001_02',
          'getSendableAlbums_promise_001_03',
          'getSendableAlbums_promise_001_04',
          'getSendableAlbums_promise_001_05'
        ];
        for (let i = 0; i < albumNames.length; i++) {
          await helper.createAlbum(albumNames[i]);
        }
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo('album_name', 'getSendableAlbums_promise_001_02');
        let fetchOptions: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        sendablePhAccessHelper.getAlbums(sendablePhotoAccessHelper.AlbumType.USER, sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC, fetchOptions)
          .then(async (fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album>) => {
          if (fetchResult === undefined) {
            console.error(`${testNum} :: getAlbumsPromise fetchResult is undefined`);
            expect(false).assertTrue();
            done();
          }
          expect(fetchResult.getCount()).assertEqual(1);
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed, error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
