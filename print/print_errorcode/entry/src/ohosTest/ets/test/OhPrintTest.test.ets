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
const Success = 0;
const InvalidParameter = 401;
const GenericFailure = 24300001;
const InvalidPrintJob = 24300006;
const InvalidPrinter = 24300005;
export default function ActsPrintErrorTest() {
  describe('ActsPrintErrorTest', () => {
    /**
     * @tc.number  : SUB_Oh_Print_0100
     * @tc.name    : SUB_Oh_Print_0100
     * @tc.desc    : Test OHPrintNoError.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Oh_Print_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_0100 start====");
        let result: number = await printerror.OHPrintNoError();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Oh_Print_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Oh_Print_0100 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Oh_Print_0200
     * @tc.name    : SUB_Oh_Print_0200
     * @tc.desc    : Test OHPrintInvalidParameter.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Oh_Print_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_0200 sta`rt====");
        let result: number = await printerror.OHPrintInvalidParameter();
        expect(result).assertEqual(InvalidParameter);
        console.info("====>SUB_Oh_Print_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_0200 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Oh_Print_0300
     * @tc.name    : SUB_Oh_Print_0300
     * @tc.desc    : Test OHPrintGenericFailure.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Oh_Print_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_0300 start====");
        let result: number = await printerror.OHPrintGenericFailure();
        expect(result).assertEqual(GenericFailure);
        console.info("====>SUB_Oh_Print_0300 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_0300 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Oh_Print_0400
     * @tc.name    : SUB_Oh_Print_0400
     * @tc.desc    : Test OHPrintInvalidPrintJob.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Oh_Print_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_0400 start====");
        let result: number = await printerror.OHPrintInvalidPrintJob();
        expect(result).assertEqual(InvalidPrintJob);
        console.info("====>SUB_Oh_Print_0400 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_0400 catch err: " + err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_Oh_Print_0500
     * @tc.name    : SUB_Oh_Print_0500
     * @tc.desc    : Test OHPrintInvalidPrinter.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Oh_Print_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Oh_Print_0500 start====");
        let result: number = await printerror.OHPrintInvalidPrinter();
        expect(result).assertEqual(InvalidPrinter);
        console.info("====>SUB_Oh_Print_0500 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Oh_Print_0500 catch err: " + err);
        done()
      }
    })
  })
}
