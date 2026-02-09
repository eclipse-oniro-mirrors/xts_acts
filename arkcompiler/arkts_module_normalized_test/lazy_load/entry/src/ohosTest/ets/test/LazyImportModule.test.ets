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
     * @tc.name   testLazyImportSupportHap
     * @tc.number SUB_Runtime_Language_Lazy_Import_0001
     * @tc.desc   lazy import loading-local project hap-supported variable/func/class/so
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLazyImportSupportHap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportHap()).assertEqual("success");
    })
    /**
     * @tc.name   testLazyImportSupportHar
     * @tc.number SUB_Runtime_Language_Lazy_Import_0002
     * @tc.desc   lazy import har variable/func/class/so
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLazyImportSupportHar', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportHar()).assertEqual("success");
    })
    /**
     * @tc.name   testLazyImportSupportHsp
     * @tc.number SUB_Runtime_Language_Lazy_Import_0003
     * @tc.desc   lazy import hsp variable/func/class/so
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLazyImportSupportHsp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportHsp()).assertEqual("success");
    })
    /**
     * @tc.name   testLazyImportSupportWorker
     * @tc.number SUB_Runtime_Language_Lazy_Import_0004
     * @tc.desc   lazy import worker syntax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLazyImportSupportWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportWorker()).assertEqual("success");
    })
    /**
     * @tc.name   testLazyImportSupportSendable
     * @tc.number SUB_Runtime_Language_Lazy_Import_0005
     * @tc.desc   lazy import sendable func/class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLazyImportSupportSendable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportSendable()).assertEqual("success");
    })
    /**
     * @tc.name   testLazyImportSupportSharedModule
     * @tc.number SUB_Runtime_Language_Lazy_Import_0006
     * @tc.desc   lazy import sharedModule variable/func/class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLazyImportSupportSharedModule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      expect(lazyImportSupportSharedModule()).assertEqual("success");
    })
    /**
     * @tc.name   testLazyImportSupportDynamicImport
     * @tc.number SUB_Runtime_Language_Lazy_Import_0007
     * @tc.desc   lazy import in dynamic import
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testLazyImportSupportDynamicImport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      expect(await lazyImportSupportDynamicImport()).assertEqual("success");
    })
  })
}