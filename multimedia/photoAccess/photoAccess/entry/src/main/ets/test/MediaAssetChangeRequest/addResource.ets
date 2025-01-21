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
import { fetchOption, photoKeys } from '../../../../../../../common'

export default function addResourceChangeRequestTest() {
  describe('addResourceChangeRequestTest', function () {
    const context = globalThis.abilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(context);

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0000
     * @tc.name      : add_resource_change_request_000
     * @tc.desc      : add resource by ArrayBuffer
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('add_resource_change_request_000', 0, async function (done) {
      let testNum = 'add_resource_change_request_000';
      try {
        let fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoAccessHelper.PhotoType.IMAGE);
        let fetchResult = await helper.getAssets(fetchOps);
        let count = fetchResult.getCount();

        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension);
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1024));
        await helper.applyChanges(assetChangeRequest);

        fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount()).assertEqual(count + 1);
        console.info(`${testNum} succeed to add resource by ArrayBuffer`);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_ADD_RESOURCE_CHANGE_REQUEST_0100
     * @tc.name      : add_resource_change_request_001
     * @tc.desc      : add resource by invalid fileUri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('add_resource_change_request_001', 2, async function (done) {
      let testNum = 'add_resource_change_request_001';
      try {
        let photoType = photoAccessHelper.PhotoType.VIDEO;
        let extension = 'mp4';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(context, photoType, extension);
        let fileUri = 'file://com.example.myapplication.MainAbility/data/storage/el2/base/haps/entry/files/non_exist_uri.mp4';
        assetChangeRequest.addResource(photoAccessHelper.ResourceType.VIDEO_RESOURCE, fileUri);
        await helper.applyChanges(assetChangeRequest);
        console.error(`${testNum} failed; error: succeed to add resource with invalid fileUri`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} succeed to detect invalid fileUri`);
        done();
      }
    })
  })
}