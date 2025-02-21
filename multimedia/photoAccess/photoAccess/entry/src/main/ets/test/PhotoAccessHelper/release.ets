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

export default function releaseTest () {
  describe('releaseTest', function () {
    

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_RELEASE_0000
     * @tc.name      : release_callback_000
     * @tc.desc      : release photoAccessHelper instance
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_callback_000', 0, async function (done) {
      const testNum = 'release_callback_000'
      try {
        let helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
        await helper.release((err) => {
          if (err !== undefined) {
            console.info(`${testNum} err: ${err}`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue()
        done();
      }
    })

    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_PROMISE_RELEASE_0000
     * @tc.name      : release_promise_000
     * @tc.desc      : release photoAccessHelper instance
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_promise_000', 0, async function (done) {
      const testNum = 'release_promise_000'
      try {
        let helper = photoAccessHelper.getPhotoAccessHelper(globalThis.abilityContext)
        await helper.release()
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue()
        done();
      }
    })    
  })
}
