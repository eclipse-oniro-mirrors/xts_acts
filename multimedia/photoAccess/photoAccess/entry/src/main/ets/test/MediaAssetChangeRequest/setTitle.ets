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
import { photoKeys, fetchOption } from '../../../../../../../common'

export default function setTitleChangeRequestTest() {
  describe('setTitleChangeRequestTest', function () {
    let context = globalThis.abilityContext;
    let helper = photoAccessHelper.getPhotoAccessHelper(context);

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_SET_TITLE_CHANGE_REQUEST_0000
     * @tc.name      : set_title_change_request_000
     * @tc.desc      : change asset title
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('set_title_change_request_000', 0, async function (done) {
      let testNum = 'set_title_change_request_000';
      try {
        let asset = await helper.createAsset('title.jpg');
        let fd = await asset.open('rw');
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
  })
}