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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function dynamicImport() {

  describe('dynamicImportTest', () => {
    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_DynamicImport_0100
     * @tc.name      : testSharedLibraryRes
     * @tc.desc      : Import Shared Library
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSharedLibraryRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res: String = '';
      import('library').then(m => {
        try {
          if (m.add(2, 3) == 5) {
            res = 'success';
            console.error("ModuleTest: successfully load shared library");
          }
        } catch (e) {
          console.error("ModuleTest: shared library test failed");
          console.error("ModuleTest: error", e.toString());
        }
        expect(res).assertEqual('success');
      })
    })
    
    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_DynamicImport_0200
     * @tc.name      : testStaticLibraryRes
     * @tc.desc      : Import Static Library
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testStaticLibraryRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res: String = '';
      import('har').then(m => {
        try {
          if (m.add(2, 3) == 5) {
            res = 'success';
            console.error("ModuleTest: successfully load static library");
          }
        } catch (e) {
          console.error("ModuleTest: static library test failed");
          console.error("ModuleTest: error", e.toString());
        }
        expect(res).assertEqual('success');
      })
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_DynamicImport_0300
     * @tc.name      : testRelativePathRes
     * @tc.desc      : Import Relative Path
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testRelativePathRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res: String = '';
      import('./test').then(m => {
        try {
          if (m.add(2, 3) == 5) {
            res = 'success';
            console.error("ModuleTest: successfully load relative path file");
          }
        } catch (e) {
          console.error("ModuleTest: relative path file test failed");
          console.error("ModuleTest: error", e.toString());
        }
        expect(res).assertEqual('success');
      })
    })
    
    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_DynamicImport_0400
     * @tc.name      : testSystemInternal
     * @tc.desc      : Import System Native Module
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSystemInternal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res: String = '';
      import('@ohos.hilog').then(m => {
        try {
          m.default.info(0x0000, "testTag", "dexter log: call ohos.hilog");
          res = 'success';
          console.error("ModuleTest: successfully load ohos hilog");
        } catch (e) {
          console.error("ModuleTest: ohos hilog test failed");
          console.error("ModuleTest: error", e.toString());
        }
        expect(res).assertEqual('success');
      })
    })

     /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_DynamicImport_0500
     * @tc.name      : testSystemRes
     * @tc.desc      : Import Native Module
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testSystemRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res: String = '';
      import('@system.app').then(m => {
        try {
          if (m.default.getInfo != undefined) {
            res = 'success';
            console.error("ModuleTest: successfully load system.app");
          }
        } catch (e) {
          console.error("ModuleTest: system.app test failed");
          console.error("ModuleTest: error", e.toString());
        }
        expect(res).assertEqual('success');
      })
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_DynamicImport_0600
     * @tc.name      : testNapiRes
     * @tc.desc      : Import Hap's Native Module
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNapiRes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res: String = '';
      import('libentry.so').then(m => {
        try {
          if (m.default.add(2, 3) == 5) {
            res = 'success';
            console.error("ModuleTest: successfully load libentry.so");
          }
        } catch (e) {
          console.error("ModuleTest: App Napi test failed");
          console.error("ModuleTest: error", e.toString());
        }
        expect(res).assertEqual('success');
      })
    })

    /**
     * @tc.number    : SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_DynamicImport_0700
     * @tc.name      : testImportJson
     * @tc.desc      : Import Json File
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testImportJson', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let res: String = '';
      import('./1.json').then(m => {
        try {
          if (m.default.name == "importJson") {
            res = 'success';
            console.error("ModuleTest: successfully import json file");
          }
        } catch (e) {
          console.error("ModuleTest: import json file test failed");
          console.error("ModuleTest: error", e.toString());
        }
        expect(res).assertEqual('success');
      })
    })
  })
}