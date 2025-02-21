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
import { getPermission } from '../../../../../../common'

export default function getPhotoAccessHelper () {
  describe('getPhotoAccessHelper', function () {
    beforeAll(async function () {
      console.info('beforeAll case')
      await getPermission();
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0000
     * @tc.name      : getPhotoAccessHelper_000
     * @tc.desc      : Obtains a photoAccess instance
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('getPhotoAccessHelper_000', 0, async function (done) {
      try {
        const helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext);
        expect(helper !== undefined).assertTrue();
        done();
      } catch (error) {
        console.info(`getPhotoAccessHelper_000 failed, error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}
