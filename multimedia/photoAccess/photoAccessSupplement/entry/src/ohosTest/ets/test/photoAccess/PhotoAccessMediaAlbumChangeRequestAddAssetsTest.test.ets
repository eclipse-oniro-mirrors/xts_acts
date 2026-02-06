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
import { getPermission, driveFn, LOG_TAG, fetchAllOption, createUserAlbum, genRandomStr } from '../common';
import common from '@ohos.app.ability.common';

const TAG ='MediaAlbumChangeRequestAddAssetsSupp';


export default function PhotoAccessMediaAlbumChangeRequestAddAssetsTest() {
  describe('PhotoAccessMediaAlbumChangeRequestAddAssetsTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

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
     * @tc.name   MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_001
     * @tc.number MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_001
     * @tc.desc   202空数组情况
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'MEDIA_ALBUM_CHANGE_REQUEST_ADD_ASSETS_001';
      try {
        let albumFetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> = await phAccessHelper.getAlbums(photoAccessHelper.AlbumType.USER, photoAccessHelper.AlbumSubtype.USER_GENERIC);
        console.info(TAG , testName, 'albumFetchResult',albumFetchResult);
        let album: photoAccessHelper.Album = await albumFetchResult.getFirstObject();
        console.info(TAG , testName, 'album',album);
        let albumChangeRequest: photoAccessHelper.MediaAlbumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        console.info(TAG , testName, 'albumChangeRequest',albumFetchResult);
        albumChangeRequest.addAssets([]);
        await phAccessHelper.applyChanges(albumChangeRequest);
        console.info(TAG , testName, 'addAssets successfully');
        expect().assertFail();
      } catch (err) {
        console.error(TAG , testName, `addAssetsDemo failed with error: ${err.code}, ${err.message}`);
        expect(err.code).assertEqual('401');
      }
      console.info(TAG , testName, 'done begin call');
      done();
    })
  })
}