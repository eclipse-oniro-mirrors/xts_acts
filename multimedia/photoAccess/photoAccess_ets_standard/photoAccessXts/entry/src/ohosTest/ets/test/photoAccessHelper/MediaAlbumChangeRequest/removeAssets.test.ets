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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr } from '../../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'removeAssets';

async function removeAssetsPromiseTest(done: Function, testName: string, fetchOptions: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> =
      await phAccessHelper.getAssets(fetchOptions);
    let asset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
    await asset.clone(genRandomStr(10));
    let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
    const count = await albumFetchResult.getCount();
    if (count == 0) {
      await createUserAlbum(testContext, 'removeAssets', genRandomStr(10));
      fetchResult = await phAccessHelper.getAssets(fetchOptions);
    }
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
      new photoAccessHelper.MediaAlbumChangeRequest(album);
    await albumChangeRequest.removeAssets([asset]);
    await phAccessHelper.applyChanges(albumChangeRequest);
    expect(true).assertTrue();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAlbumChangeRequestRemoveAssetsTest() {
  describe('MediaAlbumChangeRequestRemoveAssetsTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await getPermission();
      await driveFn();
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number    : MEDIA_ALBUM_CHANGE_REQUEST_REMOVE_ASSETS_001
     * @tc.name      : mediaAlbumChangeRequest_removeAssets_promise_001
     * @tc.desc      : removeAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('mediaAlbumChangeRequest_removeAssets_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_removeAssets_promise_001';
      const fetchOptions = fetchAllOption();
      await removeAssetsPromiseTest(done, testName, fetchOptions);
    })
  })
}