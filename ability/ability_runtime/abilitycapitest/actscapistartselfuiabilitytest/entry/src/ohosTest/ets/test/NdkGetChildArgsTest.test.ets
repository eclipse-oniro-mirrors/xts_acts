/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import testNapi from 'libentry.so';

export default function ndkTest() {
  describe('ActsNdkGetChildArgsTest', () => {
    beforeAll(() => {})
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})
    
    
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetCurrentChildProcess_0100
     * @tc.number SUB_Ability_AbilityRuntime_GetCurrentChildProcess_0100
     * @tc.desc   To verify use OH_Ability_CreateNativeChildProcess in childprocess.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetCurrentChildProcess_0100', Level.LEVEL3, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0100`;
      console.log(`${tag}, it begin`);
      let ret : Number = testNapi.startNativeChildProcess_0100();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      if (ret == 801 || ret == 16010004){
        done();
        return;
      }
      expect(0).assertEqual(ret);
      done();
    })

    /**
     * @tc.name   SUB_Ability_AbilityRuntime_GetCurrentChildProcess_0700
     * @tc.number SUB_Ability_AbilityRuntime_GetCurrentChildProcess_0700
     * @tc.desc   To verify use OH_Ability_CreateNativeChildProcess in MainThread return nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Ability_AbilityRuntime_GetCurrentChildProcess_0700', Level.LEVEL3, async (done: Function) => {
      let tag = `ACTS_NativeStartChildProcess_0100`;
      console.log(`${tag}, it begin`);
      let ret : Number = testNapi.startNativeChildProcess_0700();
      hilog.info(0x0000, tag, '%{public}s', ` ${tag} execute result:` + ret);
      expect(0).assertEqual(ret);
      done();
    })
  })
}