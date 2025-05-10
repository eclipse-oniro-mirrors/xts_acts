/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { withinHspTest } from 'Sharelibraryhsp/src/main/ets/pages/Index';
import { withinHarTest } from 'Staticlibraryhar/src/main/ets/components/mainpage/MainPage';

export default function constDynamicImport() {
  describe('ActsAbilityTest', () => {

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0001
     * @tc.name      : testImportHspName
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('testImportHspName', 0, async () => {
      let lib = await import('Sharelibraryhsp')
      expect(lib.add(2, 3)).assertEqual(5)
    })

     /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0002
     * @tc.name      : testImportHspPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('testImportHspPath', 0, async () => {
      let lib = await import('Sharelibraryhsp/src/main/ets/utils/Calc')
      expect(lib.add(3, 4)).assertEqual(7)
    })
    
    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0003
     * @tc.name      : testImportHarName
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('testImportHarName', 0, async () => {
      let lib = await import('Staticlibraryhar')
      expect(lib.add(2, 3)).assertEqual(5)
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0004
     * @tc.name      : testImportHarPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('testImportHarPath', 0, async () => {
       let lib = await import('Staticlibraryhar/src/main/ets/Calc')
       expect(lib.add(3, 5)).assertEqual(8)
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0007
     * @tc.name      : testWithinhapImportPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('testWithinhapImportPath', 0, async () => {
      let lib = await import('../../../main/ets/Calc')
      expect(lib.add(3, 5)).assertEqual(8)
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0008
     * @tc.name      : testWithinimportHspPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('testWithinimportHspPath', 0, async () => {
      let res = await withinHspTest()
      expect(res).assertTrue()
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0009
     * @tc.name      : testWithinimportHarPath
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('testWithinimportHarPath', 0, async () => {
      let res = await withinHarTest()
      expect(res).assertTrue()
    })
  })
}