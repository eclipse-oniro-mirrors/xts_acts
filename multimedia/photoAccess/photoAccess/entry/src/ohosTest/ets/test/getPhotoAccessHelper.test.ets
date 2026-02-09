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
import { describe, beforeAll, it, expect, Level } from '@ohos/hypium'
import { getPermission, sleep, driveFn } from './common'
import common from '@ohos.app.ability.common';

export default function getPhotoAccessHelper() {
  describe('getPhotoAccessHelper', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    beforeAll(async () => {
      console.info('beforeAll case')
      await getPermission();
      await driveFn();
      await sleep(1000);
    })

    /**
     * @tc.name   getPhotoAccessHelper_000
     * @tc.number SUB_PHOTOACCESS_HELPER_GET_PHOTO_ACCESS_HELPER_0000
     * @tc.desc   Obtains a photoAccess instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPhotoAccessHelper_000', Level.LEVEL0, async (done: Function) => {
      try {
        const helper = photoAccessHelper.getPhotoAccessHelper(testContext);
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