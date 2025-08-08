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
import { describe, it, expect, beforeAll } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { getPermission,driveFn ,sleep} from '../common';

export default function getAssetChangeRequestTest() {
  describe('getAssetChangeRequestTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_ASSET_CHANGE_REQUEST_0000
     * @tc.name      : get_asset_change_request_000
     * @tc.desc      : get asset in MediaAssetChangeRequest
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('get_asset_change_request_000', 0, async (done: Function) => {
      let testNum = 'get_asset_change_request_000';
      try {
        let asset = await helper.createAsset(testNum + '.jpg');
        let fd = await asset.open('rw');
        await asset.close(fd);

        let assetChangeRequest = new photoAccessHelper.MediaAssetChangeRequest(asset);
        expect(assetChangeRequest.getAsset().uri).assertEqual(asset.uri);
        expect(assetChangeRequest.getAsset().photoType).assertEqual(asset.photoType);
        expect(assetChangeRequest.getAsset().displayName).assertEqual(asset.displayName);
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_ASSET_CHANGE_REQUEST_0100
     * @tc.name      : get_asset_change_request_001
     * @tc.desc      : get asset before/after applyChanges
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('get_asset_change_request_001', 2, async (done: Function) => {
      let testNum = 'get_asset_change_request_001';
      try {
        let photoType = photoAccessHelper.PhotoType.IMAGE;
        let extension = 'jpg';
        let assetChangeRequest = photoAccessHelper.MediaAssetChangeRequest.createAssetRequest(testContext, photoType, extension);
        expect(assetChangeRequest.getAsset()).assertEqual(null);

        assetChangeRequest.addResource(photoAccessHelper.ResourceType.IMAGE_RESOURCE, new ArrayBuffer(1000));
        await helper.applyChanges(assetChangeRequest);
        let asset = assetChangeRequest.getAsset();
        if (asset === null || asset === undefined || !asset.uri.match('file://media/Photo')) {
          console.error(`${testNum} failed to get asset after applyChanges`);
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}