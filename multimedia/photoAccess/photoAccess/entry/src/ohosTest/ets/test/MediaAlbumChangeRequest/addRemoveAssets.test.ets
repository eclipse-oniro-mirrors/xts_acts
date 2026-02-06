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
import { photoKeys, fetchOption, getFileAsset, sleep, getPermission, driveFn } from '../common'
import common from '@ohos.app.ability.common'

export default function addRemoveAssetsChangeRequestTest() {
  describe('addRemoveAssetsChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    let helper:ESObject  = photoAccessHelper.getPhotoAccessHelper(testContext);

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ADD_REMOVE_ASSETS_CHANGE_REQUEST_0000
     * @tc.name      : add_remove_assets_change_request_000
     * @tc.desc      : add assets into album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('add_remove_assets_change_request_000', Level.LEVEL0, async (done: Function) => {
      let testNum = 'add_remove_assets_change_request_000';
      try {
        let album:ESObject = await helper.createAlbum(testNum);
        let albumChangeRequest:ESObject = new photoAccessHelper.MediaAlbumChangeRequest(album);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addRemoveAssetsChangeReq01.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);
        albumChangeRequest.addAssets([asset]);
        await helper.applyChanges(albumChangeRequest);

        const fetchResult:ESObject = await album.getAssets(fetchOps);
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
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ADD_REMOVE_ASSETS_CHANGE_REQUEST_0100
     * @tc.name      : add_remove_assets_change_request_001
     * @tc.desc      : add and remove assets into album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('add_remove_assets_change_request_001', Level.LEVEL1, async (done: Function) => {
      let testNum:ESObject = 'add_remove_assets_change_request_001';
      try {
        let album:ESObject = await helper.createAlbum(testNum);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addRemoveAssetsChangeReq02.jpg');
        const asset = await getFileAsset(testContext, testNum, fetchOps);
        albumChangeRequest.addAssets([asset]);
        await helper.applyChanges(albumChangeRequest);

        let fetchResult:ESObject = await album.getAssets(fetchOps);
        let newAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();

        albumChangeRequest.removeAssets([newAsset]);
        await helper.applyChanges(albumChangeRequest);
        fetchResult = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(0);
        fetchResult.close();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ADD_REMOVE_ASSETS_CHANGE_REQUEST_0200
     * @tc.name      : add_remove_assets_change_request_002
     * @tc.desc      : remove null assets, error code 401 or 13900020
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('add_remove_assets_change_request_002', Level.LEVEL2, async (done: Function) => {
      let testNum:string = 'add_remove_assets_change_request_002';
      try {
        let album:ESObject = await helper.createAlbum(testNum);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        const asset:ESObject = null;
        albumChangeRequest.removeAssets([asset]);
        expect(false).assertTrue();
        done();
      } catch (error) {
        if(error.code === `14000016`){
          console.log(`${testNum} success; error: ${error}`);
          expect(true).assertTrue();
        } else {
          console.log(`${testNum} success; error: ${error.code}`);
          expect(error.code === '13900020' || error.code === '401').assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_APPLY_CHANGES_0100
     * @tc.name      : apply_Changes_001
     * @tc.desc      : applyChanges undefined error code 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('apply_Changes_001', Level.LEVEL2, async (done: Function) => {
      let testNum:string = 'apply_Changes_001';
      try {
        let albumChangeRequest: ESObject = undefined;
        await helper.applyChanges(albumChangeRequest);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log(`${testNum} success; error: ${error}`);
        expect(error.code).assertEqual(`401`);
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_APPLY_CHANGES_0200
     * @tc.name      : apply_Changes_002
     * @tc.desc      : applyChanges array<string> error code 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('apply_Changes_002', Level.LEVEL2, async (done: Function) => {
      let testNum:string = 'apply_Changes_002';
      try {
        let albumChangeRequest: ESObject = ['123123'];
        await helper.applyChanges(albumChangeRequest);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.log(`${testNum} success; error: ${error}`);
        expect(error.code).assertEqual(`401`);
        done();
      }
    })
  })
}