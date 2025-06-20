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
import { getPermission,driveFn,sleep } from '../common';

export default function releaseTest () {
  describe('releaseTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.number    : SUB_PHOTOACCESS_HELPER_CALLBACK_RELEASE_0000
     * @tc.name      : release_callback_000
     * @tc.desc      : release photoAccessHelper instance
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('release_callback_000', 0, async (done: Function) => {
      const testNum = 'release_callback_000'
      try {
        let helper = photoAccessHelper.getPhotoAccessHelper(testContext)
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
    it('release_promise_000', 0, async (done: Function) => {
      const testNum = 'release_promise_000'
      try {
        let helper = photoAccessHelper.getPhotoAccessHelper(testContext)
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
