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
import { describe, it, expect } from 'deccjsunit/index'
import { photoKeys, fetchOption, getFileAsset } from '../../../../../../../common'

export default function addRemoveAssetsChangeRequestTest() {
  describe('addRemoveAssetsChangeRequestTest', function () {
    let helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ADD_REMOVE_ASSETS_CHANGE_REQUEST_0000
     * @tc.name      : add_remove_assets_change_request_000
     * @tc.desc      : add assets into album
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('add_remove_assets_change_request_000', 0, async function (done) {
      let testNum = 'add_remove_assets_change_request_000';
      try {
        let album = await helper.createAlbum(testNum);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addRemoveAssetsChangeReq01.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        albumChangeRequest.addAssets([asset]);
        await helper.applyChanges(albumChangeRequest);

        const fetchResult = await album.getAssets(fetchOps);
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
    it('add_remove_assets_change_request_001', 1, async function (done) {
      let testNum = 'add_remove_assets_change_request_001';
      try {
        let album = await helper.createAlbum(testNum);
        let albumChangeRequest = new photoAccessHelper.MediaAlbumChangeRequest(album);
        const fetchOps = fetchOption(testNum, photoKeys.DISPLAY_NAME, 'addRemoveAssetsChangeReq02.jpg');
        const asset = await getFileAsset(testNum, fetchOps);
        albumChangeRequest.addAssets([asset]);
        await helper.applyChanges(albumChangeRequest);

        let fetchResult = await album.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(1);
        fetchResult.close();

        albumChangeRequest.removeAssets([asset]);
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
  })
}