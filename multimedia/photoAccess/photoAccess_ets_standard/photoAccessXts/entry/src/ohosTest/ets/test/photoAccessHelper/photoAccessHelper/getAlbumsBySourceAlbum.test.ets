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

import dataSharePredicates from '@ohos.data.dataSharePredicates';
import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import {
  albumKeys,
  albumType,
  albumSubtype,
  fetchOption,
  checkUserAlbum,
  sleep,
  getPermission,
  driveFn,
} from '../../common'
import common from '@ohos.app.ability.common';

export default function getAlbumsBySourceAlbumTest () {
  describe('getAlbumsBySourceAlbumTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number     GetAlbumsBySourceAlbumTest_0100
     * @tc.name       GetAlbumsBySourceAlbumTest_0100
     * @tc.desc       AlbumType.SOURCE and lbumSubtype.SOURCE_GENERIC
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('GetAlbumsBySourceAlbumTest_0100', Level.LEVEL2, async (done: Function) => {
      const testNum = 'GetAlbumsBySourceAlbumTest_0100';
      console.info(`${testNum} AlbumType.SOURCE: ${photoAccessHelper.AlbumType.SOURCE}`);
      console.info(`${testNum} AlbumSubtype.SOURCE_GENERIC: ${photoAccessHelper.AlbumSubtype.SOURCE_GENERIC}`);
      expect(photoAccessHelper.AlbumType.SOURCE).assertEqual(2048);
      expect(photoAccessHelper.AlbumSubtype.SOURCE_GENERIC).assertEqual(2049);
      done();
    });

    /**
     * @tc.number     GetAlbumsBySourceAlbumTest_0200
     * @tc.name       GetAlbumsBySourceAlbumTest_0200
     * @tc.desc       get user albums by lpath
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('GetAlbumsBySourceAlbumTest_0200', Level.LEVEL2, async (done: Function) => {
      const testNum = 'GetAlbumsBySourceAlbumTest_0200';
      try {
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_LPATH, `/Pictures/Users/相册`);
        helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps, async (err, fetchResult:photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
          try {
            if (err != undefined) {
              console.info(`${testNum} getAlbums failed, err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
              expect(fetchResult!=undefined).assertTrue();
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
     * @tc.number     GetAlbumsBySourceAlbumTest_0300
     * @tc.name       GetAlbumsBySourceAlbumTest_0300
     * @tc.desc       get source albums by lpath '/DCIM/Camera'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('GetAlbumsBySourceAlbumTest_0300', Level.LEVEL2, async (done: Function) => {
      const testNum = 'GetAlbumsBySourceAlbumTest_0300';
      try {

        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_LPATH, `/DCIM/Camera`);
        helper.getAlbums(albumType.SOURCE, albumSubtype.SOURCE_GENERIC, fetchOps, async (err, fetchResult:photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
          try {
            if (err != undefined) {
              console.info(`${testNum} getAlbums failed, err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
              expect(fetchResult!=undefined).assertTrue();
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
     * @tc.number     GetAlbumsBySourceAlbumTest_0400
     * @tc.name       GetAlbumsBySourceAlbumTest_0400
     * @tc.desc       get source albums by lpath '/Pictures/Screenshots'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('GetAlbumsBySourceAlbumTest_0400', Level.LEVEL2, async (done: Function) => {
      const testNum = 'GetAlbumsBySourceAlbumTest_0400';
      try {

        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_LPATH, `/Pictures/Screenshots`);
        helper.getAlbums(albumType.SOURCE, albumSubtype.SOURCE_GENERIC, fetchOps, async (err, fetchResult:photoAccessHelper.FetchResult<photoAccessHelper.Album>) => {
          try {
            if (err != undefined) {
              console.info(`${testNum} getAlbums failed, err: ${err}`);
              expect(false).assertTrue();
            } else {
              console.info(`${testNum} fetchResult: ${fetchResult.getCount()}`);
              expect(fetchResult!=undefined).assertTrue();
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
     * @tc.number     GetAlbumsBySourceAlbumTest_0500
     * @tc.name       GetAlbumsBySourceAlbumTest_0500
     * @tc.desc       get source albums by lpath '/Pictures/Screenrecords'
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('GetAlbumsBySourceAlbumTest_0500', Level.LEVEL2, async (done: Function) => {
      const testNum = 'GetAlbumsBySourceAlbumTest_0500';
      try {
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_LPATH, `/Pictures/Screenrecords`);
        const fetchResult = await helper.getAlbums(albumType.SOURCE, albumSubtype.SOURCE_GENERIC, fetchOps);
        expect(fetchResult!=undefined).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     GetAlbumsBySourceAlbumTest_0600
     * @tc.name       GetAlbumsBySourceAlbumTest_0600
     * @tc.desc       get source albums by lpath null
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('GetAlbumsBySourceAlbumTest_0600', Level.LEVEL2, async (done: Function) => {
      const testNum = 'GetAlbumsBySourceAlbumTest_0600';
      try {
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(albumKeys.ALBUM_LPATH, null);
        const fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await helper.getAlbums(albumType.SOURCE, albumSubtype.SOURCE_GENERIC, fetchOps);
        expect(fetchResult!=undefined).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     GetAlbumsBySourceAlbumTest_0700
     * @tc.name       GetAlbumsBySourceAlbumTest_0700
     * @tc.desc       get source albums by lpath undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 2
     */
    it('GetAlbumsBySourceAlbumTest_0700', Level.LEVEL2, async (done: Function) => {
      const testNum = 'GetAlbumsBySourceAlbumTest_0700';
      try {
        const predicates = new dataSharePredicates.DataSharePredicates();
        predicates.equalTo(albumKeys.ALBUM_LPATH, undefined);
        const fetchOps: photoAccessHelper.FetchOptions = {
          fetchColumns: [],
          predicates: predicates
        };
        const fetchResult = await helper.getAlbums(albumType.SOURCE, albumSubtype.SOURCE_GENERIC, fetchOps);
        expect(fetchResult!=undefined).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
