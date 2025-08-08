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
import {
  albumType,
  albumSubtype,
  genRadomStr,
  fetchOption,
  albumKeys,
  sleep,
  driveFn,
  getPermission
} from '../common'
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

export default function albumCommitModifyTest () {
  describe('albumCommitModifyTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext)

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    //callback
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0000
      * @tc.name      : album_commitModify_callback_000
      * @tc.desc      : album change new name
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_commitModify_callback_000', 0, async (done: Function) => {
      const testNum = 'album_commitModify_callback_000';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const newName:ESObject = Date.now() + album.albumName;
        album.albumName = newName;
        album.commitModify(async (err:BusinessError) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, newName);
              const fetchResult:ESObject = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
              console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
              const album:ESObject = await fetchResult.getFirstObject();
              expect(album.albumName).assertEqual(newName);
              fetchResult.close();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0100
      * @tc.name      : album_commitModify_callback_001
      * @tc.desc      : album commitModify with no change
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
       it('album_commitModify_callback_001', 2, async (done: Function) => {
      const testNum = 'album_commitModify_callback_001';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        album.commitModify(async (err: BusinessError) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          } else {
            console.info(`${testNum} suc`);
          }
          done();
        });
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0200
      * @tc.name      : album_commitModify_callback_002
      * @tc.desc      : album commitModify with invalid long albumName
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('album_commitModify_callback_002', 2, async (done: Function) => {
      const testNum = 'album_commitModify_callback_002';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        const invalidName:string = genRadomStr(256);
        album.albumName = invalidName;
        album.commitModify(async (err: BusinessError) => {
          console.info(`${testNum} err: ${err}`);
          expect(false).assertTrue();
          done();
        })
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    })

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0300
      * @tc.name      : album_commitModify_callback_003
      * @tc.desc      : album commitModify containing invalid characters
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('album_commitModify_callback_003', 2, async (done: Function) => {
      const testNum = 'album_commitModify_callback_003';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        const TITLE_REGEX_CHECK: string = '\\/:*?"\'`<>|{}\[\]';
        let count = 0;
        for (let i = 0; i < TITLE_REGEX_CHECK.length; i++) {
          let invalidName: string = testNum + TITLE_REGEX_CHECK[i];
          album.albumName = invalidName;
          album.commitModify((err) => {
            try {
              if (err) {
                console.info(`${testNum} err: ${err}`);
                count++;
              } else {
                console.info(`${testNum} album rename suc`);
                expect(false).assertTrue();
              }
            } catch (error) {
              console.info(`${testNum} error: ${error}`);
            }
            if (i + 1 === TITLE_REGEX_CHECK.length) {
              expect(count).assertEqual(TITLE_REGEX_CHECK.length);
              done();
            }
          })
          await sleep(50);
        }
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    })

    //promise
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0000
      * @tc.name      : album_commitModify_promise_000
      * @tc.desc      : album change new name
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_commitModify_promise_000', 0, async (done: Function) => {
      const testNum = 'album_commitModify_promise_000';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const newName:ESObject = Date.now() + album.albumName;
        album.albumName = newName;
        await album.commitModify();
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, newName);
        const fetchResult:ESObject = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        const curAlbum:ESObject = await fetchResult.getFirstObject();
        expect(curAlbum.albumName).assertEqual(newName);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0100
      * @tc.name      : album_commitModify_promise_001
      * @tc.desc      : album commitModify with no change
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('album_commitModify_promise_001', 2, async (done: Function) => {
      const testNum = 'album_commitModify_promise_001';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        await album.commitModify();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0200
      * @tc.name      : album_commitModify_promise_002
      * @tc.desc      : album commitModify with invalid long albumName
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('album_commitModify_promise_002', 2, async (done: Function) => {
      const testNum = 'album_commitModify_promise_002';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const invalidName:ESObject = genRadomStr(256);
        album.albumName = invalidName;
        await album.commitModify();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    })

    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0300
      * @tc.name      : album_commitModify_promise_003
      * @tc.desc      : album commitModify with containing characters
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 2
    */
    it('album_commitModify_promise_003', 2, async (done: Function) => {
      const testNum = 'album_commitModify_promise_003';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const TITLE_REGEX_CHECK: string = '\\/:*?"\'`<>|{}\[\]';
        let count = 0;
        for (let i = 0; i < TITLE_REGEX_CHECK.length; i++) {
          let invalidName = testNum + TITLE_REGEX_CHECK[i];
          album.albumName = invalidName;
          try {
            await album.commitModify();
            console.info(`${testNum} commitModify suc: ${invalidName}`);
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
            count++;
          }
          if (i + 1 === TITLE_REGEX_CHECK.length) {
            expect(count).assertEqual(TITLE_REGEX_CHECK.length);
            done();
          }
        }
        await sleep(50);
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    })
  })
}
