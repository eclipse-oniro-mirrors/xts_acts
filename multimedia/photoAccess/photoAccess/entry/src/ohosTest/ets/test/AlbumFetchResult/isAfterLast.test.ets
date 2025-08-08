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
  genRadomStr, getPermission, driveFn,
  sleep,
} from '../common'
import common from '@ohos.app.ability.common'

export default function albumIsAfterLastTest () {
  describe('albumIsAfterLastTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ALBUM_IS_AFTER_LAST_0000
     * @tc.name      : album_isAfterLast_000
     * @tc.desc      : isAfterLast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_isAfterLast_000', Level.LEVEL0, async (done: Function) => {
			const testNum = 'album_isAfterLast_000';
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
          await fetchResult.getFirstObject();
          try {
            expect(fetchResult.isAfterLast()).assertTrue();
            count++;
          } catch (error) {
            console.info(`${testNum} isAfterLast; error: ${error}`);
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ALBUM_IS_AFTER_LAST_0100
     * @tc.name      : album_isAfterLast_001
     * @tc.desc      : isAfterLast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_isAfterLast_001', Level.LEVEL0, async (done: Function) => {
			const testNum = 'album_isAfterLast_001';
      try {
        await createUserAlbum(testContext, testNum, genRadomStr(10));
        await createUserAlbum(testContext, testNum, genRadomStr(10));
        const fetchResult = await helper.getAlbums(albumType.USER, albumSubtype.USER_GENERIC);
        let count = fetchResult.getCount();
        console.info(`${testNum} count: ${count}`);
        await fetchResult.getFirstObject();
        for (let i = 1; i < count; i++) {
          await fetchResult.getNextObject();
          if (i + 1 === count) {
            const result = fetchResult.isAfterLast();
            expect(result).assertTrue();
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
