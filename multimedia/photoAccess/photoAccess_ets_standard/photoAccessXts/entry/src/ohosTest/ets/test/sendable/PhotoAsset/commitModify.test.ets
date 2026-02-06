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

import { describe, it, expect, beforeAll, Level, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  photoKeys,
  fetchOption,
  getFileAsset,
  photoFetchOption,
  photoType,
  getPermission,
  driveFn,
  LOG_TAG,
  getSendableFileAsset,
} from '../../common';
import common from '@ohos.app.ability.common';
import { photoAccessHelper, sendablePhotoAccessHelper } from '@kit.MediaLibraryKit';

const TAG = LOG_TAG + 'sendableCommitModifyTest';

async function commitModifyPromise(done: Function, testName: string, fetchOps: ESObject, newTitle: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, fetchOps);
    const uri = asset.uri;
    const oldTitle: photoAccessHelper.MemberType = asset.get(photoKeys.TITLE).toString();
    console.info(TAG, `commitModifyPromise ${testName} oldTitle: ${oldTitle}, newTitle: ${newTitle}`);
    asset.set(photoKeys.TITLE, newTitle);
    await asset.commitModify();

    const option: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.URI, uri);
    const newAsset: sendablePhotoAccessHelper.PhotoAsset = await getSendableFileAsset(testContext, testName, option);
    const title: photoAccessHelper.MemberType = newAsset.get(photoKeys.TITLE).toString();
    expect(title).assertEqual(newTitle);

    asset.set(photoKeys.TITLE, oldTitle.toString());
    await asset.commitModify();
    done();
  } catch (error) {
    console.info(TAG, `commitModifyPromise ${testName} failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}

async function commitModifyAbnormalPromise(done: Function, testName: string, fetchOps: ESObject, type: string,
  value: photoAccessHelper.PhotoType | string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    console.info(TAG, `commitModifyAbnormalPromise ${testName} ; type = ${type}, value = ${value}`);
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
    asset[type] = value;
    await asset.commitModify();
    expect().assertFail();
    done();
  } catch (error) {
    console.error(TAG, `commitModifyAbnormalPromise ${testName} failed; error: ${error?.code}, ${error?.message}`);
    expect(true).assertTrue();
    done();
  }
}

export default function sendableCommitModifyPhotoAssetTest() {
  describe('sendableCommitModifyPhotoAssetTest', () => {
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
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_001
     * @tc.name      : photoAsset_commitModify_promise_sendable_001
     * @tc.desc      : modify image displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_001';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro01.jpg');
      const newTitle = new Date().getTime() + testName;
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_002
     * @tc.name      : photoAsset_commitModify_promise_sendable_002
     * @tc.desc      : modify image displayName '五五...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro02.jpg');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '五';
      }
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_003
     * @tc.name      : photoAsset_commitModify_promise_sendable_003
     * @tc.desc      : modify image displayName 'eeeeeee...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro03.jpg');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'e';
      }
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_004
     * @tc.name      : photoAsset_commitModify_promise_sendable_004
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro04.jpg');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_005
     * @tc.name      : photoAsset_commitModify_promise_sendable_005
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro05.jpg');
      const type = 'photoType';
      const value: photoAccessHelper.PhotoType = photoType.VIDEO;
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_006
     * @tc.name      : photoAsset_commitModify_promise_sendable_006
     * @tc.desc      : modify image displayName '六六....jpg' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_006';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro06.jpg');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 84; i++) {
        value += '六';
      }
      value += '.jpg';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_007
     * @tc.name      : photoAsset_commitModify_promise_sendable_007
     * @tc.desc      : modify image displayName 'fffffff...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro07.jpg');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 252; i++) {
        value += 'f';
      }
      value += '.jpg';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_008
     * @tc.name      : photoAsset_commitModify_promise_sendable_008
     * @tc.desc      : modify video displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_008';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro01.mp4');
      const newTitle = new Date().getTime() + testName;
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_009
     * @tc.name      : photoAsset_commitModify_promise_sendable_009
     * @tc.desc      : modify video displayName '七七...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_009';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro02.mp4');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '七';
      }
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_010
     * @tc.name      : photoAsset_commitModify_promise_sendable_010
     * @tc.desc      : modify image displayName 'ggggggg...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_010';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro03.mp4');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'g';
      }
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_011
     * @tc.name      : photoAsset_commitModify_promise_sendable_011
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_011';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro04.mp4');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_012
     * @tc.name      : photoAsset_commitModify_promise_sendable_012
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro05.mp4');
      const type = 'photoType';
      const value: photoAccessHelper.PhotoType = photoType.VIDEO;
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_013
     * @tc.name      : photoAsset_commitModify_promise_sendable_013
     * @tc.desc      : modify image displayName '八八...' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro06.mp4');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 84; i++) {
        value += '八';
      }
      value += '.mp4';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : SENDABLE_PHOTO_ASSET_COMMIT_MODIFY_014
     * @tc.name      : photoAsset_commitModify_promise_sendable_014
     * @tc.desc      : modify image displayName 'hhhhhhh...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_sendable_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_sendable_014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro07.mp4');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 252; i++) {
        value += 'h';
      }
      value += '.mp4';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })
  })
}