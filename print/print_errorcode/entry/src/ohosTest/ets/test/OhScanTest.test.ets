/*
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

import { describe, it, expect, Level } from '@ohos/hypium'
import printerror from 'libprinterrorcode.so'
const ERR_OK = 0;

export default function ActsScanErrorTest() {
  describe('ActsScanErrorTest', () => {
    /**
     * @tc.name   SUB_Oh_Scan_NoError_0100
     * @tc.number SUB_Oh_Scan_NoError_0100
     * @tc.desc   Test OHScanNoError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_NoError_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_NoError_0100 start====");
        let result = printerror.OHScanNoError();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_NoError_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_NoError_0100 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_InvalidParameter_0200
     * @tc.number SUB_Oh_Scan_InvalidParameter_0200
     * @tc.desc   Test OHScanInvalidParameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_InvalidParameter_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_InvalidParameter_0200 start====");
        let result = printerror.OHScanInvalidParameter();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_InvalidParameter_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_InvalidParameter_0200 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_UnSupported_0300
     * @tc.number SUB_Oh_Scan_UnSupported_0300
     * @tc.desc   Test OHScanUnSupported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_UnSupported_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_UnSupported_0300 start====");
        let result = printerror.OHScanUnSupported();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_UnSupported_0300 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_UnSupported_0300 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_OHScanInit1_0500
     * @tc.number SUB_Oh_Scan_OHScanInit1_0500
     * @tc.desc   Test OHScanInit1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_OHScanInit1_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_OHScanInit1_0500 start====");
        let result = printerror.OHScanInit1();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_OHScanInit1_0500 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_OHScanInit1_0500 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_StartScannerDiscovery1_0600
     * @tc.number SUB_Oh_Scan_StartScannerDiscovery1_0600
     * @tc.desc   Test OH_Scan_StartScannerDiscovery1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_StartScannerDiscovery1_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_StartScannerDiscovery1_0600 start====");
        let result = printerror.OH_Scan_StartScannerDiscovery1();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_StartScannerDiscovery1_0600 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_StartScannerDiscovery1_0600 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_OpenScanner1_0700
     * @tc.number SUB_Oh_Scan_OpenScanner1_0700
     * @tc.desc   Test OH_Scan_OpenScanner1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_OpenScanner1_0700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_OpenScanner1_0700 start====");
        let result = printerror.OH_Scan_OpenScanner1();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_OpenScanner1_0700 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_OpenScanner1_0700 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_CloseScanner1_0800
     * @tc.number SUB_Oh_Scan_CloseScanner1_0800
     * @tc.desc   Test OH_Scan_CloseScanner1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_CloseScanner1_0800', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_CloseScanner1_0800 start====");
        let result = printerror.OH_Scan_CloseScanner1();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_CloseScanner1_0800 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_CloseScanner1_0800 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_SetScannerParameter1_0900
     * @tc.number SUB_Oh_Scan_SetScannerParameter1_0900
     * @tc.desc   Test OH_Scan_SetScannerParameter1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_SetScannerParameter1_0900', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_SetScannerParameter1_0900 start====");
        let result = printerror.OH_Scan_SetScannerParameter1();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_SetScannerParameter1_0900 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_SetScannerParameter1_0900 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_StartScan1_1000
     * @tc.number SUB_Oh_Scan_StartScan1_1000
     * @tc.desc   Test OH_Scan_StartScan1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_StartScan1_1000', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_StartScan1_1000 start====");
        let result = printerror.OH_Scan_StartScan1();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_StartScan1_1000 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_StartScan1_1000 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_CancelScan1_1100
     * @tc.number SUB_Oh_Scan_CancelScan1_1100
     * @tc.desc   Test OH_Scan_CancelScan1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_CancelScan1_1100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_CancelScan1_1100 start====");
        let result = printerror.OH_Scan_CancelScan1();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_CancelScan1_1100 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_CancelScan1_1100 catch err: " + err);
        done()
      }
    });

    /**
     * @tc.name   SUB_Oh_Scan_GetPictureScanProgress1_1200
     * @tc.number SUB_Oh_Scan_GetPictureScanProgress1_1200
     * @tc.desc   Test OH_Scan_GetPictureScanProgress1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Scan_GetPictureScanProgress1_1200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Scan_GetPictureScanProgress1_1200 start====");
        let result = printerror.OH_Scan_GetPictureScanProgress1();
        expect(result).assertEqual(ERR_OK);
        console.info("====>SUB_Oh_Scan_GetPictureScanProgress1_1200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Scan_GetPictureScanProgress1_1200 catch err: " + err);
        done()
      }
    });
  })
}

