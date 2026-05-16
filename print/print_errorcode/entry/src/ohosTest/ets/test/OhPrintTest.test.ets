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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium'
import printerror from 'libprinterrorcode.so'
const Success = 0;
export default function ActsPrintErrorTest() {
  describe('ActsPrintErrorTest', () => {
    /**
     * @tc.name   SUB_Oh_Print_NoError_0100
     * @tc.number SUB_Oh_Print_NoError_0100
     * @tc.desc   Test OHPrintNoError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_NoError_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_NoError_0100 start====");
        let result = printerror.OHPrintNoError();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_NoError_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Oh_Print_NoError_0100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_InvalidParameter_0200
     * @tc.number SUB_Oh_Print_InvalidParameter_0200
     * @tc.desc   Test OHPrintInvalidParameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_InvalidParameter_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_InvalidParameter_0200 sta`rt====");
        let result = printerror.OHPrintInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_InvalidParameter_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_InvalidParameter_0200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_GenericFailure_0300
     * @tc.number SUB_Oh_Print_GenericFailure_0300
     * @tc.desc   Test OHPrintGenericFailure.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_GenericFailure_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_GenericFailure_0300 start====");
        let result = printerror.OHPrintGenericFailure();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_GenericFailure_0300 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_GenericFailure_0300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_InvalidPrintJob_0400
     * @tc.number SUB_Oh_Print_InvalidPrintJob_0400
     * @tc.desc   Test OHPrintInvalidPrintJob.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_InvalidPrintJob_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_InvalidPrintJob_0400 start====");
        let result = printerror.OHPrintInvalidPrintJob();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_InvalidPrintJob_0400 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_InvalidPrintJob_0400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_InvalidPrinter_0500
     * @tc.number SUB_Oh_Print_InvalidPrinter_0500
     * @tc.desc   Test OHPrintInvalidPrinter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_InvalidPrinter_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_InvalidPrinter_0500 start====");
        let result = printerror.OHPrintInvalidPrinter();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_InvalidPrinter_0500 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_InvalidPrinter_0500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_Init1_0600
     * @tc.number SUB_Oh_Print_Init1_0600
     * @tc.desc   Test OH_Print_Init1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_Init1_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_Init1_0600 start====");
        let result = printerror.OH_Print_Init1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_Init1_0600 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_Init1_0600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_StartPrinterDiscovery1_0700
     * @tc.number SUB_Oh_Print_StartPrinterDiscovery1_0700
     * @tc.desc   Test OH_Print_StartPrinterDiscovery1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_StartPrinterDiscovery1_0700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_StartPrinterDiscovery1_0700 start====");
        let result = printerror.OH_Print_StartPrinterDiscovery1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_StartPrinterDiscovery1_0700 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_StartPrinterDiscovery1_0700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_StopPrinterDiscovery1_0800
     * @tc.number SUB_Oh_Print_StopPrinterDiscovery1_0800
     * @tc.desc   Test OH_Print_StopPrinterDiscovery1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_StopPrinterDiscovery1_0800', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_StopPrinterDiscovery1_0800 start====");
        let result = printerror.OH_Print_StopPrinterDiscovery1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_StopPrinterDiscovery1_0800 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_StopPrinterDiscovery1_0800 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_ConnectPrinter1_0900
     * @tc.number SUB_Oh_Print_ConnectPrinter1_0900
     * @tc.desc   Test OH_Print_ConnectPrinter1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_ConnectPrinter1_0900', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_ConnectPrinter1_0900 start====");
        let result = printerror.OH_Print_ConnectPrinter1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_ConnectPrinter1_0900 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_ConnectPrinter1_0900 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_StartPrintJob1_1000
     * @tc.number SUB_Oh_Print_StartPrintJob1_1000
     * @tc.desc   Test OH_Print_StartPrintJob1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_StartPrintJob1_1000', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_StartPrintJob1_1000 start====");
        let result = printerror.OH_Print_StartPrintJob1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_StartPrintJob1_1000 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_StartPrintJob1_1000 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_StartPrintJob1_1001
     * @tc.number SUB_Oh_Print_StartPrintJob1_1001
     * @tc.desc   Test OH_Print_StartPrintJob1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_StartPrintJob1_1001', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_StartPrintJob1_1001 start====");
        let result = printerror.OH_Print_StartPrintJob2();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_StartPrintJob1_1001 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_StartPrintJob1_1001 catch err: " + err);
        expect(1).assertEqual(Success);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_RegisterPrinterChangeListener1_1100
     * @tc.number SUB_Oh_Print_RegisterPrinterChangeListener1_1100
     * @tc.desc   Test OH_Print_RegisterPrinterChangeListener1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_RegisterPrinterChangeListener1_1100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_RegisterPrinterChangeListener1_1100 start====");
        let result = printerror.OH_Print_RegisterPrinterChangeListener1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_RegisterPrinterChangeListener1_1100 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_RegisterPrinterChangeListener1_1100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_QueryPrinterList1_1200
     * @tc.number SUB_Oh_Print_QueryPrinterList1_1200
     * @tc.desc   Test OH_Print_QueryPrinterList1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_QueryPrinterList1_1200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_QueryPrinterList1_1200 start====");
        let result = printerror.OH_Print_QueryPrinterList1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_QueryPrinterList1_1200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_QueryPrinterList1_1200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_QueryPrinterList2_1300
     * @tc.number SUB_Oh_Print_QueryPrinterList2_1300
     * @tc.desc   Test OH_Print_QueryPrinterList2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_QueryPrinterList2_1300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_QueryPrinterList2_1300 start====");
        let result = printerror.OH_Print_QueryPrinterList2();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_QueryPrinterList2_1300 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_QueryPrinterList2_1300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_QueryPrinterInfo1_1400
     * @tc.number SUB_Oh_Print_QueryPrinterInfo1_1400
     * @tc.desc   Test OH_Print_QueryPrinterInfo1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_QueryPrinterInfo1_1400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_QueryPrinterInfo1_1400 start====");
        let result = printerror.OH_Print_QueryPrinterInfo1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_QueryPrinterInfo1_1400 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_QueryPrinterInfo1_1400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_QueryPrinterInfo2_1500
     * @tc.number SUB_Oh_Print_QueryPrinterInfo2_1500
     * @tc.desc   Test OH_Print_QueryPrinterInfo2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_QueryPrinterInfo2_1500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_QueryPrinterInfo2_1500 start====");
        let result = printerror.OH_Print_QueryPrinterInfo2();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_QueryPrinterInfo2_1500 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_QueryPrinterInfo2_1500 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_LaunchPrinterManager1_1600
     * @tc.number SUB_Oh_Print_LaunchPrinterManager1_1600
     * @tc.desc   Test OH_Print_LaunchPrinterManager1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_LaunchPrinterManager1_1600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_LaunchPrinterManager1_1600 start====");
        let result = printerror.OH_Print_LaunchPrinterManager1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_LaunchPrinterManager1_1600 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_LaunchPrinterManager1_1600 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_Print_QueryPrinterProperties1_1700
     * @tc.number SUB_Oh_Print_QueryPrinterProperties1_1700
     * @tc.desc   Test OH_Print_QueryPrinterProperties1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_Print_QueryPrinterProperties1_1700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_QueryPrinterProperties1_1700 start====");
        let result = printerror.OH_Print_QueryPrinterProperties1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_QueryPrinterProperties1_1700 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_QueryPrinterProperties1_1700 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.name   SUB_Oh_RestorePrinterProperties1_1800
     * @tc.number SUB_Oh_RestorePrinterProperties1_1800
     * @tc.desc   Test OH_Print_RestorePrinterProperties1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_Oh_RestorePrinterProperties1_1800', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_RestorePrinterProperties1_1800 start====");
        let result = printerror.OH_Print_RestorePrinterProperties1();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_RestorePrinterProperties1_1800 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_RestorePrinterProperties1_1800 catch err: " + err);
        done()
      }
    })
  })
}
