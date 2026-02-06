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
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper';
import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import { driveFn, fetchAllOption, getPermission, photoKeys, genRandomStr, fetchOption, LOG_TAG } from '../../common';
import { BusinessError } from '@kit.BasicServicesKit';
import { ErrorCode } from '../../CommonErrorCode';

const TAG = LOG_TAG + 'commitModify';

async function commitModifyPromiseTest(done: Function, testName: string, AlbumType: sendablePhotoAccessHelper.AlbumType,
  AlbumSubtype: sendablePhotoAccessHelper.AlbumSubtype, fetchOps: photoAccessHelper.FetchOptions) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  const sendablePhAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(testContext);
  try {
    let albumList: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.Album> =
      await sendablePhAccessHelper.getAlbums(AlbumType,
        AlbumSubtype, fetchOps);
    let albumCount = await albumList.getCount();
    if (albumCount > 0) {
      let sendableAlbum: sendablePhotoAccessHelper.Album = await albumList.getFirstObject();
      sendableAlbum.albumName = genRandomStr(10) + new Date().getTime();
      sendableAlbum.commitModify().then(() => {
        console.info(TAG, 'commitModify successfully', testName);
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG, `commitModify failed with error: ${err.code}, ${err.message}`);
        expect().assertFail();
        done();
      });
    }
    done();
  } catch (error) {
    console.error(TAG, `${testName} :: convertToSendableAlbum failed, err is  ${error}, ${error.code}`);
    expect(error.code == ErrorCode.ARGUMENT_INVALID_ERROR_CODE || error.code == ErrorCode.PARAM_ERROR_CODE)
      .assertTrue();
    done();
  }
}

export default function sendableCommitModifyTest() {
  describe('sendableCommitModifyTest', () => {
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
     * @tc.name   commitModify_sendable_promise_001
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_001
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_001', Level.LEVEL0, async (done: Function) => {
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const testName = 'commitModify_sendable_promise_001';
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_002
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_002
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_002';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_003
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_003
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_003';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_004
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_004
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_004', Level.LEVEL0, async (done: Function) => {
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const testName = 'commitModify_sendable_promise_004';
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_005
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_005
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_005';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_006
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_006
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_006';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_007
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_007
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_007';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_008
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_008
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_008';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_009
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_009
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_009';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_010
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_010
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_010';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_011
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_011
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_011';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_012
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_012
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_012';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_013
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_013
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_013';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_014
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_014
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_014';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_015
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_015
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_015';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.USER;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_016
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_016
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_016', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_016';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_017
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_017
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_017', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_017';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_018
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_018
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_018', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_018';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.USER_GENERIC;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_019
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_019
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_019', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_019';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_020
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_020
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_020', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_020';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_021
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_021
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_021', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_021';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.FAVORITE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_022
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_022
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_022', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_022';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_023
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_023
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_023', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_023';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_024
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_024
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_024', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_024';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.VIDEO);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.VIDEO;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_025
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_025
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_025', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_025';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_026
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_026
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_026', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_026';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_027
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_027
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_027', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_027';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.IMAGE;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_028
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_028
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_028', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_028';
      let fetchOps: photoAccessHelper.FetchOptions = fetchAllOption();
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_029
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_029
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_029', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_029';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })

    /**
     * @tc.name   commitModify_sendable_promise_030
     * @tc.number SENDABLE_ALBUM_COMMIT_MODIFY_030
     * @tc.desc   commitModify
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('commitModify_sendable_promise_030', Level.LEVEL0, async (done: Function) => {
      const testName = 'commitModify_sendable_promise_030';
      let fetchOps: photoAccessHelper.FetchOptions =
        fetchOption(testName, photoKeys.PHOTO_TYPE, sendablePhotoAccessHelper.PhotoType.IMAGE);
      const AlbumType = sendablePhotoAccessHelper.AlbumType.SYSTEM;
      const AlbumSubtype = sendablePhotoAccessHelper.AlbumSubtype.ANY;
      await commitModifyPromiseTest(done, testName, AlbumType, AlbumSubtype, fetchOps);
    })
  })
}