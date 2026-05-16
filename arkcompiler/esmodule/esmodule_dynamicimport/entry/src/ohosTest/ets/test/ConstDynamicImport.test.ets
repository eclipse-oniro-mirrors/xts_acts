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

import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { withinHspTest } from 'Sharelibraryhsp/src/main/ets/pages/Index';
import { withinHarTest } from 'Staticlibraryhar/src/main/ets/components/mainpage/MainPage';

export default function constDynamicImport() {
  describe('ActsAbilityTest', () => {

    /**
     * @tc.name   testImportHspName
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0001
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImportHspName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('Sharelibraryhsp')
      expect(lib.add(2, 3)).assertEqual(5)
    })

    /**
     * @tc.name   testImportHspPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0002
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImportHspPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('Sharelibraryhsp/src/main/ets/utils/Calc')
      expect(lib.add(3, 4)).assertEqual(7)
    })
    
    /**
     * @tc.name   testImportHarName
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0003
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImportHarName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('Staticlibraryhar')
      expect(lib.add(2, 3)).assertEqual(5)
    })

    /**
     * @tc.name   testImportHarPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0004
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImportHarPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
       let lib = await import('Staticlibraryhar/src/main/ets/Calc')
       expect(lib.add(3, 5)).assertEqual(8)
    })

    /**
     * @tc.name   testWithinhapImportPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0007
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWithinhapImportPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('../../../main/ets/Calc')
      expect(lib.add(3, 5)).assertEqual(8)
    })

    /**
     * @tc.name   testWithinimportHspPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0008
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWithinimportHspPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let res = await withinHspTest()
      expect(res).assertTrue()
    })

    /**
     * @tc.name   testWithinimportHarPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_ConstDynamicImport_0009
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWithinimportHarPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let res = await withinHarTest()
      expect(res).assertTrue()
    })
  })
}