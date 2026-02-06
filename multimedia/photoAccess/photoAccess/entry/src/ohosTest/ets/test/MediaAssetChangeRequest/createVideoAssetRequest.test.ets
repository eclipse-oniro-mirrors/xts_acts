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
import common from '@ohos.app.ability.common';
import { getPermission, driveFn,sleep} from '../common';

export default function createVideoAssetRequestTest() {
  describe('createVideoAssetRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CREATE_VIDEO_ASSET_REQUEST_0000
     * @tc.name      : create_video_asset_request_000
     * @tc.desc      : create video asset request with invalid fileUri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('create_video_asset_request_000', Level.LEVEL2, async (done: Function) => {
      let testNum = 'create_video_asset_request_000';
      try {
        let fileUri = 'file://com.example.myapplication.MainAbility/data/storage/el2/base/haps/entry/files/test_this_api_with_demo.mp4';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createVideoAssetRequest(testContext, fileUri);
        await helper.applyChanges(assetChangeRequest);

        console.error(`${testNum} failed; error: succeed to create video asset with invalid fileUri`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${testNum} succeed to detect invalid fileUri`);
        done();
      }
    })
  })
}