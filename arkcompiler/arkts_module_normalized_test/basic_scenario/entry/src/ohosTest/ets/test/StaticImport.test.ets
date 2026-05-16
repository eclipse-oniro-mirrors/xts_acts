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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { add } from 'library';
import { add as harAdd } from 'har';
import { add as testAdd } from './test'
import hilog from '@ohos.hilog';
import systemApp from '@system.app';
import { add as napiAdd } from 'libentry.so';
import BigNumber from 'json-bigint';
import myJson from './1.json';

export default function staticImport() {
  describe('staticImportTest', () => {
    /**
     * @tc.name   testSharedLibraryRes
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0100
     * @tc.desc   Import Shared Library
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSharedLibraryRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let shareLibraryRes: String = '';
      let a = add(2, 3);
      if (a == 5) {
        shareLibraryRes = "success";
        console.log("ModuleTest shared library test success");
      }
      expect(shareLibraryRes).assertEqual('success');
    })

    /**
     * @tc.name   testStaticLibraryRes
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0200
     * @tc.desc   Import Static Library
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testStaticLibraryRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let staticLibraryRes: String = '';
      let a = harAdd(2, 3);
      if (a == 5) {
        staticLibraryRes = "success";
        console.log("ModuleTest static library test success");
      }
      expect(staticLibraryRes).assertEqual('success');
    })

    /**
     * @tc.name   testRelativePathRes
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0300
     * @tc.desc   Import Relative Path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRelativePathRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let relativePathRes: String = '';
      let a = testAdd(2, 3);
      if (a == 5) {
        relativePathRes = "success";
        console.log("ModuleTest RelativePath test success");
      }
      expect(relativePathRes).assertEqual('success');
    })

    /**
     * @tc.name   testOhosRes
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0400
     * @tc.desc   Import System Native Module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhosRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let ohosRes: String = '';
      if (typeof hilog.info != undefined) {
        ohosRes = "success";
        hilog.info(0x0000, "ModuleTest", 'dexter log: call')
      }
      expect(ohosRes).assertEqual('success');
    })

    /**
     * @tc.name   testSystemRes
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0500
     * @tc.desc   Import Native Module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSystemRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let systemRes: String = '';
      if (systemApp.getInfo != undefined) {
        systemRes = 'success';
        console.log('ModuleTest @system.app test success');
      }
      expect(systemRes).assertEqual('success');
    })
    
    /**
     * @tc.name   testNapiRes
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0600
     * @tc.desc   Import Hap's Native Module
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let napiRes: String = '';
      let a = napiAdd(2, 3);
      if (a == 5) {
        napiRes = 'success';
        console.log('ModuleTest Napi test success');
      }
      expect(napiRes).assertEqual('success');
    })

    /**
     * @tc.name   testOhpmImportOhpm
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0700
     * @tc.desc   Ohpm Import Ohpm
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhpmImportOhpm', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let ohpmImportOhpm: String = '';
      if (BigNumber) {
        ohpmImportOhpm = 'success';
        console.log('ModuleTest Ohpm import Ohpm success');
      }
      expect(ohpmImportOhpm).assertEqual('success');
    })

    /**
     * @tc.name   testImportJson
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0900
     * @tc.desc   Import Json File
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImportJson', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let importJson: String = '';
      if (myJson.name == "importJson") {
        importJson = 'success';
        console.log('ModuleTest import json success');
      }
      expect(importJson).assertEqual('success');
    })
  })
}