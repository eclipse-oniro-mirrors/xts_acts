/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function GetLaunchWant() {
  describe('GetLaunchWant', (): void => {
    /**
     * @tc.name   testGetLaunchWantStatic
     * @tc.number testGetLaunchWant_Static_0100
     * @tc.desc   Test getLaunchWant interface to get own launch want.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetLaunchWantStatic', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "testGetLaunchWantStatic start");
      try {
        let want = bundleManager.getLaunchWant();
        hilog.info(domain, tag, `testGetLaunchWantStatic successfully bundleName:${want.bundleName} abilityName:${want.abilityName}`);
        expect(want.abilityName).assertEqual('EntryAbility');
        expect(want.bundleName).assertEqual('ohos.acts.bundle.test.static');
        done();
      } catch (err) {
 	      err = err as BusinessError;
        hilog.error(domain, tag, `testGetLaunchWantStatic catch failed errCode:${err.code} message:${err.message}`);
        expect().assertFail();
        done();
      }
    });


  })
}