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
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import {
  albumKeys,
  albumType,
  albumSubtype,
  fetchOption,
  checkUserAlbum,
  checkSystemAlbum,
  sleep,
  getPermission,
  driveFn,
} from '../common'
import common from '@ohos.app.ability.common';

export default function getAlbumsTest () {
  describe('getAlbumsTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALBUMS_0000
     * @tc.name      : getAlbums_callback_000
     * @tc.desc      : get an user album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_000', 0, async (done: Function) => {
      const testNum = 'getAlbums_callback_000';
      try {
        let albumNames = [
          'getAlbums_callback_000_01',
          'getAlbums_callback_000_02',
          'getAlbums_callback_000_03',
          'getAlbums_callback_000_04',
          'getAlbums_callback_000_05'
        ];
        const beforeResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC);
        const count = beforeResult.getCount();
        beforeResult.close();
        // Firstly, create some albums
        for (let i = 0; i < albumNames.length; i++) {
          await helper.createAlbum(albumNames[i]);
        }
        // Secondly, get albums and check
        helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, async (err, fetchResult) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getAlbums failed, err: ${err}`);
              expect(false).assertTrue();
            } else {
              const totalCount = fetchResult.getCount();
              expect(totalCount).assertEqual(count + albumNames.length);
              let albumList = await fetchResult.getAllObjects();
              fetchResult.close();
              for (let i = count; i < totalCount; i++) {
                checkUserAlbum(expect, testNum, albumList[i], albumNames[i - count], '');
              }
            }
          } catch (error) {
            console.info(`${testNum} getAlbums failed, error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed, error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALBUMS_0100
     * @tc.name      : getAlbums_callback_001
     * @tc.desc      : get user albums by albumName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_callback_001', 2, async (done: Function) => {
      const testNum = 'getAlbums_callback_001';
      try {
        // Firstly, create an album
        let albumName = testNum;
        const album:ESObject = await helper.createAlbum(albumName);
        checkUserAlbum(expect, testNum, album, albumName, '');
        // Secondly, query the newly created album by albumName, the fetch count should be 1
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps, async (err, fetchResult) => {
          try {
            if (err != undefined) {
              console.info(`${testNum} getAlbums failed, err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
              expect(fetchResult.getCount()).assertEqual(1);
              fetchResult.close();
            }
          } catch (error) {
            console.info(`${testNum} getAlbums failed, error: ${error}`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ALBUMS_0200
     * @tc.name      : getAlbums_callback_002
     * @tc.desc      : get system albums by albumType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_callback_002', 0, async (done: Function) => {
      const testNum = 'getAlbums_callback_002';
      try {
        let subTypes: Array<photoAccessHelper.AlbumSubtype> = [
          albumSubtype.VIDEO,
          albumSubtype.FAVORITE,
        ];
        let count = 0;
        for (let i = 0; i < subTypes.length; i++) {
          helper.getAlbums(albumType.SYSTEM, subTypes[i], async (err, fetchResult) => {
            try {
              if (err !== undefined) {
                console.info(`${testNum} getAlbums Failed! err: ${err}`);
                expect(false).assertTrue();
              } else {
                const album = await fetchResult.getFirstObject();
                fetchResult.close();
                checkSystemAlbum(expect, testNum, album, subTypes[i]);
                count++;
              }
            } catch (error) {
              console.info(`${testNum} getAlbums Failed! error: ${error}`);
            }
            if (i + 1 === subTypes.length) {
              expect(count === subTypes.length);
              done();
            }
          });
          await sleep(50);
        }
      } catch (error) {
        console.info(`${testNum} failed, error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });
    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALBUMS_0000
     * @tc.name      : getAlbums_promise_000
     * @tc.desc      : get an user album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_000', 0, async (done: Function) => {
      const testNum = 'getAlbums_promise_000';
      try {
        let albumNames = [
          'getAlbums_promise_000_01',
          'getAlbums_promise_000_02',
          'getAlbums_promise_000_03',
          'getAlbums_promise_000_04',
          'getAlbums_promise_000_05'
        ];
        const beforeResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC);
        const count = beforeResult.getCount();
        beforeResult.close();
        // Firstly, create some albums
        for (let i = 0; i < albumNames.length; i++) {
          await helper.createAlbum(albumNames[i]);
        }
        // Secondly, get albums and check
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC);
        const totalCount = fetchResult.getCount();
        expect(totalCount).assertEqual(count + albumNames.length);
        let albumList = await fetchResult.getAllObjects();
        fetchResult.close();
        for (let i = count; i < totalCount; i++) {
          checkUserAlbum(expect, testNum, albumList[i], albumNames[i - count], '');
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALBUMS_0100
     * @tc.name      : getAlbums_promise_001
     * @tc.desc      : get user albums by albumName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_001', 2, async (done: Function) => {
      const testNum = 'getAlbums_promise_001';
      try {
        // Firstly, create an album
        let albumName = testNum;
        const album:ESObject = await helper.createAlbum(albumName);
        checkUserAlbum(expect, testNum, album, albumName, '');
        // Secondly, query the newly created album by albumName, the fetch count should be 1
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALBUMS_0200
     * @tc.name      : getAlbums_promise_002
     * @tc.desc      : get system albums by albumType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getAlbums_promise_002', 0, async (done: Function) => {
      const testNum = 'getAlbums_promise_002';
      try {
        let subTypes: Array<photoAccessHelper.AlbumSubtype> = [
          albumSubtype.VIDEO,
          albumSubtype.FAVORITE,
        ];
        let count = 0;
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> | undefined = undefined;
        for (let i = 0; i < subTypes.length; i++) {
          fetchResult = await helper.getAlbums(albumType.SYSTEM, subTypes[i]);
          const album = await fetchResult.getFirstObject();
          checkSystemAlbum(expect, testNum, album, subTypes[i]);
          count++;
        }
        if (fetchResult != undefined) {
          fetchResult.close();
        }
        expect(count === subTypes.length);
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${JSON.stringify(error)}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALBUMS_0300
     * @tc.name      : getAlbums_promise_003
     * @tc.desc      : get user albums by orderByAsc
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_003', 2, async (done: Function) => {
      const testNum = 'getAlbums_promise_003';
      try {
        const albumNames = ['b', 'a', 'c'];
        for (let i = 0; i < albumNames.length; i++) {
          await helper.createAlbum(albumNames[i]);
        }
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(albumKeys.ALBUM_NAME, albumNames).orderByAsc(albumKeys.ALBUM_NAME);
        const fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        expect(fetchResult.getCount()).assertEqual(3);
        const resultList = await fetchResult.getAllObjects();
        const expectNames = ['a', 'b', 'c'];
        for (let i = 0; i < albumNames.length; i++) {
          console.info(`${testNum} albumName: ${resultList[i].albumName}`);
          expect(resultList[i].albumName).assertEqual(expectNames[i]);
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ALBUMS_0400
     * @tc.name      : getAlbums_promise_004
     * @tc.desc      : get user albums by orderByDesc
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('getAlbums_promise_004', 2, async (done: Function) => {
      const testNum = 'getAlbums_promise_004';
      try {
        const albumNames = ['x', 'y', 'z'];
        for (let i = 0; i < albumNames.length; i++) {
          await helper.createAlbum(albumNames[i]);
        }
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.in(albumKeys.ALBUM_NAME, albumNames).orderByDesc(albumKeys.ALBUM_NAME);
        const fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        expect(fetchResult.getCount()).assertEqual(3);
        const resultList = await fetchResult.getAllObjects();
        const expectNames = ['z', 'y', 'x'];
        for (let i = 0; i < albumNames.length; i++) {
          console.info(`${testNum} albumName: ${resultList[i].albumName}`);
          expect(resultList[i].albumName).assertEqual(expectNames[i]);
        }
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
