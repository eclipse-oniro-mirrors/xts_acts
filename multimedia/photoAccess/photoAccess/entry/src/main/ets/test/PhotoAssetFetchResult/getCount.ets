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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import {
  fetchOption,
  photoType,
  photoKeys
} from '../../../../../../../common'

export default function assetGetCountTest () {
  describe('assetGetCountTest', function () {
    const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)

    async function getCountCallbackTest (done, testNum, fetchOps) {
      try {
        let fetchResult = await helper.getAssets(fetchOps);
        expect(fetchResult.getCount() > 0).assertTrue();
        fetchResult.close();
        done();
      } catch (error) {
        console.info(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    }
    
    //image
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_0000
     * @tc.name      : getCount_callback_000
     * @tc.desc      : getCount image
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getCount_callback_000', 0, async function (done) {
      const testNum = 'getCount_callback_000';
      const fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.IMAGE);
      await getCountCallbackTest(done, testNum, fetchOps);
    });
    
    //video
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_GET_COUNT_0100
     * @tc.name      : getCount_callback_001
     * @tc.desc      : getCount video
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getCount_callback_001', 0, async function (done) {
      const testNum = 'getCount_callback_001';
      const fetchOps = fetchOption(testNum, photoKeys.PHOTO_TYPE, photoType.VIDEO);
      await getCountCallbackTest(done, testNum, fetchOps);
    });
  })
}
