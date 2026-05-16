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
  createUserAlbum,
  genRadomStr,
  fetchOption,
  albumKeys,
  sleep,
  getPermission,
  driveFn
} from '../common'
import common from '@ohos.app.ability.common'

export default function albumGetNextObjectTest () {
  describe('albumGetNextObjectTest', () => {
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
     * @tc.name   album_getNextObject_callback_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_NEXT_OBJECT_0000
     * @tc.desc   getNextObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getNextObject_callback_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getNextObject_callback_000';
      try {
        const subTypes : Array<photoAccessHelper.AlbumSubtype> = [
          albumSubtype.VIDEO,
          albumSubtype.FAVORITE,
        ];
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
        for (let i = 0; i < subTypes.length; i++) {
          fetchResult = await helper.getAlbums(albumType.SYSTEM, subTypes[i]);
          expect(fetchResult.getCount()).assertEqual(1);
          fetchResult.getNextObject((err, asset) => {
            try {
              if (err !== undefined) {
                console.info(`${testNum} getNextObject failed; err: ${err}`);
                expect(false).assertTrue();
              } else {
                expect(asset !== undefined).assertTrue();
              }
            } catch (error) {
              console.info(`${testNum} getNextObject failed; error: ${error}`);
            }
            fetchResult.close();
            done();
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
     * @tc.name   album_getNextObject_callback_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_NEXT_OBJECT_0100
     * @tc.desc   getNextObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getNextObject_callback_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getNextObject_callback_001';
      try {
        const albumName = genRadomStr(10);
        await createUserAlbum(testContext, testNum, albumName);
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        console.info(`${testNum} failed; fetchResult: ${typeof fetchResult}`);
        expect(fetchResult.getCount()).assertEqual(1);
        console.info(`${testNum} failed; fetchResult.getCount(): ${fetchResult.getCount()}`);
        fetchResult.getNextObject(async (err, asset) => {
          try {
            if (err !== undefined) {
              console.info(`${testNum} getNextObject failed; err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(asset !== undefined).assertTrue();
            }
          } catch (error) {
            console.info(`${testNum} getNextObject failed; error: ${error}`);
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
     * @tc.name   album_getNextObject_promise_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_NEXT_OBJECT_0000
     * @tc.desc   getNextObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getNextObject_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getNextObject_promise_000';
      try {
        const subTypes : Array<photoAccessHelper.AlbumSubtype> = [
          albumSubtype.VIDEO,
          albumSubtype.FAVORITE,
        ];
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
        let count = 0;
        for (let i = 0; i < subTypes.length; i++) {
          fetchResult = await helper.getAlbums(albumType.SYSTEM, subTypes[i]);
          expect(fetchResult.getCount()).assertEqual(1);
          try {
            await fetchResult.getNextObject();
            count++;
          } catch (error) {
            console.info(`${testNum} getNextObject; error: ${error}`);
            expect(false).assertTrue();
          }
          if (i + 1 === subTypes.length) {
            expect(count).assertEqual(subTypes.length);
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
     * @tc.name   album_getNextObject_promise_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_NEXT_OBJECT_0100
     * @tc.desc   getNextObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getNextObject_promise_001', Level.LEVEL0, async (done: Function) => {
      const testNum = 'album_getNextObject_promise_001';
      try {
        const albumName = genRadomStr(10);
        await createUserAlbum(testContext, testNum, albumName);
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult}`);
        expect(fetchResult.getCount()).assertEqual(1);
        const asset = await fetchResult.getNextObject();
        console.info(`${testNum} asset: ${asset}`);
        expect(asset !== undefined).assertTrue();
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
