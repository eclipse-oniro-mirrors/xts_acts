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
import { getPermission, driveFn, LOG_TAG, createUserAlbum, genRandomStr } from '../../common';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'getAlbum';

async function getAlbumPromiseTest(done: Function, testName: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
    const count = await albumFetchResult.getCount();
    if (count == 0) {
      await createUserAlbum(testContext, 'getAlbum', genRandomStr(10));
      albumFetchResult =
        await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
    }
    let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
    let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest =
      new photoAccessHelper.MediaAlbumChangeRequest(album);
    let changeRequestAlbum: photoAccessHelper.Album = await albumChangeRequest.getAlbum();
    console.info(TAG, 'change request album uri: ' + changeRequestAlbum.albumUri);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error}`, testName);
    expect().assertFail();
    done();
  }
}

export default function MediaAlbumChangeRequestGetAlbumTest() {
  describe('MediaAlbumChangeRequestGetAlbumTest', () => {

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
     * @tc.name   mediaAlbumChangeRequest_getAlbum_promise_001
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_GET_ALBUM_001
     * @tc.desc   getAlbum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('mediaAlbumChangeRequest_getAlbum_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'mediaAlbumChangeRequest_getAlbum_promise_001';
      await getAlbumPromiseTest(done, testName);
    })
  })
}