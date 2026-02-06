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
import { genRadomStr, fetchOption, getPermission, driveFn, sleep } from '../Common.test.ets'

export default function albumGetCountTest() {
  describe('albumGetCountTest', () => {
    let testContext: Context = Hypium.get("context") as Context;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   album_getCount_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_COUNT_STATIC_0000
     * @tc.desc   getCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_getCount_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'album_getCount_callback_static_000';
        try {
          const subTypes: Array<photoAccessHelper.AlbumSubtype> = [
            photoAccessHelper.AlbumSubtype.VIDEO,
            photoAccessHelper.AlbumSubtype.FAVORITE,
          ];
          let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
          let count = 0;
          for (let i = 0; i < subTypes.length; i++) {
            fetchResult = await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, subTypes[i]);
            try {
              expect(fetchResult.getCount()).assertEqual(1);
              count++;
            } catch (error) {
              console.info(`${testNum} getCount; error: ${error}`);
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