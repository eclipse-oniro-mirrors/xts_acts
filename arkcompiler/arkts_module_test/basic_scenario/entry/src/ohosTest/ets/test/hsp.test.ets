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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { add, addtest, getDescFromLibrary2 } from 'library';
import { getModuleDescription as getDescFromLib2 ,nativeAdd  } from 'library2';
import { getModuleDescription as getDescFromLib3 } from 'library3';
import { getDecoratorDesc } from 'har';

export default function hspImport() {
  describe('HspTest', () => {
    /**
     * @tc.name   testNormalHspImport
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_Hsp_0100
     * @tc.desc   Import Basic API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNormalHspImport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let normalImport: string = '';
      let a = add(2, 3);
      if (a == 5) {
        normalImport = 'success';
        console.log('ModuleTest hsp import test success');
      }
      expect(normalImport).assertEqual('success');
    })

    /**
     * @tc.name   testMultiHsp
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_Hsp_0200
     * @tc.desc   Import Single-Level Multiple Shared Library
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiHsp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let multiHsp: string = '';
      let a = getDescFromLib2();
      let b = getDescFromLib3();
      if (a == 'This is library2' && b == 'This is library3') {
        multiHsp = 'success';
        console.log('ModuleTest multi hsp import test success');
      }
      expect(multiHsp).assertEqual('success');
    })

    /**
     * @tc.name   testMultiLevelHsp
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_Hsp_0300
     * @tc.desc   Import Multi-Level Shared Library
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiLevelHsp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let multiLevelHsp: string = '';
      let a: string = getDescFromLibrary2();
      if (a == 'This is library2') {
        multiLevelHsp = 'success';
        console.log('ModuleTest multi-level hsp import test success');
      }
      expect(multiLevelHsp).assertEqual('success');
    })

    /**
     * @tc.name   testHarImportLibrary
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_Hsp_0400
     * @tc.desc   Load Shared Library By Importing Static Library
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHarImportLibrary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let harImportLibrary: string = "";
      let a: string = getDecoratorDesc();
      if (a == '<From har>This is library') {
        harImportLibrary = 'success';
        console.log('ModuleTest harImportLibrary test success');
      }
      expect(harImportLibrary).assertEqual('success');
    })
    
    /**
     * @tc.name   testNativeso
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_Hsp_0500
     * @tc.desc   Import Native So
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeso', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nativeso: string = "";
      let a: number = addtest(3, 5);
      if (a == 8) {
        nativeso = 'success';
        console.log('ModuleTest native so test success');
      }
      expect(nativeso).assertEqual('success');
    })

    /**
     * @tc.name   testNativeIsolationSo
     * @tc.number SUB_ARKCOMPILER_ETSRUNTIME_BasicScenario_Hsp_0600
     * @tc.desc   Import Native So Isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNativeIsolationSo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let nativeIsolationSo: string = "";
      let a: number = nativeAdd(3, 5);
      if (a == 8) {
        nativeIsolationSo = 'success';
        console.log('ModuleTest native so Isolation test success');
      }
      expect(nativeIsolationSo).assertEqual('success');
    })
  })

    
}