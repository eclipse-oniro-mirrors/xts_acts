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
import { fetchAllOption, getPermission, driveFn, fetchOption, albumKeys, LOG_TAG } from '../../common';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'getAssets';

async function getAssetsCallbackTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, testName: string,
  AlbumType: photoAccessHelper.AlbumType, AlbumSubtype: photoAccessHelper.AlbumSubtype) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await phAccessHelper.getAlbums(AlbumType, AlbumSubtype, fetchOps);
    let count = await albumList.getCount();
    if (count > 0) {
      let album: photoAccessHelper.Album = await albumList.getFirstObject();
      album.getAssets(fetchOps, async (err, albumFetchResult) => {
        if (albumFetchResult !== undefined) {
          const albumCount = await albumFetchResult.getCount()
          console.info(TAG, 'album getAssets successfully, getCount: ', albumCount);
          expect(true).assertTrue();
        } else {
          console.error(TAG, `album getAssets failed with error: ${err.code}, ${err.message}`);
          expect().assertFail();
        }
      });
    } else {
      console.error(TAG, 'albumList.getCount is null');
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function getAssetsPromiseTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, testName: string,
  AlbumType: photoAccessHelper.AlbumType, AlbumSubtype: photoAccessHelper.AlbumSubtype) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
      await phAccessHelper.getAlbums(AlbumType, AlbumSubtype,
        fetchOps);
    let count = await albumList.getCount();
    if (count > 0) {
      let album: photoAccessHelper.Album = await albumList.getFirstObject();
      album.getAssets(fetchOps).then((albumFetchResult) => {
        console.info('album getAssets successfully, getCount: ' + albumFetchResult.getCount());
        expect(true).assertTrue();
      }).catch((err: BusinessError) => {
        console.error(`album getAssets failed with error: ${err.code}, ${err.message}`);
        expect().assertFail();
      });
    } else {
      console.error(TAG, 'albumList.getCount is null');
    }
    done();
  } catch (error) {
    console.info(`failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function albumGetAssetsTest() {
  describe('albumGetAssetsTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
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

    const albumName = 'xc1';
    const albumUri = "file://media/PhotoAlbum/68";

    /**
     * @tc.number    : ALBUM_GET_ASSETS_001
     * @tc.name      : album_getAssets_callback_001
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_002
     * @tc.name      : album_getAssets_callback_002
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_003
     * @tc.name      : album_getAssets_callback_003
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_004
     * @tc.name      : album_getAssets_callback_004
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_005
     * @tc.name      : album_getAssets_callback_005
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_006
     * @tc.name      : album_getAssets_callback_006
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_007
     * @tc.name      : album_getAssets_callback_007
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_008
     * @tc.name      : album_getAssets_callback_008
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_008';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_009
     * @tc.name      : album_getAssets_callback_009
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_009';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_010
     * @tc.name      : album_getAssets_callback_010
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_010';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_011
     * @tc.name      : album_getAssets_callback_011
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_011';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_012
     * @tc.name      : album_getAssets_callback_012
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_012';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_013
     * @tc.name      : album_getAssets_callback_013
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_013';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_014
     * @tc.name      : album_getAssets_callback_014
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_014';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_015
     * @tc.name      : album_getAssets_callback_015
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_015';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_016
     * @tc.name      : album_getAssets_callback_016
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_016';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_017
     * @tc.name      : album_getAssets_callback_017
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_017';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_018
     * @tc.name      : album_getAssets_callback_018
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_018';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_019
     * @tc.name      : album_getAssets_callback_019
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_019';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_020
     * @tc.name      : album_getAssets_callback_020
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_020';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_021
     * @tc.name      : album_getAssets_callback_021
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_021';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_022
     * @tc.name      : album_getAssets_callback_022
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_022';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_023
     * @tc.name      : album_getAssets_callback_023
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_023';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_024
     * @tc.name      : album_getAssets_callback_024
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_024';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_025
     * @tc.name      : album_getAssets_callback_025
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_025';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_026
     * @tc.name      : album_getAssets_callback_026
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_026';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_027
     * @tc.name      : album_getAssets_callback_027
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_027';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_028
     * @tc.name      : album_getAssets_callback_028
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_028';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_029
     * @tc.name      : album_getAssets_callback_029
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_029';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_030
     * @tc.name      : album_getAssets_callback_030
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_callback_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_callback_030';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_031
     * @tc.name      : album_getAssets_promise_001
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_032
     * @tc.name      : album_getAssets_promise_002
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_033
     * @tc.name      : album_getAssets_promise_003
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_034
     * @tc.name      : album_getAssets_promise_004
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_035
     * @tc.name      : album_getAssets_promise_005
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_036
     * @tc.name      : album_getAssets_promise_006
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_037
     * @tc.name      : album_getAssets_promise_007
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption()
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_038
     * @tc.name      : album_getAssets_promise_008
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_008';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_039
     * @tc.name      : album_getAssets_promise_009
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_009';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_040
     * @tc.name      : album_getAssets_promise_010
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_010';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_041
     * @tc.name      : album_getAssets_promise_011
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_011';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_042
     * @tc.name      : album_getAssets_promise_012
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_012';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_043
     * @tc.name      : album_getAssets_promise_013
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_013';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_044
     * @tc.name      : album_getAssets_promise_014
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_014';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_045
     * @tc.name      : album_getAssets_promise_015
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_015';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_046
     * @tc.name      : album_getAssets_promise_016
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_016';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_047
     * @tc.name      : album_getAssets_promise_017
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_017';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_048
     * @tc.name      : album_getAssets_promise_018
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_018';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_049
     * @tc.name      : album_getAssets_promise_019
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_019';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_050
     * @tc.name      : album_getAssets_promise_020
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_020';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_051
     * @tc.name      : album_getAssets_promise_021
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_021';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_052
     * @tc.name      : album_getAssets_promise_022
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_022';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_053
     * @tc.name      : album_getAssets_promise_023
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_023';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_054
     * @tc.name      : album_getAssets_promise_024
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_024';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_055
     * @tc.name      : album_getAssets_promise_025
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_025';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_056
     * @tc.name      : album_getAssets_promise_026
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_026';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_057
     * @tc.name      : album_getAssets_promise_027
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_027';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_058
     * @tc.name      : album_getAssets_promise_028
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_028';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_059
     * @tc.name      : album_getAssets_promise_029
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_029';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.number    : ALBUM_GET_ASSETS_060
     * @tc.name      : album_getAssets_promise_030
     * @tc.desc      : getAssets
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('album_getAssets_promise_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_getAssets_promise_030';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await getAssetsPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })
  })
}