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
import If from 'libifndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import fs from '@ohos.file.fs'

export default function muslIfNdkTest() {
  describe('MuslIfTest', () => {
    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_IF_IF_FREENAMEINDEX_0100
     * @tc.name     : testMuslIf_If_Freenameindex001
     * @tc.desc     : test if_freenameindex
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslIf_If_Freenameindex001', 0, async (done: Function) => {
      let result: number = If.ifFreeNameIndex();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_IF_IF_NAMEINDEX_0100
     * @tc.name     : testMuslIf_If_Nameindex001
     * @tc.desc     : test if_nameindex
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslIf_If_Nameindex001', 0, async (done: Function) => {
      let result: number = If.ifNameIndex();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_IF_IF_INDEXTONAME_0100
     * @tc.name     : testMuslIf_If_indextoname001
     * @tc.desc     : test if_indextoname
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslIf_If_indextoname001', 0, async (done: Function) => {
      let result: number = If.ifIndexToName();
      expect(result).assertEqual(0)
      done()
    });

    /**
     * @tc.number   : SUB_THIRDPARTY_MUSL_IF_IF_NAMETOINDEX_0100
     * @tc.name     : testMuslIf_If_nametoindex001
     * @tc.desc     : test if_nametoindex
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 1
     */
    it('testMuslIf_If_nametoindex001', 0, async (done: Function) => {
      let result: number = If.ifNameToIndex();
      expect(result).assertEqual(0)
      done()
    });

  })
}