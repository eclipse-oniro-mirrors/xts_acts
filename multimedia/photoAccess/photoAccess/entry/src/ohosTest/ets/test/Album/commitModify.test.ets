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
     * @tc.name   album_commitModify_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0000
     * @tc.desc   album change new name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_000', Level.LEVEL0, async (done: Function) => {
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
        * @tc.name   album_commitModify_callback_001
        * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0100
        * @tc.desc   album commitModify with no change
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL2
        */
       it('album_commitModify_callback_001', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   album_commitModify_callback_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0200
     * @tc.desc   album commitModify with invalid long albumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_callback_002', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   album_commitModify_callback_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0300
     * @tc.desc   album commitModify containing invalid characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_callback_003', Level.LEVEL2, async (done: Function) => {
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

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0400
      * @tc.name   album_commitModify_callback_004
      * @tc.desc   commitModify with system album camera album
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('album_commitModify_callback_004', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_004';
      let fetchResult: ESObject = await helper.getAlbums(albumType.SYSTEM, albumSubtype.CAMERA);
      console.info(`${testNum} fetchResult count is ${fetchResult.getCount()}`);
      let album: photoAccessHelper.Album = await fetchResult.getLastObject();
      fetchResult.close();
      let newName = '123abc';
      try {
        album.albumName = newName;
        album.commitModify((err) => {
          console.info(`${testNum} Entering the callback, err: ${err.code}`);
          if (err != undefined) {
            expect(err.code == 13900020).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
          }
        })
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0500
      * @tc.name   album_commitModify_callback_005
      * @tc.desc   commitModify with album albumNames to '1234'
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 0
    */
    it('album_commitModify_callback_005', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_005';
      let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
      
      let newName = '1234';
      try {
        album.albumName = newName;
        album.commitModify( async (err) => {
          if (err != undefined) {
            console.info(`${testNum} failed, err: ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {
            const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, newName);
            const fetchResult:ESObject = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
            console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
            const album:ESObject = await fetchResult.getFirstObject();
            console.info(`${testNum} new name is: ${album.albumName}`);
            expect(album.albumName).assertEqual(newName);
            fetchResult.close();
          }
        })
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0600
      * @tc.name   album_commitModify_callback_006
      * @tc.desc   commitModify with album albumNames to '?'
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('album_commitModify_callback_006', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_006';
      let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
      
      let invalidName = '?';
      try {
        album.albumName = invalidName;
        album.commitModify((err) => {
          console.info(`${testNum} Entering the callback, err: ${err.code}`);
          if (err != undefined) {
            expect(err.code == 13900020).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0700
      * @tc.name   album_commitModify_callback_007
      * @tc.desc   commitModify with album albumNames no chang
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 0
    */
    it('album_commitModify_callback_007', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_007';
      let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
      try {
        album.commitModify((err) => {
          console.info(`${testNum} Entering the callback`);
          if (err != undefined) {
            console.info(`${testNum} Entering the callback, err: ${err.code}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${testNum} success`);
            done();
          }
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0800
      * @tc.name   album_commitModify_callback_008
      * @tc.desc   commitModify with source album source generic album
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('album_commitModify_callback_008', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_008';
      let fetchResult: ESObject = await helper.getAlbums(albumType.SOURCE, albumSubtype.SOURCE_GENERIC);
      console.info(`${testNum} fetchResult count is ${fetchResult.getCount()}`);
      let album: photoAccessHelper.Album = await fetchResult.getLastObject();
      fetchResult.close();
      let newName = '123987';
      try {
        album.albumName = newName;
        album.commitModify((err) => {
          if (err != undefined) {
            console.info(`${testNum} Entering the callback, err: ${err.code}, ${err.message}`);
            expect(err.code == 13900020).assertTrue();
            done();
          } else {
            console.info(`${testNum} success`);
            expect(false).assertTrue();
            done();
          }
        })
      } catch (error) {
        console.info(`${testNum} failed1, error: ${error.code}, ${error.message}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_0900
      * @tc.name   album_commitModify_callback_009
      * @tc.desc   commitModify with same album name
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 2
    */
    it('album_commitModify_callback_009', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_009';
      let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
      try {
        album.albumName = testNum;
        album.commitModify((err) => {
          console.info(`${testNum} Entering the callback`);
          if (err != undefined) {
            console.info(`${testNum} Entering the callback, err: ${err}`);
            expect(err.code == 13900020).assertTrue();
            done();
          } else {
            console.info(`${testNum} success`);
            done();
          }
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_1000
      * @tc.name   album_commitModify_callback_010
      * @tc.desc   commitModify with uppercase and lowercase album name
      * @tc.size   MEDIUM
      * @tc.type   Function
      * @tc.level  Level 0
    */
    it('album_commitModify_callback_010', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_010';
      let album: photoAccessHelper.Album = await helper.createAlbum('lowercase');
      let newName: string = 'LOWERCASE';
      try {
        album.albumName = newName;
        album.commitModify(async (err) => {
          console.info(`${testNum} Entering the callback`);
          if (err != undefined) {
            console.info(`${testNum} Entering the callback, err: ${err.code}`);
            expect(err.code == 14000011).assertTrue();
            done();
          } else {
            console.info(`${testNum} fail`);
            expect().assertFail();
          }
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_1100
      * @tc.name    album_commitModify_callback_011
      * @tc.desc    commitModify with album name is '';
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 2
    */
    it('album_commitModify_callback_011', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_011';
      let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
      try {
        album.albumName = '';
        album.commitModify((err) => {
          console.info(`${testNum} Entering the callback`);
          if (err != undefined) {
            console.info(`${testNum} Entering the callback, err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
            done();
          } else {
            console.info(`${testNum} success`);
            done();
          }
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
      * @tc.number  SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_1200
      * @tc.name    album_commitModify_callback_012
      * @tc.desc    commitModify with album name lenght is 256;
      * @tc.size    MEDIUM
      * @tc.type    Function
      * @tc.level   Level 2
    */
    it('album_commitModify_callback_012', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'album_commitModify_callback_012';
      let album: photoAccessHelper.Album = await helper.createAlbum(testNum);
      try {
        album.albumName = 'm'.repeat(256);
        album.commitModify((err) => {
          console.info(`${testNum} Entering the callback`);
          if (err != undefined) {
            console.info(`${testNum} Entering the callback, err: ${err.code}`);
            expect(err.code == 13900020).assertTrue();
            done();
          } else {
            console.info(`${testNum} success`);
            done();
          }
        })
      } catch (error) {
        console.info(`${testNum} failed, error: ${error.code}`);
        expect(error.code == 13900020).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   album_commitModify_callback_013
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_COMMITMODIFY_1300
     * @tc.desc   album commitModify with max length albumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_callback_013', Level.LEVEL2, async (done: Function) => {
      const testNum = 'album_commitModify_callback_013';
      try {
        const album: photoAccessHelper.Album = await helper.createAlbum(testNum);
        const newName: string = genRadomStr(255);
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

    //promise
    /**
     * @tc.name   album_commitModify_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0000
     * @tc.desc   album change new name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_000', Level.LEVEL0, async (done: Function) => {
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
     * @tc.name   album_commitModify_promise_001
     * @tc.number SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0100
     * @tc.desc   album commitModify with no change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_promise_001', Level.LEVEL2, async (done: Function) => {
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
     * @tc.name   album_commitModify_promise_002
     * @tc.number SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0200
     * @tc.desc   album commitModify with invalid long albumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'album_commitModify_promise_002';
      try {
        const album:ESObject = await helper.createAlbum(testNum);
        const invalidName:ESObject = genRadomStr(256);
        album.albumName = invalidName;
        await album.commitModify();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
      }
    })

    /**
     * @tc.name   album_commitModify_promise_003
     * @tc.number SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0300
     * @tc.desc   album commitModify with containing characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_promise_003', Level.LEVEL2, async (done: Function) => {
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
        done();
      }
    })

    /**
     * @tc.name   album_commitModify_promise_004
     * @tc.number SUB_PHOTOACCESS_HELPER_RPOMISE_ALBUM_COMMITMODIFY_0400
     * @tc.desc   album commitModify with max length albumName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('album_commitModify_promise_004', Level.LEVEL2, async (done: Function) => {
      const testNum = 'album_commitModify_promise_004';
      try {
        const album: ESObject = await helper.createAlbum(testNum);
        const newName: ESObject = genRadomStr(255);
        album.albumName = newName;
        await album.commitModify();
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, newName);
        const fetchResult: ESObject = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
        const curAlbum: ESObject = await fetchResult.getFirstObject();
        expect(curAlbum.albumName).assertEqual(newName);
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
