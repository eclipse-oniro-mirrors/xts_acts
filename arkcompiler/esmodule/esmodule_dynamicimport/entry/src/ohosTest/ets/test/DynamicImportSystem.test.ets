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

export default function dynamicImportSystem() {
  describe('ActImportSystem', () => {

    /**
     * @tc.name   constImportApp
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0001
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constImportApp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      import ('@system.app').then((ns: ESObject) =>{console.log("constImportAppTest is successful: " + ns.default.terminate())});
    })

    /**
     * @tc.name   constImportRouter
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0002
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constImportRouter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      import ('@system.router').then((ns: ESObject) =>{console.log("constImportRouterTest is successful: " + ns.default.clear())});
    })

    /**
     * @tc.name   constImportCurves
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0003
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constImportCurves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      import ('@ohos.curves').then(ns =>{console.log("constImportCurvesTest is successful: "+ns.default.springMotion(0.555,0.75,0.001))});
    })

    /**
     * @tc.name   constImportMatrix4
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0004
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constImportMatrix4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      import ('@ohos.matrix4').then(ns =>{console.log("constImportMatrix4Test is successful"+ns.default.identity())});
    })

    /**
     * @tc.name   constImportOhos
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0005
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constImportOhos', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      import ('@ohos.hilog').then((ns: ESObject) =>{console.log("variableImportOhosTest is successful: " + ns.default.info(0x0000, 'testTag', '%{public}s', 'dynamicImport @ohos.hilog'))});
    })

    /**
     * @tc.name   constImportNative
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0006
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('constImportNative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let lib = await import('libentry.so')
      expect(lib.default.add(2,3)).assertEqual(5)
    })

    /**
     * @tc.name   variableImportApp
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0007
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('variableImportApp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let packageName = '@system.app'
      import (packageName).then((ns: ESObject) => {console.log("variableImportAppTest is successful: " + ns.default.terminate())});
    })

    /**
     * @tc.name   variableImportRouter
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0008
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('variableImportRouter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let packageName = '@system.router'
      import (packageName).then((ns: ESObject) => {console.log("variableImportRouterTest is successful: " + ns.default.clear())});
    })

    /**
     * @tc.name   variableImportCurves
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0009
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('variableImportCurves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let packageName = '@ohos.curves'
      import (packageName).then((ns: ESObject) => {console.log("variableImportCurvesTest is successful: " + ns.default.springMotion(0.555,0.75,0.001))});
    })

    /**
     * @tc.name   variableImportMatrix4
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0010
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('variableImportMatrix4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let packageName = '@ohos.matrix4'
      import (packageName).then((ns: ESObject) =>{console.log("variableImportMatrix4Test is successful: " + ns.default.identity())});
    })

    /**
     * @tc.name   variableImportOhos
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0011
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('variableImportOhos', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let packageName = '@ohos.hilog'
      import (packageName).then((ns: ESObject) =>{console.log("variableImportOhosTest is successful: " + ns.default.info(0x0000, 'testTag', '%{public}s', 'dynamicImport @ohos.hilog'))});

    })

    /**
     * @tc.name   variableImportNative
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0012
     * @tc.desc   add name of task for taskpool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('variableImportNative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let packageName = 'libentry.so'
      let lib: ESObject = await import(packageName)
      expect(lib.default.add(2,3)).assertEqual(5)
    })
  })
}