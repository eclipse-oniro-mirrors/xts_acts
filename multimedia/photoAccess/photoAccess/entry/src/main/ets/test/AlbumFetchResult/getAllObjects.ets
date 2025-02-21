/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { describe, it, expect } from 'deccjsunit/index'
import {
  albumType,
  albumSubtype,
  createUserAlbum,
  genRadomStr,
  fetchOption,
  albumKeys,
  sleep,
} from '../../../../../../../common'

export default function albumGetAllObjectTest () {
  describe('albumGetAllObjectTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);

    //callback
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_ALL_OBJECTS_0000
     * @tc.name      : album_getAllObjects_callback_000
     * @tc.desc      : get all system album object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAllObjects_callback_000', 0, async function (done) {
      const testNum = 'album_getAllObjects_callback_000';
      try {
        const subTypes : Array<photoAccessHelper.AlbumSubtype> = [
          albumSubtype.VIDEO,
          albumSubtype.FAVORITE,
        ];
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
        let passCount = 0;
        for (let i = 0; i < subTypes.length; i++) {
          fetchResult = await helper.getAlbums(albumType.SYSTEM, subTypes[i]);
          expect(fetchResult.getCount()).assertEqual(1);
          fetchResult.getAllObjects((err, allObj) => {
            try {
              if (err !== undefined) {
                console.info(`${testNum} getAllObjects failed; err: ${err}`);
                expect(false).assertTrue();
              } else {
                expect(allObj.length).assertEqual(1);
                passCount++;
              }
            } catch (error) {
              console.info(`${testNum} getAllObjects failed; error: ${error}`);
            }
            if (i + 1 === subTypes.length) {
              expect(passCount).assertEqual(subTypes.length);
              fetchResult.close();
              done();
            }
          })
          await sleep(50);
        }
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_ALL_OBJECTS_0100
     * @tc.name      : album_getAllObjects_callback_001
     * @tc.desc      : get specific user album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAllObjects_callback_001', 0, async function (done) {
      const testNum = 'album_getAllObjects_callback_001';
      try {
        const albumName = genRadomStr(10);
        await createUserAlbum(testNum, albumName);
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.getAllObjects(async (err, allObj) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(allObj.length).assertEqual(1);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          fetchResult.close();
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_ALL_OBJECTS_0200
     * @tc.name      : album_getAllObjects_callback_002
     * @tc.desc      : get all album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAllObjects_callback_002', 0, async function (done) {
      const testNum = 'album_getAllObjects_callback_002';
      try {
        const albumName = genRadomStr(10);
        await createUserAlbum(testNum, albumName);
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.ANY, fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.getAllObjects(async (err, allObj) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(allObj.length).assertEqual(1);
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          fetchResult.close();
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    //promise
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_ALL_OBJECTS_0000
     * @tc.name      : album_getAllObjects_promise_000
     * @tc.desc      : get all system album object
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAllObjects_promise_000', 0, async function (done) {
      const testNum = 'album_getAllObjects_promise_000';
      try {
        const subTypes : Array<photoAccessHelper.AlbumSubtype> = [
          albumSubtype.VIDEO,
          albumSubtype.FAVORITE,
        ];
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
        let passCount = 0;
        for (let i = 0; i < subTypes.length; i++) {
          fetchResult = await helper.getAlbums(albumType.SYSTEM, subTypes[i]);
          expect(fetchResult.getCount()).assertEqual(1);
          const allObj = await fetchResult.getAllObjects();
          expect(allObj.length).assertEqual(1);
          passCount++;
          if (i + 1 === subTypes.length) {
            expect(passCount).assertEqual(subTypes.length);
            fetchResult.close();
            done();
          }
        }
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_ALL_OBJECTS_0100
     * @tc.name      : album_getAllObjects_promise_001
     * @tc.desc      : get specific user album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAllObjects_promise_001', 0, async function (done) {
      const testNum = 'album_getAllObjects_promise_001';
      try {
        const albumName = genRadomStr(10);
        await createUserAlbum(testNum, albumName);
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult}`);
        expect(fetchResult.getCount()).assertEqual(1);
        const allObj = await fetchResult.getAllObjects();
        expect(allObj.length).assertEqual(1);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_ALL_OBJECTS_0200
     * @tc.name      : album_getAllObjects_promise_002
     * @tc.desc      : get all album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAllObjects_promise_002', 0, async function (done) {
      const testNum = 'album_getAllObjects_promise_002';
      try {
        const albumName = genRadomStr(10);
        await createUserAlbum(testNum, albumName);
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.ANY, fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult}`);
        expect(fetchResult.getCount()).assertEqual(1);
        const allObj = await fetchResult.getAllObjects();
        expect(allObj.length).assertEqual(1);
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
