/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  fetchOption,
  getFileAsset,
  photoFetchOption,
  photoType
} from '../../../../../../../common'

export default function commitModifyTest () {
  describe('commitModifyTest', function () {
    async function commitModifyCallback (done, testNum, fetchOps, newTitle) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const uri = asset.uri;
        const oldTitle: photoAccessHelper.MemberType = asset.get(photoKeys.TITLE).toString();
        console.info(`${testNum} oldTitle: ${oldTitle}`);
        asset.set(photoKeys.TITLE, newTitle);
        console.info(`${testNum} newTitle: ${newTitle}`);
        asset.commitModify(async (err) => {
          try {
            if (err) {
              console.info(`${testNum} err: ${err}`);
              expect(false).assertTrue();
            } else {
              const option = photoFetchOption(testNum, photoKeys.URI, uri);
              const newAsset = await getFileAsset(testNum, option);
              const title: photoAccessHelper.MemberType = newAsset.get(photoKeys.TITLE).toString();
              expect(title).assertEqual(newTitle);
              asset.set(photoKeys.TITLE, oldTitle.toString());
              await asset.commitModify();
            }
          } catch (error) {
            console.info(`${testNum} error: ${error}`);
          }
          done();
        })        
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }

    async function commitModifyAbnormalCallback (done, testNum, fetchOps, type, value) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset[type] = value;
        asset.commitModify(async (err) => {
          if (err) {
            console.info(`${testNum} err: ${err}`);
            expect(true).assertTrue();
          } else {
            expect(false).assertTrue();
          }
          done();
        })        
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    }

    async function commitModifyPromise (done, testNum, fetchOps, newTitle) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        const uri = asset.uri;
        const oldTitle: photoAccessHelper.MemberType = asset.get(photoKeys.TITLE);
        console.info(`${testNum} oldTitle: ${typeof oldTitle}`);
        asset.set(photoKeys.TITLE, newTitle);
        await asset.commitModify();

        const option = photoFetchOption(testNum, photoKeys.URI, uri);
        const newAsset = await getFileAsset(testNum, option);
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

    async function commitModifyAbnormalPromise (done, testNum, fetchOps, type, value) {
      try {
        const asset = await getFileAsset(testNum, fetchOps);
        asset[type] = value;
        await asset.commitModify();
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(true).assertTrue();
        done();
      }
    }
    
    //callback
    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0000
     * @tc.name      : photoAsset_commitModify_callback_000
     * @tc.desc      : modify image displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_commitModify_callback_000', 0, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb01.jpg');
      const newTitle = new Date().getTime() + testNum;
      await commitModifyCallback(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0100
     * @tc.name      : photoAsset_commitModify_callback_001
     * @tc.desc      : modify image displayName '一...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_001', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb02.jpg');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '一';
      }
      await commitModifyCallback(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0200
     * @tc.name      : photoAsset_commitModify_callback_002
     * @tc.desc      : modify image displayName 'aaaaaaa...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_002', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb03.jpg');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'a';
      }
      await commitModifyCallback(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0300
     * @tc.name      : photoAsset_commitModify_callback_003
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_003', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb04.jpg');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0400
     * @tc.name      : photoAsset_commitModify_callback_004
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_004', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_004';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb05.jpg');
      const type = 'photoType';
      const value = photoType.VIDEO;
      await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0500
     * @tc.name      : photoAsset_commitModify_callback_005
     * @tc.desc      : modify image displayName '二二....jpg' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_005', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_005';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb06.jpg');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 84; i++) {
        value += '二';
      }
      value += '.jpg';
      await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0600
     * @tc.name      : photoAsset_commitModify_callback_006
     * @tc.desc      : modify image displayName 'bbbbbbb...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_006', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_006';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb07.jpg');
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0700
     * @tc.name      : photoAsset_commitModify_callback_007
     * @tc.desc      : modify video displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_commitModify_callback_007', 0, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_007';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb01.mp4');
      const newTitle = new Date().getTime() + testNum;
      await commitModifyCallback(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0800
     * @tc.name      : photoAsset_commitModify_callback_008
     * @tc.desc      : modify video displayName '三三...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_008', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_008';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb02.mp4');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '三';
      }
      await commitModifyCallback(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_0900
     * @tc.name      : photoAsset_commitModify_callback_009
     * @tc.desc      : modify image displayName 'ccccccc...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_009', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_009';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb03.mp4');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'c';
      }
      await commitModifyCallback(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_1000
     * @tc.name      : photoAsset_commitModify_callback_010
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_010', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_010';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb04.mp4');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_1100
     * @tc.name      : photoAsset_commitModify_callback_011
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_011', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_011';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb05.mp4');
      const type = 'photoType';
      const value = photoType.VIDEO;
      await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_1200
     * @tc.name      : photoAsset_commitModify_callback_012
     * @tc.desc      : modify image displayName '四四...' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_012', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_012';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb046.mp4');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 84; i++) {
        value += '四';
      }
      value += '.mp4';
      await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_FILE_ASSET_COMMITMODIFY_1300
     * @tc.name      : photoAsset_commitModify_callback_013
     * @tc.desc      : modify image displayName 'ddddddd...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_callback_013', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_callback_013';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyCb07.mp4');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 252; i++) {
        value += 'd';
      }
      value += '.mp4';
      await commitModifyAbnormalCallback(done, testNum, fetchOps, type, value);
    });

    //promise
    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0000
     * @tc.name      : photoAsset_commitModify_promise_000
     * @tc.desc      : modify image displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_000', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_000';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro01.jpg');
      const newTitle = new Date().getTime() + testNum;
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0100
     * @tc.name      : photoAsset_commitModify_promise_001
     * @tc.desc      : modify image displayName '五五...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_001', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_001';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro02.jpg');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '五';
      }
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0200
     * @tc.name      : photoAsset_commitModify_promise_002
     * @tc.desc      : modify image displayName 'eeeeeee...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_002', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_002';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro03.jpg');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'e';
      }
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0300
     * @tc.name      : photoAsset_commitModify_promise_003
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_003', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_003';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro04.jpg');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0400
     * @tc.name      : photoAsset_commitModify_promise_004
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_004', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_004';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro05.jpg');
      const type = 'photoType';
      const value = photoType.VIDEO;
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0500
     * @tc.name      : photoAsset_commitModify_promise_005
     * @tc.desc      : modify image displayName '六六....jpg' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_005', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_005';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro06.jpg');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 84; i++) {
        value += '六';
      }
      value += '.jpg';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0600
     * @tc.name      : photoAsset_commitModify_promise_006
     * @tc.desc      : modify image displayName 'fffffff...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_006', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_006';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro07.jpg');
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0700
     * @tc.name      : photoAsset_commitModify_promise_007
     * @tc.desc      : modify video displayName
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_007', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_007';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro01.mp4');
      const newTitle = new Date().getTime() + testNum;
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0800
     * @tc.name      : photoAsset_commitModify_promise_008
     * @tc.desc      : modify video displayName '七七...' (83)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_008', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_008';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro02.mp4');
      let newTitle = '';
      for (let i = 0; i < 83; i++) {
        newTitle += '七';
      }
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_0900
     * @tc.name      : photoAsset_commitModify_promise_009
     * @tc.desc      : modify image displayName 'ggggggg...' (251)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_009', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_009';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro03.mp4');
      let newTitle = '';
      for (let i = 0; i < 251; i++) {
        newTitle += 'g';
      }
      await commitModifyPromise(done, testNum, fetchOps, newTitle);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_1000
     * @tc.name      : photoAsset_commitModify_promise_010
     * @tc.desc      : modify image uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_010', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_010';
      const fetchOps = photoFetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro04.mp4');
      const type = 'uri';
      const value = 'file://media/Photo/999999';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_1100
     * @tc.name      : photoAsset_commitModify_promise_011
     * @tc.desc      : modify image photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_011', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_011';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro05.mp4');
      const type = 'photoType';
      const value = photoType.VIDEO;
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_1200
     * @tc.name      : photoAsset_commitModify_promise_012
     * @tc.desc      : modify image displayName '八八...' (84)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_012', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_012';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro06.mp4');
      const type = 'displayName';
      let value = '';
      for (let i = 0; i < 84; i++) {
        value += '八';
      }
      value += '.mp4';
      await commitModifyAbnormalPromise(done, testNum, fetchOps, type, value);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_FILE_ASSET_COMMITMODIFY_1300
     * @tc.name      : photoAsset_commitModify_promise_013
     * @tc.desc      : modify image displayName 'hhhhhhh...' (252)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('photoAsset_commitModify_promise_013', 2, async function (done) {
      const testNum = 'photoAsset_commitModify_promise_013';
      const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'modifyPro07.mp4');
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
