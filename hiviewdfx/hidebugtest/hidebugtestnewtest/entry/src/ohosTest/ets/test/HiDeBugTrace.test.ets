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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from "@ohos/hypium"
import hidebug from '@ohos.hidebug'
import featureAbility from '@ohos.ability.featureAbility';
import { hilog } from '@kit.PerformanceAnalysisKit';
import fileIo from '@ohos.file.fs';
import fs from '@ohos.file.fs';
import testNapi from 'libentry.so';

let maxValue = 2147483647;
export default function HiDeBugTrace() {
  describe('HiDeBugTrace', () => {
    /**
     * @tc.name   testHidebugrequestTrace01
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0100
     * @tc.desc   startProfiling函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0100 start");
      try {
        hidebug.requestTrace({
          identifier: "abcd_ADAS_1231",
          bufferSizeKb: 1024,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0100: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0100 error1 code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0100 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0100 end");
    })

    /**
     * @tc.name   testHidebugrequestTrace02
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0200
     * @tc.desc   startProfiling函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0200 start");
      try {
        hidebug.requestTrace({
          identifier: "abcd_ADAS_12312133331",
          bufferSizeKb: 1024,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0200: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0200 error1 code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0200 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0200 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace03
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0300
     * @tc.desc   startProfiling函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0300 start");
      try {
        hidebug.requestTrace({
          identifier: "abcd_ADAS_123121333中",
          bufferSizeKb: 1024,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0300: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0300 error1 code: ${err.code}, message: ${err.message}`)
          expect(false).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0300 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0300 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace04
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0400
     * @tc.desc   dumpHeapData函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0400 start");
      try {
        hidebug.requestTrace({
          identifier: null,
          bufferSizeKb: 1024,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0400: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0400 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0400 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0400 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace05
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0500
     * @tc.desc   dumpHeapData函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0500 start");
      try {
        hidebug.requestTrace({
          identifier: undefined,
          bufferSizeKb: 1024,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0500: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0500 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0500 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0500 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace06
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0600
     * @tc.desc   dumpHeapData函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0600 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 0,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0600: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0600 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 11400120 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0600 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0600 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace07
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0700
     * @tc.desc   startJsCpuProfiling函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0700 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 15360,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0700: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0700 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 11400120 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0700 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0700 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace08
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0800
     * @tc.desc   startJsCpuProfiling函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0800 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: undefined,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0800: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0800 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0800 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0800 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace09
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_0900
     * @tc.desc   startJsCpuProfiling函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_0900 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: null,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0900: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0900 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_0900 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_0900 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace10
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1000
     * @tc.desc   dumpJsHeapData函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1000 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: maxValue,
          durationMs: 1000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1000: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1000 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 11400120 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1000 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1000 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace11
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1100
     * @tc.desc   dumpJsHeapData函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1100 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 1024,
          durationMs: 0,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1100: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1100 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 11400120 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1100 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1100 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace12
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1200
     * @tc.desc   dumpJsHeapData函数的异常值覆盖,""//null/undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1200 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 1024,
          durationMs: 15000,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1200: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1200 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 11400120 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1200 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1200 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace13
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1300
     * @tc.desc   getServiceDump函数的异常值覆盖,第1个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1300 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 1024,
          durationMs: undefined,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1300: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1300 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1300 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1300 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace14
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1400
     * @tc.desc   getServiceDump函数的异常值覆盖,第1个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1400 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 1024,
          durationMs: null,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1400: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1400 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1400 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1400 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace15
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1500
     * @tc.desc   getServiceDump函数的异常值覆盖,第2个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1500 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 1024,
          durationMs: maxValue,
          reserved: 0,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1500: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1500 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 11400120 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1500 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1500 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace16
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1600
     * @tc.desc   getServiceDump函数的异常值覆盖,第2个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1600 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 1024,
          durationMs: 1000,
          reserved: null,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1600: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1600 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1600 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1600 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace17
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1700
     * @tc.desc   getServiceDump函数的异常值覆盖,第3个参数的null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1700 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 1024,
          durationMs: 1000,
          reserved: maxValue,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1700: ${tracePath}`)
          expect(tracePath.length > 0).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1700 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 11400120 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1700 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1700 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace18
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1800
     * @tc.desc   getServiceDump函数的异常值覆盖,第3个参数的undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1800 start");
      try {
        hidebug.requestTrace({
          identifier: "test_trace",
          bufferSizeKb: 1024,
          durationMs: 1000,
          reserved: undefined,
        }).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1800: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1800 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401 ).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1800 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1800 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace19
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_1900
     * @tc.desc   getServiceDump函数的异常值覆盖,第3个参数的空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_1900 start");
      try {
        let res = testNapi.TestRequestTrace()
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1900 error1 code: ${res}`)
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_1900 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_1900 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace20
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2000
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第一个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2000 start");
      try {
        let res = testNapi.TestRequestTraceIdentifier1()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2000 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2000 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace21
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2100
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第一个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2100 start");
      try {
        let res = testNapi.TestRequestTraceIdentifier2()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2100 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2100 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace22
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2200
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第一个参数的空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2200 start");
      try {
        let res = testNapi.TestRequestTraceIdentifier3()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2200 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2200 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace23
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2300
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第3个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2300 start");
      try {
        let res = testNapi.TestRequestTraceBufferSize1()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2300 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2300 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace24
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2400
     * @tc.desc   startAppTraceCapture函数的异常值覆盖,第3个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2400 start");
      try {
        let res = testNapi.TestRequestTraceBufferSize2()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2400 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2400 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace25
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2500
     * @tc.desc   getVMRuntimeStat函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2500 start");
      try {
        let res = testNapi.TestRequestTraceBufferSize3()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2500 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2500 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace26
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2600
     * @tc.desc   getVMRuntimeStat函数的异常值覆盖,null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2600 start");
      try {
        let res = testNapi.TestRequestTraceBufferSize4()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2600 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2600 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace27
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2700
     * @tc.desc   getVMRuntimeStat函数的异常值覆盖,空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2700 start");
      try {
        let res = testNapi.TestRequestTraceBufferSize5()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2700 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2700 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace28
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2800
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第1个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2800 start");
      try {
        let res = testNapi.TestRequestTracedurationMs1()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2800 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2800 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace29
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_2900
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第1个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_2900 start");
      try {
        let res = testNapi.TestRequestTracedurationMs2()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_2900 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_2900 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace30
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_3000
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第1个参数的空值覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace30', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_3000 start");
      try {
        let res = testNapi.TestRequestTracedurationMs3()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3000 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_3000 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace31
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_3100
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第2个参数的undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace31', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_3100 start");
      try {
        let res = testNapi.TestRequestTracedurationMs4()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3100 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_3100 end");
    })
    /**
     * @tc.name   testHidebugrequestTrace32
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_3200
     * @tc.desc   setAppResourceLimit函数的异常值覆盖,第2个参数的null覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace32', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_3200 start");
      try {
        let res = testNapi.TestRequestTraceReserved1()
        expect(res == 0 || res == 11400120 || res == 11400302).assertTrue();
        done()
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3200 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_3200 end");
    })

     /**
     * @tc.name   testHidebugrequestTrace33
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_3300
     * @tc.desc   requestTrace函数的异常值覆盖,null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace33', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_3300 start");
      try {
        hidebug.requestTrace(null).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3300: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3300 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3300 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_3300 end");
    })

    /**
     * @tc.name   testHidebugrequestTrace34
     * @tc.number SUB_DFX_DFR_requestTrace_Interface_3400
     * @tc.desc   requestTrace函数的异常值覆盖,undefined覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testHidebugrequestTrace34', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_requestTrace_Interface_3400 start");
      try {
        hidebug.requestTrace(undefined).then((tracePath: string) => {
          hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3400: ${tracePath}`)
          done()
        }).catch((err: BusinessError) => {
          hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3400 error1 code: ${err.code}, message: ${err.message}`)
          expect(err.code == 401).assertTrue();
          done()
        })
      } catch (error) {
        hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_requestTrace_Interface_3400 error2 code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`)
        expect(false).assertTrue();
        done()
      }
      console.info("SUB_DFX_DFR_requestTrace_Interface_3400 end");
    })
  })
}
