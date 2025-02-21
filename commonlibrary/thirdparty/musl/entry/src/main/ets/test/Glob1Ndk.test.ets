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
import { describe, expect, it } from '@ohos/hypium'
import glob from 'libglob1ndk.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function muslGlobd1NdkTest() {
  describe('MuslGlobd1Test', () => {

    /**getopt
     * @tc.number   : SUB_THIRDPARTY_MUSL_GLOB_GLOB_0200
     * @tc.name     : testMuslGlobGlob002
     * @tc.desc     : test glob
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslGloGlob002', 0, async (done: Function) => {
      let result: number = glob.glob();
      expect(result).assertEqual(-1)
      done()
    });
  })
}
