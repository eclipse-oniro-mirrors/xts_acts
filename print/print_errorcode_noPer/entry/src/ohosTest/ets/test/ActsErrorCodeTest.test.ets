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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import printNdk from 'libprinterrorcode.so'

const PRINT_ERR_OK = 0;

export default function ActsErrorCodeTest() {
  describe('ActsErrorCodeTest', () => {

    /**
     * @tc.name   testOHPrintInit1
     * @tc.number SUB_OH_Print_Init1
     * @tc.desc   test no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPrintInit1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>testOHPrintInit1 start====");
        let result = printNdk.OH_Print_Init1();
        console.info("====>testOHPrintInit1 result: " + result);
        expect(201).assertEqual(result);
        done()
      } catch (err) {
        console.error("====>testOHPrintInit1 catch err: " + err);
        expect(false).assertEqual(PRINT_ERR_OK);
      }
    })

    /**
     * @tc.name   testOHPrintInit2
     * @tc.number SUB_OH_Print_Init2
     * @tc.desc   test no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPrintInit2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>testOHPrintInit2 start====");
        let result = printNdk.OH_Print_Init1();
        console.info("====>testOHPrintInit2 result: " + result);
        expect(201).assertEqual(result);
        done()
      } catch (err) {
        console.error("====>testOHPrintInit2 catch err: " + err);
        expect(false).assertEqual(PRINT_ERR_OK);
      }
    })

    /**
     * @tc.name   testOHPrintStartPrinterDiscovery1
     * @tc.number SUB_OH_Print_StartPrinterDiscovery1
     * @tc.desc   test no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPrintStartPrinterDiscovery1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          console.info("====>testOHPrintStartPrinterDiscovery1 start====");
          let result = printNdk.OH_Print_StartPrinterDiscovery1();
          console.info("====>testOHPrintStartPrinterDiscovery1 result: " + result);
          expect(201).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>testOHPrintStartPrinterDiscovery1 catch err: " + err);
          expect(false).assertEqual(PRINT_ERR_OK);
        }
      })

    /**
     * @tc.name   testOHPrintConnectPrinter1
     * @tc.number SUB_OH_Print_ConnectPrinter1
     * @tc.desc   test no permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOHPrintConnectPrinter1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>testOHPrintConnectPrinter1 start====");
        let result = printNdk.OH_Print_ConnectPrinter1();
        console.info("====>testOHPrintConnectPrinter1 result: " + result);
        expect(201).assertEqual(result);
        done()
      } catch (err) {
        console.error("====>testOHPrintConnectPrinter1 catch err: " + err);
        expect(false).assertEqual(PRINT_ERR_OK);
      }
    })
  })
}
