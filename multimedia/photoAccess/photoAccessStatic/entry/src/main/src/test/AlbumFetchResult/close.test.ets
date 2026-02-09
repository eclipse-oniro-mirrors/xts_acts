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
import { fetchOption, getPermission, driveFn, sleep } from '../Common.test.ets'
import Context from "application.Context"

export default function albumCloseTest() {
  describe('albumCloseTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   album_close_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_ALBUM_CLOSE_STATIC_0000
     * @tc.desc   close system album
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_close_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_close_static_000';
        try {
          const subTypes: Array<photoAccessHelper.AlbumSubtype> = [
            photoAccessHelper.AlbumSubtype.VIDEO,
            photoAccessHelper.AlbumSubtype.FAVORITE,
          ];
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          let passCount = 0;
          for (let i = 0; i < subTypes.length; i++) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i]);
            expect(fetchResult.getCount()).assertEqual(1);
            fetchResult.close();
            let testCount = 0;
            let count = 0;
            try {
              testCount++;
              fetchResult.getCount();
            } catch (error) {
              console.info(`${testNum} getCount failed; error: ${error}`);
              count++;
            }
            try {
              testCount++;
              await fetchResult.getFirstObject();
            } catch (error) {
              console.info(`${testNum} getFirstObject failed; error: ${error}`);
              count++;
            }
            try {
              testCount++;
              await fetchResult.getNextObject();
            } catch (error) {
              console.info(`${testNum} getNextObject failed; error: ${error}`);
              count++;
            }
            try {
              testCount++;
              await fetchResult.getLastObject();
            } catch (error) {
              console.info(`${testNum} getLastObject failed; error: ${error}`);
              count++;
            }
            try {
              testCount++;
              await fetchResult.getObjectByPosition(0);
            } catch (error) {
              console.info(`${testNum} getObjectByPosition failed; error: ${error}`);
              count++;
            }
            try {
              testCount++;
              await fetchResult.getAllObjects();
            } catch (error) {
              console.info(`${testNum} getAllObjects failed; error: ${error}`);
              count++;
            }
            try {
              testCount++;
              fetchResult.isAfterLast();
            } catch (error) {
              console.info(`${testNum} isAfterLast failed; error: ${error}`);
              count++;
            }
            expect(count).assertEqual(testCount);
            passCount++;
            if (i + 1 === subTypes.length) {
              expect(passCount).assertEqual(subTypes.length);
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