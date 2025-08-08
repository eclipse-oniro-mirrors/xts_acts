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
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0100
     * @tc.name      : testSharedLibraryRes
     * @tc.desc      : Import Shared Library
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSharedLibraryRes', 0, () => {
      let shareLibraryRes: String = '';
      let a = add(2, 3);
      if (a == 5) {
        shareLibraryRes = "success";
        console.log("ModuleTest shared library test success");
      }
      expect(shareLibraryRes).assertEqual('success');
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0200
     * @tc.name      : testStaticLibraryRes
     * @tc.desc      : Import Static Library
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticLibraryRes', 0, () => {
      let staticLibraryRes: String = '';
      let a = harAdd(2, 3);
      if (a == 5) {
        staticLibraryRes = "success";
        console.log("ModuleTest static library test success");
      }
      expect(staticLibraryRes).assertEqual('success');
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0300
     * @tc.name      : testRelativePathRes
     * @tc.desc      : Import Relative Path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRelativePathRes', 0, () => {
      let relativePathRes: String = '';
      let a = testAdd(2, 3);
      if (a == 5) {
        relativePathRes = "success";
        console.log("ModuleTest RelativePath test success");
      }
      expect(relativePathRes).assertEqual('success');
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0400
     * @tc.name      : testOhosRes
     * @tc.desc      : Import System Native Module
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testOhosRes', 0, () => {
      let ohosRes: String = '';
      if (typeof hilog.info != undefined) {
        ohosRes = "success";
        hilog.info(0x0000, "ModuleTest", 'dexter log: call')
      }
      expect(ohosRes).assertEqual('success');
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0500
     * @tc.name      : testSystemRes
     * @tc.desc      : Import Native Module
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSystemRes', 0, () => {
      let systemRes: String = '';
      if (systemApp.getInfo != undefined) {
        systemRes = 'success';
        console.log('ModuleTest @system.app test success');
      }
      expect(systemRes).assertEqual('success');
    })
    
    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0600
     * @tc.name      : testNapiRes
     * @tc.desc      : Import Hap's Native Module
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNapiRes', 0, () => {
      let napiRes: String = '';
      let a = napiAdd(2, 3);
      if (a == 5) {
        napiRes = 'success';
        console.log('ModuleTest Napi test success');
      }
      expect(napiRes).assertEqual('success');
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0700
     * @tc.name      : testOhpmImportOhpm
     * @tc.desc      : Ohpm Import Ohpm
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testOhpmImportOhpm', 0, () => {
      let ohpmImportOhpm: String = '';
      if (BigNumber) {
        ohpmImportOhpm = 'success';
        console.log('ModuleTest Ohpm import Ohpm success');
      }
      expect(ohpmImportOhpm).assertEqual('success');
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_StaticImport_0900
     * @tc.name      : testImportJson
     * @tc.desc      : Import Json File
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImportJson', 0, () => {
      let importJson: String = '';
      if (myJson.name == "importJson") {
        importJson = 'success';
        console.log('ModuleTest import json success');
      }
      expect(importJson).assertEqual('success');
    })
  })
}