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
import { fetchAllOption, getPermission, driveFn, fetchOption, albumKeys, genRandomStr, LOG_TAG } from '../../common';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = LOG_TAG + 'commitModify';

async function commitModifyCallbackTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, testName: string,
  AlbumType: photoAccessHelper.AlbumType, AlbumSubtype: photoAccessHelper.AlbumSubtype) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = await photoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let count = await returnCount(fetchOps, AlbumType, AlbumSubtype);
    if (count > 0) {
      let albumList: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
        await phAccessHelper.getAlbums(AlbumType, AlbumSubtype, fetchOps);
      let album: photoAccessHelper.Album = await albumList.getFirstObject();
      await phAccessHelper.release();
      await albumList.close();
      album.albumName = 'hello' + genRandomStr(10);
      album.commitModify((err) => {
        if (err !== undefined) {
          console.error(TAG, `commitModify failed with error: ${err.code}, ${err.message}`, testName);
          expect().assertFail();
        } else {
          console.info(TAG, 'commitModify successfully', testName);
        }
      });
    }
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function commitModifyPromiseTest(done: Function, fetchOps: photoAccessHelper.FetchOptions, testName: string,
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
      album.albumName = 'hello' + genRandomStr(10);
      album.commitModify().then(() => {
        console.info(TAG, 'commitModify successfully');
      }).catch((err: BusinessError) => {
        console.error(TAG, `commitModify failed with error: ${err.code}, ${err.message}`);
        expect().assertFail();
      });
    } else {
      console.error(TAG, 'albumList.getCount is null');
    }
    await phAccessHelper.release();
    await albumList.close();
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function returnCount(fetchOps: photoAccessHelper.FetchOptions, AlbumType: photoAccessHelper.AlbumType,
  AlbumSubtype: photoAccessHelper.AlbumSubtype) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  let phAccessHelper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);
  let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.Album> =
    await phAccessHelper.getAlbums(AlbumType, AlbumSubtype, fetchOps);
  let fetchCount: number = await fetchResult.getCount();
  await fetchResult.close();
  await phAccessHelper.release();
  console.log('fetchCount:', JSON.stringify(fetchCount));
  return fetchCount;
}

export default function albumCommitModifyTest() {
  describe('albumCommitModifyTest', () => {

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

    const albumName = 'xc1';
    const albumUri = "file://media/PhotoAlbum/68";

    /**
     * @tc.name   album_commitModify_callback_001
     * @tc.number ALBUM_COMMIT_MODIFY_001
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_callback_002
     * @tc.number ALBUM_COMMIT_MODIFY_002
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_callback_003
     * @tc.number ALBUM_COMMIT_MODIFY_003
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_callback_004
     * @tc.number ALBUM_COMMIT_MODIFY_004
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_callback_005
     * @tc.number ALBUM_COMMIT_MODIFY_005
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_callback_006
     * @tc.number ALBUM_COMMIT_MODIFY_006
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_callback_007
     * @tc.number ALBUM_COMMIT_MODIFY_007  //TODO 13900020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('album_commitModify_callback_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })*/

    /**
     * @tc.name   album_commitModify_callback_008
     * @tc.number ALBUM_COMMIT_MODIFY_008 //TODO 13900020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('album_commitModify_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_008';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })*/

    /**
     * @tc.name   album_commitModify_callback_009
     * @tc.number ALBUM_COMMIT_MODIFY_009 //TODO 13900020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('album_commitModify_callback_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_009';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })*/

    /**
     * @tc.name   album_commitModify_callback_010
     * @tc.number ALBUM_COMMIT_MODIFY_010 //TODO 13900020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('album_commitModify_callback_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_010';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })*/

    /**
     * @tc.name   album_commitModify_callback_011
     * @tc.number ALBUM_COMMIT_MODIFY_011
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_011';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_callback_012
     * @tc.number ALBUM_COMMIT_MODIFY_012
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_012';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_callback_013
     * @tc.number ALBUM_COMMIT_MODIFY_013
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_013';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_callback_014
     * @tc.number ALBUM_COMMIT_MODIFY_014
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_014';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_callback_015
     * @tc.number ALBUM_COMMIT_MODIFY_015
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_015';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_callback_016
     * @tc.number ALBUM_COMMIT_MODIFY_016
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_016';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_callback_017
     * @tc.number ALBUM_COMMIT_MODIFY_017
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_017';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_callback_018
     * @tc.number ALBUM_COMMIT_MODIFY_018
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_018';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_callback_019
     * @tc.number ALBUM_COMMIT_MODIFY_019
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_019';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_callback_020
     * @tc.number ALBUM_COMMIT_MODIFY_020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_020';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_callback_021
     * @tc.number ALBUM_COMMIT_MODIFY_021
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_021';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_callback_022
     * @tc.number ALBUM_COMMIT_MODIFY_022
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_022';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_callback_023
     * @tc.number ALBUM_COMMIT_MODIFY_023
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_023';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_callback_024
     * @tc.number ALBUM_COMMIT_MODIFY_024
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_024';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_callback_025
     * @tc.number ALBUM_COMMIT_MODIFY_025
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_025';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_callback_026
     * @tc.number ALBUM_COMMIT_MODIFY_026
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_026';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_callback_027
     * @tc.number ALBUM_COMMIT_MODIFY_027
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_027';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_callback_028
     * @tc.number ALBUM_COMMIT_MODIFY_028
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_028';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_callback_029
     * @tc.number ALBUM_COMMIT_MODIFY_029
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_029';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_callback_030
     * @tc.number ALBUM_COMMIT_MODIFY_030
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_callback_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_callback_030';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyCallbackTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_promise_001
     * @tc.number ALBUM_COMMIT_MODIFY_031
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_001';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_promise_002
     * @tc.number ALBUM_COMMIT_MODIFY_032
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_002';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_promise_003
     * @tc.number ALBUM_COMMIT_MODIFY_033
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_003';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_promise_004
     * @tc.number ALBUM_COMMIT_MODIFY_034
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_004';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_promise_005
     * @tc.number ALBUM_COMMIT_MODIFY_035
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_005';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_promise_006
     * @tc.number ALBUM_COMMIT_MODIFY_036
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_006';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_promise_007
     * @tc.number ALBUM_COMMIT_MODIFY_037  //TODO 13900020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('album_commitModify_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })*/

    /**
     * @tc.name   album_commitModify_promise_008
     * @tc.number ALBUM_COMMIT_MODIFY_038  //TODO 13900020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('album_commitModify_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_008';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })*/

    /**
     * @tc.name   album_commitModify_promise_009
     * @tc.number ALBUM_COMMIT_MODIFY_039  //TODO 13900020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('album_commitModify_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_009';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })*/

    /**
     * @tc.name   album_commitModify_promise_010
     * @tc.number ALBUM_COMMIT_MODIFY_040  //TODO 13900020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    /*it('album_commitModify_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_010';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })*/

    /**
     * @tc.name   album_commitModify_promise_011
     * @tc.number ALBUM_COMMIT_MODIFY_041
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_011';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_promise_012
     * @tc.number ALBUM_COMMIT_MODIFY_042
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_012';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_promise_013
     * @tc.number ALBUM_COMMIT_MODIFY_043
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_013';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_promise_014
     * @tc.number ALBUM_COMMIT_MODIFY_044
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_014';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_promise_015
     * @tc.number ALBUM_COMMIT_MODIFY_045
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_015';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_promise_016
     * @tc.number ALBUM_COMMIT_MODIFY_046
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_016';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_promise_017
     * @tc.number ALBUM_COMMIT_MODIFY_047
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_017';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_promise_018
     * @tc.number ALBUM_COMMIT_MODIFY_048
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_018';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_promise_019
     * @tc.number ALBUM_COMMIT_MODIFY_049
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_019';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_promise_020
     * @tc.number ALBUM_COMMIT_MODIFY_050
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_020';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.ALBUM_NAME, albumName);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_promise_021
     * @tc.number ALBUM_COMMIT_MODIFY_051
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_021';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_promise_022
     * @tc.number ALBUM_COMMIT_MODIFY_052
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_022';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_promise_023
     * @tc.number ALBUM_COMMIT_MODIFY_053
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_023';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_promise_024
     * @tc.number ALBUM_COMMIT_MODIFY_054
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_024';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_promise_025
     * @tc.number ALBUM_COMMIT_MODIFY_055
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_025';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.USER,
        photoAccessHelper.AlbumSubtype.ANY);
    })

    /**
     * @tc.name   album_commitModify_promise_026
     * @tc.number ALBUM_COMMIT_MODIFY_056
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_026';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.USER_GENERIC);
    })

    /**
     * @tc.name   album_commitModify_promise_027
     * @tc.number ALBUM_COMMIT_MODIFY_057
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_027';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.FAVORITE);
    })

    /**
     * @tc.name   album_commitModify_promise_028
     * @tc.number ALBUM_COMMIT_MODIFY_058
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_028';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.VIDEO);
    })

    /**
     * @tc.name   album_commitModify_promise_029
     * @tc.number ALBUM_COMMIT_MODIFY_059
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_029';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.IMAGE);
    })

    /**
     * @tc.name   album_commitModify_promise_030
     * @tc.number ALBUM_COMMIT_MODIFY_060
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('album_commitModify_promise_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'album_commitModify_promise_030';
      let fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, albumKeys.URI, albumUri);
      await commitModifyPromiseTest(done, fetchOps, testName, photoAccessHelper.AlbumType.SYSTEM,
        photoAccessHelper.AlbumSubtype.ANY);
    })
  })
}