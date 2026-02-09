/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { photoKeys, fetchOption, getPermission, driveFn, sleep } from '../common'
import common from '@ohos.app.ability.common'

export default function setTitleChangeRequestTest() {
  describe('setTitleChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   set_title_change_request_000
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_TITLE_CHANGE_REQUEST_0000
     * @tc.desc   change asset title
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_title_change_request_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_title_change_request_000';
      try {
        let asset:ESObject = await helper.createAsset('title.jpg');
        let fd:ESObject = await asset.open('rw');
        await asset.close(fd);

        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(testNum);
        await helper.applyChanges(assetChangeRequest);

        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, testNum + '.jpg');
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   set_title_change_request_001
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_TITLE_CHANGE_REQUEST_0100
     * @tc.desc   change asset title '', error code 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('set_title_change_request_001', Level.LEVEL2, async (done: Function) => {
      let testNum = 'set_title_change_request_001';
      try {
        let asset:ESObject = await helper.createAsset('title.jpg');

        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle('');
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   set_title_change_request_002
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_TITLE_CHANGE_REQUEST_0200
     * @tc.desc   change asset title undefined,error code is 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('set_title_change_request_002', Level.LEVEL2, async (done: Function) => {
      let testNum = 'set_title_change_request_002';
      try {
        let asset:ESObject = await helper.createAsset('title.jpg');
        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(undefined);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(error.code).assertEqual('401');
        done();
      }
    })

    /**
     * @tc.name   set_title_change_request_003
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_TITLE_CHANGE_REQUEST_0300
     * @tc.desc   change asset title, title is ('aaa...aaa'(255))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_title_change_request_003', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_title_change_request_003';
      try {
        let asset: ESObject = await helper.createAsset('title255.jpg');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        let assetTitle = '';
        for (let i = 0; i < 251; i++) {
          assetTitle += 'a';
        }
        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(assetTitle);
        await helper.applyChanges(assetChangeRequest);

        let fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, assetTitle + '.jpg');
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   set_title_change_request_004
     * @tc.number SUB_PHOTOACCESS_HELPER_SET_TITLE_CHANGE_REQUEST_0400
     * @tc.desc   change asset title, title is ('aaa...aaa'(256))
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('set_title_change_request_004', Level.LEVEL0, async (done: Function) => {
      let testNum = 'set_title_change_request_004';
      try {
        let asset: ESObject = await helper.createAsset('title256.jpg');
        let fd: ESObject = await asset.open('rw');
        await asset.close(fd);

        let assetTitle = '';
        for (let i = 0; i < 252; i++) {
          assetTitle += 'a';
        }
        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        assetChangeRequest.setTitle(assetTitle);
        await helper.applyChanges(assetChangeRequest);

        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        done();
      }
    })
  })
}