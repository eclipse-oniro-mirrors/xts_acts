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
import { fetchOption, fetchAllOption, getFileAsset, sleep, getPermission, driveFn } from '../Common.test.ets'
import { BusinessError } from '@ohos.base'

export default function removeAssetsTest() {
  describe('removeAssetsTest', () => {
    let testContext: Context = Hypium.get("context") as Context;

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    const helper = photoAccessHelper.getPhotoAccessHelper(testContext)

    /**
     * @tc.name   removeAssets_promise_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_REMOVE_ASSETS_STATIC_0300
     * @tc.desc   user album remove empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('removeAssets_promise_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'removeAssets_promise_static_003';
        try {
          const fetchResult =
            await (helper as photoAccessHelper.PhotoAccessHelper).getAlbums(photoAccessHelper.AlbumType.SYSTEM, photoAccessHelper.AlbumSubtype.VIDEO);
          const album = await fetchResult.getFirstObject();
          fetchResult.close();
          let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album)
          albumChangeRequest.removeAssets([]);
          await (helper as photoAccessHelper.PhotoAccessHelper).applyChanges(albumChangeRequest);
          expect(false).assertTrue();
          done();
        } catch (error) {
          console.info(`${testNum} success; error: ${error}`);
          done();
        }
      });
  })
}