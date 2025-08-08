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
import { describe, it, expect } from '@ohos/hypium'
import {
  albumType,
  albumSubtype,
  photoKeys,
  fetchOption,
} from '../common'
import common from '@ohos.app.ability.common'

export default function albumGetAssetsTest () {
  describe('albumGetAssetsTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper = photoAccessHelper.getPhotoAccessHelper(testContext)

    //callback
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_ASSETS_0000
      * @tc.name      : album_getAssets_callback_000
      * @tc.desc      : Video album getAssets
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_getAssets_callback_000', 0, async (done: Function) => {
      const testNum = 'album_getAssets_callback_000';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.VIDEO);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumGetAssetsCb01.mp4');
        album.getAssets(fetchOps, async (err, fetchResult) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              expect(fetchResult.getCount()).assertEqual(1);
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
    });

    //promise
    /**
      * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_GET_ASSETS_0000
      * @tc.name      : album_getAssets_promise_000
      * @tc.desc      : Video album getAssets
      * @tc.size      : MEDIUM
      * @tc.type      : Function
      * @tc.level     : Level 0
    */
    it('album_getAssets_promise_000', 0, async (done: Function) => {
      const testNum = 'album_getAssets_promise_000';
      try {
        const fetchResult = await helper.getAlbums(albumType.SYSTEM, albumSubtype.VIDEO);
        const album = await fetchResult.getFirstObject();
        fetchResult.close();
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'albumGetAssetsPro01.mp4');
        const curFetchResult = await album.getAssets(fetchOps);
        expect(curFetchResult.getCount()).assertEqual(1);
        curFetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
