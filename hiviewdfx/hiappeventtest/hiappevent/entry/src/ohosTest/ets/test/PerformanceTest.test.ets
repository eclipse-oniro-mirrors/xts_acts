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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import PerformanceAnalysisKitNdk from 'libentry.so'
import { taskpool } from '@kit.ArkTS'

export default function PerformanceTest() {
  describe('PerformanceTest', () => {

    /**
     * @tc.name   testHiCollieInitStuckDetection0100
     * @tc.number SUB_DFX_HiCollie_Init_StuckDetection_0100
     * @tc.desc   test OH_HiCollie_Init_StuckDetection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieInitStuckDetection0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiCollieInitStuckDetectionSuccess()
      console.error("====>testHiCollieInitStuckDetection0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiCollieInitJankDetection0100
     * @tc.number SUB_DFX_HiCollie_Init_JankDetection_0100
     * @tc.desc   test OH_HiCollie_Init_JankDetection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieInitJankDetection0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiCollieInitJankDetectionSuccess()
      console.error("====>testHiCollieInitJankDetection0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiCollieInitJankDetection0200
     * @tc.number SUB_DFX_HiCollie_Init_JankDetection_0200
     * @tc.desc   test OH_HiCollie_Init_JankDetection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieInitJankDetection0200', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiCollieInitJankDetectionInvalid()
      console.error("====>testHiCollieInitJankDetection0200 err: " + ret)
      expect(ret).assertEqual(401)
      done()
    })

    /**
     * @tc.name   testHiCollieReport0200
     * @tc.number SUB_DFX_HiCollie_Report_0200
     * @tc.desc   test OH_HiCollie_Report
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieReport0200', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiCollieReportInvalid()
      console.error("====>testHiCollieReport0200 err: " + ret)
      expect(ret).assertEqual(401)
      done()
    })

    /**
     * @tc.name   testHiCollieFlagDefault0100
     * @tc.number SUB_DFX_HiCollie_Flag_Default_0100
     * @tc.desc   test HICOLLIE_FLAG_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieFlagDefault0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiCollieFlagDefaultCode()
      console.error("====>testHiCollieFlagDefault0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiCollieFlagLog0100
     * @tc.number SUB_DFX_HiCollie_Flag_Log_0100
     * @tc.desc   test HICOLLIE_FLAG_LOG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieFlagLog0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiCollieFlagLogCode()
      console.error("====>testHiCollieFlagLog0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiCollieFlagRecovery0100
     * @tc.number SUB_DFX_HiCollie_Flag_Recovery_0100
     * @tc.desc   test HICOLLIE_FLAG_RECOVERY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiCollieFlagRecovery0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiCollieFlagRecoveryCode()
      console.error("====>testHiCollieFlagRecovery0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiDebugStartAppTraceCapture0100
     * @tc.number SUB_DFX_HiDebug_StartAppTraceCapture_0100
     * @tc.desc   test OH_HiDebug_StartAppTraceCapture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugStartAppTraceCapture0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugStartAppTraceCaptureSuccess()
      console.error("====>testHiDebugStartAppTraceCapture0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiDebugStartAppTraceCapture0200
     * @tc.number SUB_DFX_HiDebug_StartAppTraceCapture_0200
     * @tc.desc   test OH_HiDebug_StartAppTraceCapture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugStartAppTraceCapture0200', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugStartAppTraceCaptureInvalid()
      console.error("====>testHiDebugStartAppTraceCapture0200 err: " + ret)
      expect(ret).assertEqual(401)
      done()
    })

    /**
     * @tc.name   testHiDebugStartAppTraceCapture0300
     * @tc.number SUB_DFX_HiDebug_StartAppTraceCapture_0300
     * @tc.desc   test OH_HiDebug_StartAppTraceCapture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugStartAppTraceCapture0300', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugStartAppTraceCaptureCapturedAlReady()
      console.error("====>testHiDebugStartAppTraceCapture0300 err: " + ret)
      expect(ret).assertEqual(11400102)
      done()
    })

    /**
     * @tc.name   testHiDebugStopAppTraceCapture0100
     * @tc.number SUB_DFX_HiDebug_StopAppTraceCapture_0100
     * @tc.desc   test OH_HiDebug_StopAppTraceCapture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugStopAppTraceCapture0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugStopAppTraceCaptureSuccess()
      console.error("====>testHiDebugStopAppTraceCapture0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiDebugStopAppTraceCapture0200
     * @tc.number SUB_DFX_HiDebug_StopAppTraceCapture_0200
     * @tc.desc   test OH_HiDebug_StopAppTraceCapture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugStopAppTraceCapture0200', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugStopAppTraceCaptureNoTraceRunning()
      console.error("====>testHiDebugStopAppTraceCapture0200 err: " + ret)
      expect(ret).assertEqual(11400105)
      done()
    })

    /**
     * @tc.name   testHiDebugGetGraphicsMemory0100
     * @tc.number SUB_DFX_HiDebug_GetGraphicsMemory_0100
     * @tc.desc   test OH_HiDebug_GetGraphicsMemory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugGetGraphicsMemory0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugGetGraphicsMemorySuccess()
      console.error("====>testHiDebugGetGraphicsMemory0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiDebugGetGraphicsMemory0200
     * @tc.number SUB_DFX_HiDebug_GetGraphicsMemory_0200
     * @tc.desc   test OH_HiDebug_GetGraphicsMemory
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugGetGraphicsMemory0200', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugGetGraphicsMemoryInvalid()
      console.error("====>testHiDebugGetGraphicsMemory0200 err: " + ret)
      expect(ret).assertEqual(401)
      done()
    })

    /**
     * @tc.name   testHiDebugSetMallocDispatchTable0100
     * @tc.number SUB_DFX_HiDebug_SetMallocDispatchTable_0100
     * @tc.desc   test OH_HiDebug_SetMallocDispatchTable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugSetMallocDispatchTable0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugSetMallocDispatchTableSuccess()
      console.error("====>testHiDebugSetMallocDispatchTable0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiDebugSetMallocDispatchTable0200
     * @tc.number SUB_DFX_HiDebug_SetMallocDispatchTable_0200
     * @tc.desc   test OH_HiDebug_SetMallocDispatchTable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugSetMallocDispatchTable0200', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugSetMallocDispatchTableInvalid()
      console.error("====>testHiDebugSetMallocDispatchTable0200 err: " + ret)
      expect(ret).assertEqual(401)
      done()
    })

    /**
     * @tc.name   testHiDebugSymbolicAddress0100
     * @tc.number SUB_DFX_HiDebug_SymbolicAddress_0100
     * @tc.desc   test OH_HiDebug_SymbolicAddress
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugSymbolicAddress0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugSymbolicAddressInvalid()
      console.error("====>testHiDebugSymbolicAddress0100 err: " + ret)
      expect(ret).assertEqual(401)
      done()
    })

    /**
     * @tc.name   testHiDebugGetGraphicsMemorySummary0100
     * @tc.number SUB_DFX_HiDebug_GetGraphicsMemorySummary_0100
     * @tc.desc   test OH_HiDebug_GetGraphicsMemorySummary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugGetGraphicsMemorySummary0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugGetGraphicsMemorySummarySuccess()
      console.error("====>testHiDebugGetGraphicsMemorySummary0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiDebugGetGraphicsMemorySummary0200
     * @tc.number SUB_DFX_HiDebug_GetGraphicsMemorySummary_0200
     * @tc.desc   test OH_HiDebug_GetGraphicsMemorySummary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugGetGraphicsMemorySummary0200', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugGetGraphicsMemorySummaryInvalid()
      console.error("====>testHiDebugGetGraphicsMemorySummary0200 err: " + ret)
      expect(ret).assertEqual(401)
      done()
    })

    /**
     * @tc.name   testHiDebugHidebugSuccess0100
     * @tc.number SUB_DFX_HiDebug_Success_0100
     * @tc.desc   test HIDEBUG_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugHidebugSuccess0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugSuccessCode()
      console.error("====>testHiDebugHidebugSuccess0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiDebugInvalidArgument0100
     * @tc.number SUB_DFX_HiDebug_Invalid_Argument_0100
     * @tc.desc   test HIDEBUG_INVALID_ARGUMENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugInvalidArgument0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugInvalidArgumentCode()
      console.error("====>testHiDebugInvalidArgument0100 err: " + ret)
      expect(ret).assertEqual(401)
      done()
    })

    /**
     * @tc.name   testHiDebugTraceCapturedAlready0100
     * @tc.number SUB_DFX_HiDebug_Trace_Capture_Already_0100
     * @tc.desc   test HIDEBUG_TRACE_CAPTURED_ALREADY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugTraceCapturedAlready0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugTraceCapturedAlreadyCode()
      console.error("====>testHiDebugTraceCapturedAlready0100 err: " + ret)
      expect(ret).assertEqual(11400102)
      done()
    })

    /**
     * @tc.name   testHiDebugNoTraceRunning0100
     * @tc.number SUB_DFX_HiDebug_No_Trace_Running_0100
     * @tc.desc   test HIDEBUG_NO_TRACE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugNoTraceRunning0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugNoTraceRunningCode()
      console.error("====>testHiDebugNoTraceRunning0100 err: " + ret)
      expect(ret).assertEqual(11400105)
      done()
    })

    /**
     * @tc.name   testHiDebugTraceFlagAllThreads0100
     * @tc.number SUB_DFX_HiDebug_Trace_Flag_All_Threads_0100
     * @tc.desc   test HIDEBUG_NO_TRACE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiDebugTraceFlagAllThreads0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiDebugTraceFlagAllThreadsCode()
      console.error("====>testHiDebugTraceFlagAllThreads0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHilogLogFatal0100
     * @tc.number SUB_DFX_Hilog_Log_Fatal_0100
     * @tc.desc   test LOG_FATAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHilogLogFatal0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiLogLogFatalCode()
      console.error("====>testHilogLogFatal0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceIdInvalid0100
     * @tc.number SUB_DFX_HiTrace_Id_Invalid_0100
     * @tc.desc   test invalid of HiTrace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceIdInvalid0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceIdInvalidCode()
      console.error("====>testHiTraceIdInvalid0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceIdTraceIdValid0100
     * @tc.number SUB_DFX_HiTrace_Id_HiTrace_Id_Valid_0100
     * @tc.desc   test valid of HiTrace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceIdTraceIdValid0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceIdTraceIdValidCode()
      console.error("====>testHiTraceIdTraceIdValid0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceVer10100
     * @tc.number SUB_DFX_HiTrace_Ver1_0100
     * @tc.desc   test ver of HiTrace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceVer10100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceVer1Code()
      console.error("====>testHiTraceVer10100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceFlagDonotCreateSpan0100
     * @tc.number SUB_DFX_Hi_Trace_Flag_Donot_CreateSpan_0100
     * @tc.desc   test HITRACE_FLAG_DONOT_CREATE_SPAN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceFlagDonotCreateSpan0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceFlagDonotCreateSpanCode()
      console.error("====>testHiTraceFlagDonotCreateSpan0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceFlagTpInfo0100
     * @tc.number SUB_DFX_Hi_Trace_Flag_Tp_Info_0100
     * @tc.desc   test HITRACE_FLAG_TP_INFO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceFlagTpInfo0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceFlagTpInfoCode()
      console.error("====>testHiTraceFlagTpInfo0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceFlagNoBeInfo0100
     * @tc.number SUB_DFX_Hi_Trace_Flag_No_Be_Info_0100
     * @tc.desc   test HITRACE_FLAG_NO_BE_INFO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceFlagNoBeInfo0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceFlagNoBeInfoCode()
      console.error("====>testHiTraceFlagNoBeInfo0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceFlagDonotEnableLog0100
     * @tc.number SUB_DFX_Hi_Trace_Flag_Donot_Enable_Log_0100
     * @tc.desc   test HITRACE_FLAG_DONOT_ENABLE_LOG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceFlagDonotEnableLog0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceFlagDonotEnableLogCode()
      console.error("====>testHiTraceFlagDonotEnableLog0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceFlagD2dTpInfo0100
     * @tc.number SUB_DFX_Hi_Trace_Flag_D2d_Tp_Info_0100
     * @tc.desc   test HITRACE_FLAG_D2D_TP_INFO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceFlagD2dTpInfo0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceFlagD2dTpInfoCode()
      console.error("====>testHiTraceFlagD2dTpInfo0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceTpCr0100
     * @tc.number SUB_DFX_Hi_Trace_Tp_Cr_0100
     * @tc.desc   test HITRACE_TP_CR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceTpCr0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceTpCrCode()
      console.error("====>testHiTraceTpCr0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceTpSs0100
     * @tc.number SUB_DFX_Hi_Trace_Tp_Ss_0100
     * @tc.desc   test HITRACE_TP_SS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceTpSs0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceTpSsCode()
      console.error("====>testHiTraceTpSs0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceTpSr0100
     * @tc.number SUB_DFX_Hi_Trace_Tp_Sr_0100
     * @tc.desc   test HITRACE_TP_SR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceTpSr0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceTpSrCode()
      console.error("====>testHiTraceTpSr0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceTpGeneral0100
     * @tc.number SUB_DFX_Hi_Trace_Tp_General_0100
     * @tc.desc   test HITRACE_TP_GENERAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceTpGeneral0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceTpGeneralCode()
      console.error("====>testHiTraceTpGeneral0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceCmThread0100
     * @tc.number SUB_DFX_Hi_Trace_Cm_Thread_0100
     * @tc.desc   test HITRACE_CM_THREAD
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceCmThread0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceCmThreadCode()
      console.error("====>testHiTraceCmThread0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceCmProcess0100
     * @tc.number SUB_DFX_Hi_Trace_Cm_Process_0100
     * @tc.desc   test HITRACE_CM_PROCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceCmProcess0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceCmProcessCode()
      console.error("====>testHiTraceCmProcess0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceCmDevice0100
     * @tc.number SUB_DFX_Hi_Trace_Cm_Device_0100
     * @tc.desc   test HITRACE_CM_DEVICE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceCmDevice0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceCmDeviceCode()
      console.error("====>testHiTraceCmDevice0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceIdValid0100
     * @tc.number SUB_DFX_Hi_Trace_Id_Valid_0100
     * @tc.desc   test valid of HiTraceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceIdValid0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceIdValidCode()
      console.error("====>testHiTraceIdValid0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceIdVer0100
     * @tc.number SUB_DFX_Hi_Trace_Id_Ver_0100
     * @tc.desc   test ver of HiTraceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceIdVer0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceIdVerCode()
      console.error("====>testHiTraceIdVer0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceIdChainId0100
     * @tc.number SUB_DFX_Hi_Trace_Id_ChainId_0100
     * @tc.desc   test chainId of HiTraceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceIdChainId0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceIdChainIdCode()
      console.error("====>testHiTraceIdChainId0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceIdFlags0100
     * @tc.number SUB_DFX_Hi_Trace_Id_Flags_0100
     * @tc.desc   test flags of HiTraceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceIdFlags0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceIdFlagsCode()
      console.error("====>testHiTraceIdFlags0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceIdSpanId0100
     * @tc.number SUB_DFX_Hi_Trace_Id_SpanId_0100
     * @tc.desc   test spanId of HiTraceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceIdSpanId0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceIdSpanIdCode()
      console.error("====>testHiTraceIdSpanId0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testHiTraceIdParentSpanId0100
     * @tc.number SUB_DFX_Hi_Trace_Id_ParentSpanId_0100
     * @tc.desc   test parentSpanId of HiTraceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHiTraceIdParentSpanId0100', Level.LEVEL1, async (done: Function) => {
      let ret = PerformanceAnalysisKitNdk.HiTraceIdParentSpanIdCode()
      console.error("====>testHiTraceIdParentSpanId0100 err: " + ret)
      expect(ret).assertEqual(0)
      done()
    })

  })
}
