/**
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

import {
  lazyImportSupportHap,
  lazyImportSupportHar,
  lazyImportSupportHsp,
  lazyImportSupportWorker,
  lazyImportSupportSendable,
  lazyImportSupportSharedModule,
  lazyImportSupportDynamicImport
} from "../utils/lazyImport/LazyImportSupport"


export default function lazyImportModuleTest() {
  describe('LazyImportModuleTest', () => {
    /**
     * @tc.number: SUB_Runtime_Language_Lazy_Import_0001
     * @tc.name: testLazyImportSupportHap
     * @tc.desc: lazy import loading-local project hap-supported variable/func/class/so
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportSupportHap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportHap()).assertEqual("success");
    })
    /**
     * @tc.number: SUB_Runtime_Language_Lazy_Import_0002
     * @tc.name: testLazyImportSupportHar
     * @tc.desc: lazy import har variable/func/class/so
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportSupportHar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportHar()).assertEqual("success");
    })
    /**
     * @tc.number: SUB_Runtime_Language_Lazy_Import_0003
     * @tc.name: testLazyImportSupportHsp
     * @tc.desc: lazy import hsp variable/func/class/so
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportSupportHsp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportHsp()).assertEqual("success");
    })
    /**
     * @tc.number: SUB_Runtime_Language_Lazy_Import_0004
     * @tc.name: testLazyImportSupportWorker
     * @tc.desc: lazy import worker syntax
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportSupportWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportWorker()).assertEqual("success");
    })
    /**
     * @tc.number: SUB_Runtime_Language_Lazy_Import_0005
     * @tc.name: testLazyImportSupportSendable
     * @tc.desc: lazy import sendable func/class
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportSupportSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportSendable()).assertEqual("success");
    })
    /**
     * @tc.number: SUB_Runtime_Language_Lazy_Import_0006
     * @tc.name: testLazyImportSupportSharedModule
     * @tc.desc: lazy import sharedModule variable/func/class
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportSupportSharedModule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportSharedModule()).assertEqual("success");
    })
    /**
     * @tc.number: SUB_Runtime_Language_Lazy_Import_0007
     * @tc.name: testLazyImportSupportDynamicImport
     * @tc.desc: lazy import in dynamic import
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('testLazyImportSupportDynamicImport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(await lazyImportSupportDynamicImport()).assertEqual("success");
    })
  })
}