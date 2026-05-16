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
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";

import hilog from '@ohos.hilog'
import { fetchOption, getFileAsset, photoFetchOption, getPermission, driveFn, sleep } from '../Common.test.ets'
import { BusinessError } from '@ohos.base';

let domain: int= 0x0000;
let tag: string = 'testTag';

async function commitModifyCallback(done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
  newTitle: string) {

  try {
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
    const uri: string = asset.uri;
    const oldTitle: photoAccessHelper.MemberType = asset.get(photoAccessHelper.PhotoKeys.TITLE).toString();
    hilog.info(domain, tag, `${testNum} oldTitle: ${oldTitle}`);
    asset.set(photoAccessHelper.PhotoKeys.TITLE, newTitle);
    hilog.info(domain, tag, `${testNum} newTitle: ${newTitle}`);
    asset.commitModify((err: BusinessError | null) => {
      try {
        if (err?.code !== 0) {
          hilog.info(domain, tag, `${testNum} err: ${err}`);
          expect(false).assertTrue();
        } else {
          const option: photoAccessHelper.FetchOptions =
            photoFetchOption(testNum, photoAccessHelper.PhotoKeys.URI, uri);
          const newAsset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, option);
          const title: photoAccessHelper.MemberType = newAsset.get(photoAccessHelper.PhotoKeys.TITLE).toString();
          expect(title).assertEqual(newTitle);
          asset.set(photoAccessHelper.PhotoKeys.TITLE, oldTitle.toString());
          await asset.commitModify();
        }
      } catch (error) {
        hilog.info(domain, tag, `${testNum} error: ${error}`);
      }
      done();
    })
  } catch (error) {
    hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
    expect(false).assertTrue();
    done();
  }
}

async function commitModifyAbnormalCallback(done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
  type: string, value: string) {
  try {
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
    asset.set(type, value);
    asset.commitModify((err: BusinessError | null) => {
      if (err?.code !== 0) {
        hilog.info(domain, tag, `${testNum} err: ${err}`);
      } else {
        expect(false).assertTrue();
      }
      done();
    })
  } catch (error) {
    hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
    done();
  }
}

async function commitModifyPromise(done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
  newTitle: string) {
  try {
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
    const uri = asset.uri;
    const oldTitle: photoAccessHelper.MemberType = asset.get(photoAccessHelper.PhotoKeys.TITLE);
    hilog.info(domain, tag, `${testNum} oldTitle: ${typeof oldTitle}`);
    asset.set(photoAccessHelper.PhotoKeys.TITLE, newTitle);
    await asset.commitModify();

    const option: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoAccessHelper.PhotoKeys.URI, uri);
    const newAsset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, option);
    const title: photoAccessHelper.MemberType = newAsset.get(photoAccessHelper.PhotoKeys.TITLE).toString();
    expect(title).assertEqual(newTitle);

    asset.set(photoAccessHelper.PhotoKeys.TITLE, oldTitle.toString());
    await asset.commitModify();
    done();
  } catch (error) {
    hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
    expect(false).assertTrue();
    done();
  }
}

async function commitModifyAbnormalPromise(done: () => void, testNum: string, fetchOps: photoAccessHelper.FetchOptions,
  type: string, value: photoAccessHelper.PhotoType | string) {

  try {
    const asset: photoAccessHelper.PhotoAsset = await getFileAsset(testNum, fetchOps);
    asset.set(type, value as string);
    await asset.commitModify();
    expect(false).assertTrue();
    done();
  } catch (error) {
    hilog.info(domain, tag, `${testNum} failed; error: ${error}`);
    done();
  }
}

export default function commitModifyTest() {
  describe('commitModifyTest', (): void => {

    beforeAll(async () => {
      hilog.info(domain, tag, 'beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0000
     * @tc.desc   modify image displayName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('photoAsset_commitModify_callback_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_000';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb01.jpg');
        const newTitle = new Date().getTime() + testNum;
        await commitModifyCallback(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0100
     * @tc.desc   modify image displayName '一...' (83)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_001';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb02.jpg');
        let newTitle = '';
        for (let i = 0; i < 83; i++) {
          newTitle += '一';
        }
        await commitModifyCallback(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0200
     * @tc.desc   modify image displayName 'aaaaaaa...' (251)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_002';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb03.jpg');
        let newTitle = '';
        for (let i = 0; i < 251; i++) {
          newTitle += 'a';
        }
        await commitModifyCallback(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0300
     * @tc.desc   modify image uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_003';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb04.jpg');
        const type = 'uri';
        const value = 'file://media/Photo/999999';
        await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0500
     * @tc.desc   modify image displayName '二二....jpg' (84)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_005';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb06.jpg');
        const type = 'displayName';
        let value = '';
        for (let i = 0; i < 84; i++) {
          value += '二';
        }
        value += '.jpg';
        await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_006
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0600
     * @tc.desc   modify image displayName 'bbbbbbb...' (252)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_006';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb07.jpg');
        const type = 'displayName';
        let value = '';
        for (let i = 0; i < 252; i++) {
          value += 'b';
        }
        value += '.jpg';
        await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
      });

    //video
    /**
     * @tc.name   photoAsset_commitModify_callback_static_007
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0700
     * @tc.desc   modify video displayName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('photoAsset_commitModify_callback_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_007';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb01.mp4');
        const newTitle = new Date().getTime() + testNum;
        await commitModifyCallback(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_008
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0800
     * @tc.desc   modify video displayName '三三...' (83)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_008';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb02.mp4');
        let newTitle = '';
        for (let i = 0; i < 83; i++) {
          newTitle += '三';
        }
        await commitModifyCallback(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_009
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_0900
     * @tc.desc   modify image displayName 'ccccccc...' (251)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_009';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb03.mp4');
        let newTitle = '';
        for (let i = 0; i < 251; i++) {
          newTitle += 'c';
        }
        await commitModifyCallback(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_010
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_1000
     * @tc.desc   modify image uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_010';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb04.mp4');
        const type = 'uri';
        const value = 'file://media/Photo/999999';
        await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_012
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_1200
     * @tc.desc   modify image displayName '四四...' (84)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_012';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb06.mp4');
        const type = 'displayName';
        let value = '';
        for (let i = 0; i < 84; i++) {
          value += '四';
        }
        value += '.mp4';
        await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_callback_static_013
     * @tc.number SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_STATIC_1300
     * @tc.desc   modify image displayName 'ddddddd...' (252)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_callback_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_callback_static_013';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyCb07.mp4');
        const type = 'displayName';
        let value = '';
        for (let i = 0; i < 252; i++) {
          value += 'd';
        }
        value += '.mp4';
        await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_000
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0000
     * @tc.desc   modify image displayName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_000';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro01.jpg');
        const newTitle = new Date().getTime() + testNum;
        await commitModifyPromise(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_001
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0100
     * @tc.desc   modify image displayName '五五...' (83)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_001';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro02.jpg');
        let newTitle = '';
        for (let i = 0; i < 83; i++) {
          newTitle += '五';
        }
        await commitModifyPromise(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_002
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0200
     * @tc.desc   modify image displayName 'eeeeeee...' (251)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_002';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro03.jpg');
        let newTitle = '';
        for (let i = 0; i < 251; i++) {
          newTitle += 'e';
        }
        await commitModifyPromise(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_003
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0300
     * @tc.desc   modify image uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_003';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro04.jpg');
        const type = 'uri';
        const value = 'file://media/Photo/999999';
        await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_004
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0400
     * @tc.desc   modify image photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_004';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro05.jpg');
        const type = 'photoType';
        const value: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_005
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0500
     * @tc.desc   modify image displayName '六六....jpg' (84)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_005';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro06.jpg');
        const type = 'displayName';
        let value = '';
        for (let i = 0; i < 84; i++) {
          value += '六';
        }
        value += '.jpg';
        await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_006
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0600
     * @tc.desc   modify image displayName 'fffffff...' (252)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_006';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro07.jpg');
        const type = 'displayName';
        let value = '';
        for (let i = 0; i < 252; i++) {
          value += 'f';
        }
        value += '.jpg';
        await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
      });

    //video
    /**
     * @tc.name   photoAsset_commitModify_promise_static_007
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0700
     * @tc.desc   modify video displayName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_007';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro01.mp4');
        const newTitle = new Date().getTime() + testNum;
        await commitModifyPromise(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_008
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0800
     * @tc.desc   modify video displayName '七七...' (83)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_008';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro02.mp4');
        let newTitle = '';
        for (let i = 0; i < 83; i++) {
          newTitle += '七';
        }
        await commitModifyPromise(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_009
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_0900
     * @tc.desc   modify image displayName 'ggggggg...' (251)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_009';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro03.mp4');
        let newTitle = '';
        for (let i = 0; i < 251; i++) {
          newTitle += 'g';
        }
        await commitModifyPromise(done, testNum, fetchOps, newTitle);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_010
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_1000
     * @tc.desc   modify image uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_010';
        const fetchOps: photoAccessHelper.FetchOptions =
          photoFetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro04.mp4');
        const type = 'uri';
        const value = 'file://media/Photo/999999';
        await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_011
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_1100
     * @tc.desc   modify image photoType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_011';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro05.mp4');
        const type = 'photoType';
        const value: photoAccessHelper.PhotoType = photoAccessHelper.PhotoType.VIDEO;
        await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_012
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_1200
     * @tc.desc   modify image displayName '八八...' (84)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_012';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro06.mp4');
        const type = 'displayName';
        let value = '';
        for (let i = 0; i < 84; i++) {
          value += '八';
        }
        value += '.mp4';
        await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
      });

    /**
     * @tc.name   photoAsset_commitModify_promise_static_013
     * @tc.number SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_STATIC_1300
     * @tc.desc   modify image displayName 'hhhhhhh...' (252)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('photoAsset_commitModify_promise_static_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        const testNum = 'photoAsset_commitModify_promise_static_013';
        const fetchOps: photoAccessHelper.FetchOptions =
          fetchOption(testNum, photoAccessHelper.PhotoKeys.DISPLAY_NAME, 'modifyPro07.mp4');
        const type = 'displayName';
        let value = '';
        for (let i = 0; i < 252; i++) {
          value += 'h';
        }
        value += '.mp4';
        await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
      });
  })
}