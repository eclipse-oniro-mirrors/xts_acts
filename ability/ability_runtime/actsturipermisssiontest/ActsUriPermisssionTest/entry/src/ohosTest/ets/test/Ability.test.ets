/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /*
     * @tc.number: Acts_UriPermisssion_0100
     * @tc.name: UriPermission on demand start and stop
     * @tc.desc: UriPermission on demand start and stop
     * @tc.level:1
     */
    it('Acts_UriPermisssion_0100', Level.LEVEL0, async (done: Function) => {
      console.log('Acts_UriPermisssion_0100 start.');
      await abilityDelegator.executeShellCommand("hilog -x | grep UriPermissionManagerService")
        .then((data) => {
          console.log("executeShellCommand Acts_UriPermisssion_0100 : data : " + data.stdResult);
          let i = JSON.stringify(data.stdResult).indexOf('UriPermissionManagerService start');
          expect(i).assertEqual(-1);
          done();
        })
        .catch((error: BusinessError) => {
          console.log("executeShellCommand Acts_UriPermisssion_0100 error : " + JSON.stringify(error));
          expect().assertFail();
          done();
        })
      console.log('Acts_UriPermisssion_0100 end.');
    })
  })
}