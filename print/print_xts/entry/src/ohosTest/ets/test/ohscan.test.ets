/*
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

import { describe, expect, it, Level } from '@ohos/hypium'
import entry from 'libentry.so'

export default function oHScannerServicesInterfaceTest() {
  describe('oHScannerServicesInterfaceTest', () => {
    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0100
     * @tc.name       : testOHScan001
     * @tc.desc       : test oHScanInit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan001', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanInit();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0200
     * @tc.name       : testOHScan002
     * @tc.desc       : test oHScanStartScannerDiscovery
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan002', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanStartScannerDiscovery();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0300
     * @tc.name       : testOHScan003
     * @tc.desc       : test oHScanOpenScanner
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan003', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanOpenScanner();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0400
     * @tc.name       : testOHScan004
     * @tc.desc       : test oHScanCloseScanner
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan004', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanCloseScanner();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0500
     * @tc.name       : testOHScan005
     * @tc.desc       : test oHScanGetScannerParameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan005', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanGetScannerParameter();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0600
     * @tc.name       : testOHScan006
     * @tc.desc       : test oHScanSetScannerParameter
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan006', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanSetScannerParameter();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0700
     * @tc.name       : testOHScan007
     * @tc.desc       : test oHScanStartScan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan007', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanStartScan();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0800
     * @tc.name       : testOHScan008
     * @tc.desc       : test oHScanCancelScan
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan008', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanCancelScan();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_0900
     * @tc.name       : testOHScan009
     * @tc.desc       : test oHScanGetPictureScanProgress
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan009', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanGetPictureScanProgress();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number     : SUB_PRINT_FWK_OH_SCAN_TEST_1000
     * @tc.name       : testOHScan010
     * @tc.desc       : test oHScanExit
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHScan010', Level.LEVEL1, async () => {
      let result: number = await entry.oHScanExit();
      expect(result).assertEqual(0);
    });
  })
}