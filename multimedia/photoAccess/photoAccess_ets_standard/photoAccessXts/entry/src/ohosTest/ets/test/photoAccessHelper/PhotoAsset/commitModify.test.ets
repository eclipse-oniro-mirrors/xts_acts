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
} from '../../common';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

const TAG = LOG_TAG + 'commitModify';

async function commitModifyCallback(done: Function, testName: string, fetchOps: ESObject, newTitle: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
    const uri: string = asset.uri;
    const oldTitle: photoAccessHelper.MemberType = asset.get(photoKeys.TITLE).toString();
    console.info(TAG, `commitModifyCallback ${testName} oldTitle: ${oldTitle} ,uri : ${uri}`);
    asset.set(photoKeys.TITLE, newTitle);
    console.info(TAG, `commitModifyCallback ${testName} newTitle: ${newTitle}`);
    asset.commitModify(async (err: BusinessError) => {
      try {
        if (err) {
          console.error(TAG, `commitModifyCallback ${testName} err: ${err}`);
          expect().assertFail();
        } else {
          const option: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.URI, uri);
          const newAsset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, option);
          const title: photoAccessHelper.MemberType = newAsset.get(photoKeys.TITLE).toString();
          console.log(TAG, 'title: ' + title);
          expect(title).assertEqual(newTitle);
          asset.set(photoKeys.TITLE, oldTitle.toString());
          await asset.commitModify();
        }
      } catch (error) {
        console.error(TAG, `commitModify ${testName} error: ${error?.code}, ${error?.message}`);
        expect().assertFail();
        done();
      }
      done();
    })
  } catch (error) {
    console.error(TAG, `commitModifyCallback ${testName} failed; error: ${error?.code}, ${error?.message}`);
    expect().assertFail();
    done();
  }
}

async function commitModifyAbnormalCallback(done: Function, testName: string, fetchOps: ESObject, type: string,
  value: string | photoAccessHelper.PhotoType) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
    asset[type] = value;
    asset.commitModify(async (err) => {
      if (err) {
        console.info(TAG, `commitModifyAbnormalCallback commitModify error, ${testName} ${err.code}, ${err.message}`);
        expect(true).assertTrue();
      } else {
        expect().assertFail();
      }
      done();
    })
  } catch (error) {
    console.info(TAG,
      `commitModifyAbnormalCallback error, ${testName} failed; error: ${error?.code}, ${error?.message}`);
    expect(true).assertTrue();
    done();
  }
}

async function commitModifyPromise(done: Function, testName: string, fetchOps: ESObject, newTitle: string) {
  let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
  try {
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, fetchOps);
    const uri = asset.uri;
    const oldTitle: photoAccessHelper.MemberType = asset.get(photoKeys.TITLE).toString();
    console.info(TAG, `commitModifyPromise ${testName} oldTitle: ${oldTitle}, newTitle: ${newTitle}`);
    asset.set(photoKeys.TITLE, newTitle);
    await asset.commitModify();

    const option: photoAccessHelper.FetchOptions = photoFetchOption(testName, photoKeys.URI, uri);
    const newAsset: photoAccessHelper.PhotoAsset = await getFileAsset(testContext, testName, option);
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

export default function commitModifyTest() {
  describe('commitModifyTest', () => {
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
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_001
     * @tc.name      : photoAsset_commitModify_callback_001
     * @tc.desc      : modify image displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_commitModify_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_001';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb01.jpg');
      const newTitle = new Date().getTime() + testName;
      await commitModifyCallback(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_002
     * @tc.name      : photoAsset_commitModify_callback_002
     * @tc.desc      : modify image displayName '一...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb02.jpg');
      let newTitle = '';
      for (let i = 0; i < 20; i++) {
        newTitle += '&';
      }
      await commitModifyCallback(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_003
     * @tc.name      : photoAsset_commitModify_callback_003
     * @tc.desc      : modify image displayName 'aaaaaaa...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb03.jpg');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'a';
      }
      await commitModifyCallback(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_004
     * @tc.name      : photoAsset_commitModify_callback_004
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb04.jpg');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalCallback(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_005
     * @tc.name      : photoAsset_commitModify_callback_005
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb05.jpg');
      const type = 'photoType';
      const value: ESObject = photoType.VIDEO;
      await commitModifyAbnormalCallback(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_006
     * @tc.name      : photoAsset_commitModify_callback_006
     * @tc.desc      : modify image displayName '二二....jpg' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    /*    it('photoAsset_commitModify_callback_006', Level.LEVEL2, async (done: Function) => {
          const testName = 'photoAsset_commitModify_callback_006';
          const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb06.jpg');
          const type = 'displayName'; //To do 修改displayName实际生效了，有问题，预期应该是无法修改的
          let value = '';
          for (let i = 0; i < 10; i++) {
            value += '#';
          }
          value += '.jpg';
          await commitModifyAbnormalCallback(done, testName, fetchOps, type, value);
        })*/

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_007
     * @tc.name      : photoAsset_commitModify_callback_007
     * @tc.desc      : modify image displayName 'bbbbbbb...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb07.jpg');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 252; i++) {
        value += 'a';
      }
      value += '.jpg';
      await commitModifyAbnormalCallback(done, testName, fetchOps, type, value);
    })

    //video
    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_008
     * @tc.name      : photoAsset_commitModify_callback_008
     * @tc.desc      : modify video displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_commitModify_callback_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_008';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb01.mp4');
      const newTitle = new Date().getTime() + testName;
      await commitModifyCallback(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_009
     * @tc.name      : photoAsset_commitModify_callback_009
     * @tc.desc      : modify video displayName '三三...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_009';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb02.mp4');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '三';
      }
      await commitModifyCallback(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_010
     * @tc.name      : photoAsset_commitModify_callback_010
     * @tc.desc      : modify image displayName 'ccccccc...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_010';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb03.mp4');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'c';
      }
      await commitModifyCallback(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_011
     * @tc.name      : photoAsset_commitModify_callback_011
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_011';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb04.mp4');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalCallback(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_012
     * @tc.name      : photoAsset_commitModify_callback_012
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb05.mp4');
      const type = 'photoType';
      const value: photoAccessHelper.PhotoType = photoType.VIDEO;
      await commitModifyAbnormalCallback(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_013
     * @tc.name      : photoAsset_commitModify_callback_013
     * @tc.desc      : modify image displayName '四四...' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_013';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb06.mp4');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 84; i++) {
        value += '四';
      }
      value += '.mp4';
      await commitModifyAbnormalCallback(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_014
     * @tc.name      : photoAsset_commitModify_callback_014
     * @tc.desc      : modify image displayName 'ddddddd...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_callback_014';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyCb07.mp4');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 252; i++) {
        value += 'd';
      }
      value += '.mp4';
      await commitModifyAbnormalCallback(done, testName, fetchOps, type, value);
    })

    //promise
    //image
    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_015
     * @tc.name      : photoAsset_commitModify_promise_001
     * @tc.desc      : modify image displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_001';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro01.jpg');
      const newTitle = new Date().getTime() + testName;
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_016
     * @tc.name      : photoAsset_commitModify_promise_002
     * @tc.desc      : modify image displayName '五五...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_002';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro02.jpg');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '五';
      }
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_017
     * @tc.name      : photoAsset_commitModify_promise_003
     * @tc.desc      : modify image displayName 'eeeeeee...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_003';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro03.jpg');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'e';
      }
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_018
     * @tc.name      : photoAsset_commitModify_promise_004
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_004';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro04.jpg');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_019
     * @tc.name      : photoAsset_commitModify_promise_005
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_005';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro05.jpg');
      const type = 'photoType';
      const value: photoAccessHelper.PhotoType = photoType.VIDEO;
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_020
     * @tc.name      : photoAsset_commitModify_promise_006
     * @tc.desc      : modify image displayName '六六....jpg' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_006';
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
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_021
     * @tc.name      : photoAsset_commitModify_promise_007
     * @tc.desc      : modify image displayName 'fffffff...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_007';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro07.jpg');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 252; i++) {
        value += 'f';
      }
      value += '.jpg';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    //video
    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_022
     * @tc.name      : photoAsset_commitModify_promise_008
     * @tc.desc      : modify video displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_008';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro01.mp4');
      const newTitle = new Date().getTime() + testName;
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_023
     * @tc.name      : photoAsset_commitModify_promise_009
     * @tc.desc      : modify video displayName '七七...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_009';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro02.mp4');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '七';
      }
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_024
     * @tc.name      : photoAsset_commitModify_promise_010
     * @tc.desc      : modify image displayName 'ggggggg...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_010';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro03.mp4');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'g';
      }
      await commitModifyPromise(done, testName, fetchOps, newTitle);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_025
     * @tc.name      : photoAsset_commitModify_promise_011
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_011';
      const fetchOps: photoAccessHelper.FetchOptions =
        photoFetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro04.mp4');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_026
     * @tc.name      : photoAsset_commitModify_promise_012
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_012';
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testName, photoKeys.DISPLAY_NAME, 'modifyPro05.mp4');
      const type = 'photoType';
      const value: photoAccessHelper.PhotoType = photoType.VIDEO;
      await commitModifyAbnormalPromise(done, testName, fetchOps, type, value);
    })

    /**
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_027
     * @tc.name      : photoAsset_commitModify_promise_013
     * @tc.desc      : modify image displayName '八八...' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_013';
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
     * @tc.number    : PHOTO_ASSET_COMMIT_MODIFY_028
     * @tc.name      : photoAsset_commitModify_promise_014
     * @tc.desc      : modify image displayName 'hhhhhhh...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'photoAsset_commitModify_promise_014';
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