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
import Context from "application.Context"
import { BusinessError } from '@ohos.base';
import { genRadomStr, fetchOption, sleep, getPermission, driveFn } from '../Common.test.ets'

export default function albumGetNextObjectTest() {
  describe('albumGetNextObjectTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   album_getNextObject_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_NEXT_OBJECT_STATIC_0000
     * @tc.desc   getNextObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getNextObject_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_getNextObject_callback_static_000';
        try {
          const subTypes: Array<photoAccessHelper.AlbumSubtype> = [
            photoAccessHelper.AlbumSubtype.VIDEO,
            photoAccessHelper.AlbumSubtype.FAVORITE,
          ];
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          for (let i = 0; i < subTypes.length; i++) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i]);
            expect(fetchResult.getCount()).assertEqual(1);
            fetchResult.getNextObject((err: BusinessError | null, asset) => {
              try {
                if (err?.code !== 0) {
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
     * @tc.name   album_getNextObject_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_ALBUM_GET_NEXT_OBJECT_STATIC_0000
     * @tc.desc   getNextObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getNextObject_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_getNextObject_promise_static_000';
        try {
          const subTypes: Array<photoAccessHelper.AlbumSubtype> = [
            photoAccessHelper.AlbumSubtype.VIDEO,
            photoAccessHelper.AlbumSubtype.FAVORITE,
          ];
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          let count = 0;
          for (let i = 0; i < subTypes.length; i++) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i]);
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
  })
}