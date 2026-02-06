/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
import { common } from '@kit.AbilityKit';
import {
  sleep,
  driveFn,
  getPermission,
  photoKeys,
  fetchOption,
  photoFetchOption,
  createResource
} from '../../util/common'

export default function commitModifyTest () {

  let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
  let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);

  describe('commitModifyTest', () => {
    beforeAll(async () => {
      await getPermission();
      await sleep(10);
      await driveFn();
    });


    let commitModifyPromise = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, newTitle: string) => {
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOps);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        const uri: string = asset.uri;
        const oldTitle: photoAccessHelper.MemberType = asset.get(photoKeys.TITLE);
        console.info(`${testNum} oldTitle: ${typeof oldTitle}`);
        asset.set(photoKeys.TITLE, newTitle);
        await asset.commitModify();
        const option: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.URI, uri);
        let newFetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(option);
        let newAsset: sendablePhotoAccessHelper.PhotoAsset = await newFetchResult.getFirstObject();
        const title: photoAccessHelper.MemberType = newAsset.get(photoKeys.TITLE).toString();
        expect(title).assertEqual(newTitle);
        asset.set(photoKeys.TITLE, oldTitle.toString());
        await asset.commitModify();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    let commitModifyAbnormalPromise = async (done: Function, testNum: string, fetchOps: photoAccessHelper.FetchOptions, type: string, value: string) => {
      try {
        let fetchResult: sendablePhotoAccessHelper.FetchResult<sendablePhotoAccessHelper.PhotoAsset> = await sendablePhAccessHelper.getAssets(fetchOps);
        let asset: sendablePhotoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        asset.set(type, value);
        await asset.commitModify();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    }

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_001
     * @tc.name      : photoAsset_commitModify_promise_000
     * @tc.desc      : modify image displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_000', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_000';
      let fileNameList: Array<string> = ['modifyPro01.jpg'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro01.jpg');
      const newTitle = new Date().getTime() + testNum;
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_002
     * @tc.name      : photoAsset_commitModify_promise_001
     * @tc.desc      : modify image displayName '五五...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_001', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_001';
      let fileNameList: Array<string> = ['modifyPro02.jpg'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro02.jpg');
      let newTitle = '五'.repeat(83);
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_003
     * @tc.name      : photoAsset_commitModify_promise_002
     * @tc.desc      : modify image displayName 'eeeeeee...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_002', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_002';
      let fileNameList: Array<string> = ['modifyPro03.jpg'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro03.jpg');
      let newTitle = 'e'.repeat(251);
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_004
     * @tc.name      : photoAsset_commitModify_promise_003
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_003', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_003';
      let fileNameList: Array<string> = ['modifyPro04.jpg'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro04.jpg');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_005
     * @tc.name      : photoAsset_commitModify_promise_005
     * @tc.desc      : modify image displayName '六六....jpg' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_005', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_005';
      let fileNameList: Array<string> = ['modifyPro06.jpg'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro06.jpg');
      const type = 'displayName';
      let value = '六'.repeat(84) + '.jpg';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_006
     * @tc.name      : photoAsset_commitModify_promise_006
     * @tc.desc      : modify image displayName 'fffffff...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_006', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_006';
      let fileNameList: Array<string> = ['modifyPro07.jpg'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro07.jpg');
      const type = 'displayName';
      let value = 'f'.repeat(252) + '.jpg';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_007
     * @tc.name      : photoAsset_commitModify_promise_007
     * @tc.desc      : modify video displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_007', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_007';
      let fileNameList: Array<string> = ['modifyPro01.mp4'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro01.mp4');
      const newTitle = new Date().getTime() + testNum;
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_008
     * @tc.name      : photoAsset_commitModify_promise_008
     * @tc.desc      : modify video displayName '七七...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_008', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_008';
      let fileNameList: Array<string> = ['modifyPro02.mp4'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro02.mp4');
      let newTitle = '七'.repeat(83);
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_009
     * @tc.name      : photoAsset_commitModify_promise_009
     * @tc.desc      : modify image displayName 'ggggggg...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_009', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_009';
      let fileNameList: Array<string> = ['modifyPro03.mp4'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro03.mp4');
      let newTitle = 'g'.repeat(251);
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_010
     * @tc.name      : photoAsset_commitModify_promise_010
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_010', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_010';
      let fileNameList: Array<string> = ['modifyPro04.mp4'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro04.mp4');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_011
     * @tc.name      : photoAsset_commitModify_promise_012
     * @tc.desc      : modify image displayName '八八...' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_012', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_012';
      let fileNameList: Array<string> = ['modifyPro06.mp4'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro06.mp4');
      const type = 'displayName';
      let value = '八'.repeat(84) + '.mp4';;
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : Sub_Photo_Access_Sendable_Asset_CommitModify_012
     * @tc.name      : photoAsset_commitModify_promise_013
     * @tc.desc      : modify image displayName 'hhhhhhh...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_013', Level.LEVEL2, async (done: Function) => {
      const testNum = 'photoAsset_commitModify_promise_013';
      let fileNameList: Array<string> = ['modifyPro07.mp4'];
      await createResource(globalContext, fileNameList);
      const fetchOps: photoAccessHelper.FetchOptions = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro07.mp4');
      const type = 'displayName';
      let value = 'h'.repeat(252) + '.mp4';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

  })
}
