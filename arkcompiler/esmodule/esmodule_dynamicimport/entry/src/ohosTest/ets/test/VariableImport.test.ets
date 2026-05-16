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
 
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { varibleWithinHsp } from 'Sharelibraryhsp/src/main/ets/pages/Index';
import { varibleWithinHarPath} from 'Staticlibraryhar/src/main/ets/components/mainpage/MainPage';
import { varibleWithinHap } from '../../../main/ets/pages/Index';

export default function variableImport() {
  describe('ActVariableImport', () => {

    /**
     * @tc.name   testVariableHspName
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_variableImport_0001
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVariableHspName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let packageName = 'Sharelibraryhsp'
      let lib: ESObject= await import(packageName)
      expect(lib.add(2,3)).assertEqual(5)
      console.info("-------------variableHspName-------------")
    })

    /**
     * @tc.name   testVariableHarName
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_variableImport_0002
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVariableHarName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let packageName = 'Staticlibraryhar'
      let lib: ESObject= await import(packageName)
      expect(lib.add(2,3)).assertEqual(5)
      console.info("-------------variableHarName-------------")
    })

    /**
     * @tc.name   testVaribleWithinHspPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_variableImport_0005
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVaribleWithinHspPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let res = await varibleWithinHsp()
      expect(res).assertTrue()
      console.info("-------------varibleWithinHspPath-------------")
    })

    /**
     * @tc.name   testVaribleWithinHapPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_variableImport_0006
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVaribleWithinHapPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let res = await varibleWithinHap()
      expect(res).assertTrue()
      console.info("-------------varibleWithinHapPath-------------")
    })

    /**
     * @tc.name   testVaribleWithinHarPath
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_variableImport_0007
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testVaribleWithinHarPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let res = await varibleWithinHarPath()
      expect(res).assertTrue()
      console.info("-------------varibleWithinHarPath-------------")
    })
  })
}