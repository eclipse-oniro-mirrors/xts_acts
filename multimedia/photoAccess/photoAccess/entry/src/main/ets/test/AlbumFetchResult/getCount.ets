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
  albumKeys
} from '../../../../../../../common'

export default function albumGetCountTest () {
  describe('albumGetCountTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_COUNT_0000
     * @tc.name      : album_getCount_callback_000
     * @tc.desc      : getCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getCount_callback_000', 0, async function (done) {
      const testNum = 'album_getCount_callback_000';
      try {
        const subTypes : Array<photoAccessHelper.AlbumSubtype> = [
          albumSubtype.VIDEO,
          albumSubtype.FAVORITE,
        ];
        let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album>;
        let count = 0;
        for (let i = 0; i < subTypes.length; i++) {
          fetchResult = await helper.getAlbums(albumType.SYSTEM, subTypes[i]);
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

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_ALBUM_GET_COUNT_0100
     * @tc.name      : album_getCount_callback_001
     * @tc.desc      : getCount
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getCount_callback_001', 0, async function (done) {
      const testNum = 'album_getCount_callback_001';
      try {
        const albumName = genRadomStr(10);
        await createUserAlbum(testNum, albumName);
        const fetchOps = fetchOption(testNum, albumKeys.ALBUM_NAME, albumName);
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC, fetchOps);
        console.info(`${testNum} fetchResult: ${fetchResult}`);
        try {
          expect(fetchResult.getCount()).assertEqual(1);
        } catch (error) {
          console.info(`${testNum} getCount failed; error: ${error}`);
        }
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
