/**
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
 
import { describe, it, expect } from '@ohos/hypium';
import { inderectHarImportHar, inderectHarImportHsp, inderectHspImportHar,
  inderectHspImportHsp } from '../../../main/ets/Calc';

export default function indirectImport() {
  describe('ActIndirectImport', () => {

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_indirectImport_0001
     * @tc.name      : harImportHar
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('harImportHar', 0, async () => {
      let res = await inderectHarImportHar()
      expect(res).assertTrue()
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_indirectImport_0002
     * @tc.name      : harImportHsp
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('harImportHsp', 0, async () => {
      let res = await inderectHarImportHsp()
      expect(res).assertTrue()
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_indirectImport_0003
     * @tc.name      : hspImportHar
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('hspImportHar', 0, async () => {
      let res = await inderectHspImportHar()
      expect(res).assertTrue()
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_indirectImport_0004
     * @tc.name      : hspImportHsp
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('hspImportHsp', 0, async () => {
      let res = await inderectHspImportHsp()
      expect(res).assertTrue()
    })

  })
}