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

import sendablePhotoAccessHelper from '@ohos.file.sendablePhotoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import { common } from '@kit.AbilityKit';
import {
  sleep,
  driveFn,
  getPermission
} from '../../util/common';

export default function releaseTest () {
  describe('releaseTest', () => {

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await sleep(10);
      await driveFn();
    });

    /**
     * @tc.name   release_promise_000
     * @tc.number Sub_Photo_Access_Sendable_Release_001
     * @tc.desc   release photoAccessHelper instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_promise_000', Level.LEVEL0, async (done: Function) => {
      const testNum = 'release_promise_000';
      try {
        let globalContext: common.UIAbilityContext = AppStorage.get('globalContext') as common.UIAbilityContext;
        let sendablePhAccessHelper: sendablePhotoAccessHelper.PhotoAccessHelper = sendablePhotoAccessHelper.getPhotoAccessHelper(globalContext);
        await sendablePhAccessHelper?.release();
        done();
      } catch (error) {
        console.error(`${testNum} failed; error: ${error}`);
        expect(false).assertTrue();
        done();
      }
    });

  })
}
