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

export default function dynamicImportSystem() {
  describe('ActImportSystem', () => {

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0001
     * @tc.name      : constImportApp
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('constImportApp', 0, async () => {
      import ('@system.app').then((ns: ESObject) =>{console.log("constImportAppTest is successful: " + ns.default.terminate())});
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0002
     * @tc.name      : constImportRouter
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('constImportRouter', 0, () => {
      import ('@system.router').then((ns: ESObject) =>{console.log("constImportRouterTest is successful: " + ns.default.clear())});
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0003
     * @tc.name      : constImportCurve
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('constImportCurves', 0, () => {
      import ('@ohos.curves').then(ns =>{console.log("constImportCurvesTest is successful: "+ns.default.springMotion(0.555,0.75,0.001))});
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0004
     * @tc.name      : constImportMatrix4
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('constImportMatrix4', 0, () => {
      import ('@ohos.matrix4').then(ns =>{console.log("constImportMatrix4Test is successful"+ns.default.identity())});
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0005
     * @tc.name      : constImportOhos
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('constImportOhos', 0, async () => {
      import ('@ohos.hilog').then((ns: ESObject) =>{console.log("variableImportOhosTest is successful: " + ns.default.info(0x0000, 'testTag', '%{public}s', 'dynamicImport @ohos.hilog'))});
    })

     /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0006
     * @tc.name      : constImportNative
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('constImportNative', 0, async () => {
      let lib = await import('libentry.so')
      expect(lib.default.add(2,3)).assertEqual(5)
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0007
     * @tc.name      : variableImportApp
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableImportApp', 0, () => {
      let packageName = '@system.app'
      import (packageName).then((ns: ESObject) => {console.log("variableImportAppTest is successful: " + ns.default.terminate())});
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0008
     * @tc.name      : variableImportRouter
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableImportRouter', 0, () => {
      let packageName = '@system.router'
      import (packageName).then((ns: ESObject) => {console.log("variableImportRouterTest is successful: " + ns.default.clear())});
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0009
     * @tc.name      : variableImportCurves
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableImportCurves', 0, () => {
      let packageName = '@ohos.curves'
      import (packageName).then((ns: ESObject) => {console.log("variableImportCurvesTest is successful: " + ns.default.springMotion(0.555,0.75,0.001))});
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0010
     * @tc.name      : variableImportMatrix4
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableImportMatrix4', 0, () => {
      let packageName = '@ohos.matrix4'
      import (packageName).then((ns: ESObject) =>{console.log("variableImportMatrix4Test is successful: " + ns.default.identity())});
    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0011
     * @tc.name      : variableImportOhos
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableImportOhos', 0, async () => {
      let packageName = '@ohos.hilog'
      import (packageName).then((ns: ESObject) =>{console.log("variableImportOhosTest is successful: " + ns.default.info(0x0000, 'testTag', '%{public}s', 'dynamicImport @ohos.hilog'))});

    })

    /**
     * @tc.number    : SUB_COMMONLIBRARY_ETSUTILS_DynamicImportSystem_0012
     * @tc.name      : variableImportNative
     * @tc.desc      : add name of task for taskpool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
    */
    it('variableImportNative', 0, async () => {
      let packageName = 'libentry.so'
      let lib: ESObject = await import(packageName)
      expect(lib.default.add(2,3)).assertEqual(5)
    })
  })
}