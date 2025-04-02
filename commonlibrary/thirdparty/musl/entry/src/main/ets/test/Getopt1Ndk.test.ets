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
import { beforeEach, describe, expect, it } from '@ohos/hypium'
import Utils from './Utils'
import getopt from 'libgetopt1ndk.so'
import fs from '@ohos.file.fs';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default function muslGetopt1NdkTest() {
  describe('MuslGetopt1Test', () => {

    beforeEach(async () => {
      await Utils.sleep(50)
    })

    /**getopt
     * @tc.number   : SUB_THIRDPARTY_MUSL_GETOPT_GETOPT_LONG_0200
     * @tc.name     : testMuslGetoptGetoptLong002
     * @tc.desc     : test getopt_long
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslGetoptGetoptLong002', 0, async (done: Function) => {
      let result: number = getopt.getoptLong(-1);
      expect(result).assertEqual(-1)
      done()
    });

    /**getopt
     * @tc.number   : SUB_THIRDPARTY_MUSL_GETOPY_GETOPTLONG_ONLY_0200
     * @tc.name     : testMuslGetoptGetoptLongOnly002
     * @tc.desc     : test getopt_long_only
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslGetoptGetoptLongOnly002', 0, async (done: Function) => {
      let result: number = getopt.getoptLongOnly(-1);
      expect(result).assertEqual(-1)
      done()
    });

  })
}
