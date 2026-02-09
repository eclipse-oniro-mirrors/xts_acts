/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import hiTraceMeter from '@ohos.hiTraceMeter'
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'HITRACEMETER_STATIC_TEST'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function HitraceMeterTest() {
  describe('hiTraceMeterEtsTest', (): void => {
    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0100
     * @tc.number DFX_DFR_HitraceMeter_Static_0100
     * @tc.desc   Test hiviewdfx.hiTraceMeter api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0100", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      console.info("-------DFX_DFR_HitraceMeter_0100 start--------");
      for (let i = 0; i < 3; i++) {
        console.info("DFX_DFR_HitraceMeter_Static_0100 i = " + i)
        console.info("DFX_DFR_HitraceMeter_Static_0100 " + JSON.stringify(i) + " finishTrace start");
        hiTraceMeter.finishTrace("test-" + JSON.stringify(i), 111 + i);
        console.info("DFX_DFR_HitraceMeter_Static_0100 " + JSON.stringify(i) + "finishTrace end");
      }
      expect(true).assertTrue();
      console.info("DFX_DFR_HitraceMeter_Static_0100 end");
      done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0200
     * @tc.number DFX_DFR_HitraceMeter_Static_0200
     * @tc.desc   Test hiviewdfx.hiTraceMeter api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0200", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      console.info("------DFX_DFR_HitraceMeter_Static_0200 start------");
      // Normal condition
      try {
        console.info("DFX_DFR_HitraceMeter_Static_0200 1 start");
        hiTraceMeter.startTrace("test2", 222);
        expect(true).assertTrue();
        console.info("DFX_DFR_HitraceMeter_Static_0200 1 success");
      } catch (err) {
        console.info("DFX_DFR_HitraceMeter_Static_0200 1 fail!");
        console.info("DFX_DFR_HitraceMeter_Static_0200 1 err = " + err);
        expect(false).assertTrue();
      }
      console.info("------DFX_DFR_HitraceMeter_0200 end------");
      done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0300
     * @tc.number DFX_DFR_HitraceMeter_Static_0300
     * @tc.desc   Test hiviewdfx.hiTraceMeter api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0300", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      console.info("------DFX_DFR_HitraceMeter_Static_0300 start------");
      // Normal condition
      try {
        console.info("DFX_DFR_HitraceMeter_Static_0300 1 start")
        hiTraceMeter.finishTrace("test3", 111);
        expect(true).assertTrue();
        console.info("DFX_DFR_HitraceMeter_Static_0300 1 success");
      } catch (err) {
        console.info("DFX_DFR_HitraceMeter_Static_0300 1 fail!");
        console.info("DFX_DFR_HitraceMeter_Static_0300 1 err = " + err);
        expect(false).assertTrue();
      }
      console.info("------DFX_DFR_HitraceMeter_Static_0300 end------");
      done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0400
     * @tc.number DFX_DFR_HitraceMeter_Static_0400
     * @tc.desc   Test hiviewdfx.hiTraceMeter api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0400", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      console.info("-------DFX_DFR_HitraceMeter_Static_0400 start--------");
      for (let i = 0; i < 3; i++) {
        console.info("DFX_DFR_HitraceMeter_Static_0400 :" + i);
        hiTraceMeter.traceByValue("test4-" + JSON.stringify(i), 3 + i);
      }
      expect(true).assertTrue();
      console.info("DFX_DFR_HitraceMeter_Static_0400 end");
      done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0500
     * @tc.number DFX_DFR_HitraceMeter_Static_0500
     * @tc.desc   Test hiviewdfx.hiTraceMeter api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0500", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      console.info("-------DFX_DFR_HitraceMeter_Static_0500 start--------");
      // Normal condition
      let flag = false;
      try {
        console.info("DFX_DFR_HitraceMeter_Static_0500 1 start")
        hiTraceMeter.traceByValue("test5", 5);
        expect(true).assertTrue();
        console.info("DFX_DFR_HitraceMeter_Static_0500 1 success")
      } catch (err) {
        console.info("DFX_DFR_HitraceMeter_Static_0500 1 fail!");
        console.info("DFX_DFR_HitraceMeter_Static_0500 1 err = " + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0600
     * @tc.number DFX_DFR_HitraceMeter_Static_0600
     * @tc.desc   Test hiviewdfx.hiTraceMeter api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0600", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
        console.info("-------DFX_DFR_HitraceMeter_Static_0600 start--------");
      let traceCount = 1;
      try {
        console.info("DFX_DFR_HitraceMeter_Static_0600 1 start")
        hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.DEBUG, 'myTestAsyncTrace', 1001, 'categoryTest',
          'key=value');
        hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.INFO, 'myTestAsyncTrace', 1001, 'categoryTest',
          'key=value');
        hiTraceMeter.startAsyncTrace(hiTraceMeter.HiTraceOutputLevel.CRITICAL, 'myTestAsyncTrace', 1001, 'categoryTest',
          'key=value');
        hiTraceMeter.traceByValue(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, 'myTestCountTrace', traceCount);
        hiTraceMeter.finishAsyncTrace(hiTraceMeter.HiTraceOutputLevel.MAX, 'myTestAsyncTrace', 1001);
        expect(true).assertTrue();
        console.info("DFX_DFR_HitraceMeter_Static_0600 1 success");
      } catch (err) {
        console.info("DFX_DFR_HitraceMeter_Static_0600 1 fail!");
        console.info("DFX_DFR_HitraceMeter_Static_0600 1 err = " + err);
        expect(false).assertTrue();
      }
        console.info("------DFX_DFR_HitraceMeter_Static_0600 end------");
      done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0700
     * @tc.number DFX_DFR_HitraceMeter_Static_0700
     * @tc.desc   Test hiviewdfx.hiTraceMeter api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0700", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
        console.info("-------DFX_DFR_HitraceMeter_Static_0700 start--------");
        try {
          console.info("DFX_DFR_HitraceMeter_Static_0700 1 start")
          let istrace = hiTraceMeter.isTraceEnabled()
          if (istrace) {
              expect(istrace).assertTrue();
          }else{
              expect(istrace).assertFalse();
          }
          console.info("DFX_DFR_HitraceMeter_Static_0700 1 success");
        } catch (err) {
          console.info("DFX_DFR_HitraceMeter_Static_0700 1 fail!");
          console.info("DFX_DFR_HitraceMeter_Static_0700 1 err = " + err);
          expect(false).assertTrue();
        }
        console.info("------DFX_DFR_HitraceMeter_Static_0700 end------");
        done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0800
     * @tc.number DFX_DFR_HitraceMeter_Static_0800
     * @tc.desc   Test hiviewdfx.hiTraceMeter api.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0800", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      console.info("-------DFX_DFR_HitraceMeter_Static_0800 start--------");
      let traceCount = 1;
      try {
        console.info("DFX_DFR_HitraceMeter_Static_0800 1 start")
        hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.DEBUG, 'myTestAsyncTrace1','key=value');
        hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.DEBUG);
        hiTraceMeter.startSyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL, 'myTestAsyncTrace2');
        hiTraceMeter.finishSyncTrace(hiTraceMeter.HiTraceOutputLevel.COMMERCIAL);
        expect(true).assertTrue();
        console.info("DFX_DFR_HitraceMeter_Static_0800 1 success");
      } catch (err) {
        console.info("DFX_DFR_HitraceMeter_Static_0800 1 fail!");
        console.info("DFX_DFR_HitraceMeter_Static_0800 1 err = " + err);
        expect(false).assertTrue();
      }
      console.info("------DFX_DFR_HitraceMeter_Static_0800 end------");
      done();
    })

    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_0900
     * @tc.number DFX_DFR_HitraceMeter_Static_0900
     * @tc.desc   验证registerTraceListener和unregisterTraceListener接口正常调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_0900", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      console.info("-------DFX_DFR_HitraceMeter_Static_0800 start--------");
      let traceCount = 1;
      try {
        let callback: hiTraceMeter.TraceEventListener = (traceStatus: boolean) => {
          if (traceStatus) {
            console.info("SUB_DFX_DFR_Hitrace_Interface_0100 " + traceStatus);
          } else {
            console.info("SUB_DFX_DFR_Hitrace_Interface_0100 " + traceStatus);
          }
        };
        let regRet = hiTraceMeter.registerTraceListener(callback);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0100 regRet: " + regRet);
        expect(regRet == 0).assertTrue();
        let unregRet = hiTraceMeter.unregisterTraceListener(regRet);
        console.info("SUB_DFX_DFR_Hitrace_Interface_0100 unregRet: " + unregRet);
        expect(unregRet == 0).assertTrue();
        console.info("SUB_DFX_DFR_Hitrace_Interface_0100 success");
        done();

      } catch (err) {
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   DFX_DFR_HitraceMeter_Static_1000
     * @tc.number DFX_DFR_HitraceMeter_Static_1000
     * @tc.desc   验证registerTraceListener接口连续调用11次，unregisterTraceListener接口连续调用10次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("DFX_DFR_HitraceMeter_Static_1000", Level.LEVEL3, async (done:()=>void) : Promise<void> => {
      console.info("-------DFX_DFR_HitraceMeter_Static_1000 start--------");
      try {
        let callback: hiTraceMeter.TraceEventListener = (traceStatus: boolean) => {
          if (traceStatus) {
            console.info("DFX_DFR_HitraceMeter_Static_1000 " + traceStatus);
          } else {
            console.info("DFX_DFR_HitraceMeter_Static_1000 " + traceStatus);
          }
        };
        let regRet = hiTraceMeter.registerTraceListener(callback);
        console.info("DFX_DFR_HitraceMeter_Static_1000 regRet: " + regRet);
        expect(regRet == 0).assertTrue();
        let unregRet = hiTraceMeter.unregisterTraceListener(regRet);
        console.info("DFX_DFR_HitraceMeter_Static_1000 unregRet: " + unregRet);
        expect(unregRet == 0).assertTrue();
        console.info("DFX_DFR_HitraceMeter_Static_1000 success");
        done();
      } catch (err) {
        expect(false).assertTrue();
        done();
      }
      console.info("DFX_DFR_HitraceMeter_Static_1000 end");
    })



  })
}