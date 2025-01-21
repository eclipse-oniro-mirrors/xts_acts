/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, it, expect } from 'deccjsunit/index'
import {
  photoKeys,
  fetchOption,
  getFileAsset,
  getAssetId,
  photoType
} from '../../../../../../../common'

export default function checkAttrTest () {
  describe('checkAttrTest', function () {
    async function checkAssetAttr (done, testNum, displayName, mediaType) {
      try {
        let key = photoKeys.DISPLAY_NAME;
        const fetchOps = fetchOption(testNum, key, displayName);
        const asset = await getFileAsset(testNum, fetchOps);
        console.info(`${testNum} uri: ${asset.uri} filetype: ${asset.photoType} displayName: ${asset.displayName}`)
        const id = getAssetId(asset.uri);
        const expectUri = 'file://media/Photo/' + id;
        const isIncludes = asset.uri.includes(expectUri);
        expect(isIncludes).assertTrue();
        expect(asset.photoType).assertEqual(mediaType);
        expect(asset.displayName).assertEqual(displayName);
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        done();
        expect(false).assertTrue();
      }
    }
    
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_CHECK_ASSET_ATTR_0000
     * @tc.name      : photoAsset_000
     * @tc.desc      : check image uri displayName photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_000', 0, async function (done) {
      const testNum = 'photoAsset_000';
      const displayName = '01.jpg';
      const mediaType = photoType.IMAGE;
      await checkAssetAttr(done, testNum, displayName, mediaType);
    });

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_FILE_ASSET_CHECK_ASSET_ATTR_0100
     * @tc.name      : photoAsset_001
     * @tc.desc      : check video uri displayName photoType
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('photoAsset_001', 0, async function (done) {
      const testNum = 'photoAsset_001';
      const displayName = '01.mp4';
      const mediaType = photoType.VIDEO;
      await checkAssetAttr(done, testNum, displayName, mediaType);
    });
  })
}
