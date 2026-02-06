/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import hidebug from '@ohos.hidebug';
import hilog from '@ohos.hilog';
import testNapi from "libhidebugndk.so";
import {describe, it, expect, TestType, Level, Size} from '@ohos/hypium';


export default function HidebugCTest() {
describe('HidebugCTest', function () {

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_C_0100
     * @tc.name testHiDebugC01
     * @tc.desc 验证获取应用的RSS、PSS、VSS内存、共享脏内存、私有脏内存的能力-C接口-OH_HiDebug_GetAppNativeMemInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let totalMem = testNapi.getTotalMem();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0100 > totalMem =: ${totalMem}`);
            let freeMem = testNapi.getFreeMem();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0100 > freeMem =: ${freeMem}`);
            let availableMem = testNapi.getAvailableMem();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0100 > availableMem =: ${availableMem}`);
            expect(totalMem >= BigInt(0)).assertTrue();
            expect(freeMem >= BigInt(0)).assertTrue();
            expect(availableMem >= BigInt(0)).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_Mem_C_0100 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_C_0200
     * @tc.name testHiDebugC02
     * @tc.desc 验证获取应用的RSS、PSS、VSS内存、共享脏内存、私有脏内存的能力-C接口-OH_HiDebug_GetAppNativeMemInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let pss = testNapi.getPss();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0200 > pss =: ${pss}`);
            let vss = testNapi.getVss();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0200 > vss =: ${vss}`);
            let rss = testNapi.getRss();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0200 > rss =: ${rss}`);
            let sharedDirty = testNapi.getSharedDirty();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0200 > sharedDirty =: ${sharedDirty}`);
            let privateDirty = testNapi.getPrivateDirty();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0200 > privateDirty =: ${privateDirty}`);
            expect(vss >= rss && rss >= pss).assertTrue();
            expect(pss >= 0 && privateDirty >= 0 && sharedDirty >= 0).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_Mem_C_0200 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_C_0300
     * @tc.name testHiDebugC03
     * @tc.desc 验证获取应用的virtual memory、resident set size限制阈值的能力-C接口-OH_HiDebug_GetAppMemoryLimit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let rssLimit = testNapi.getRssLimit();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0300 > rssLimit =: ${rssLimit}`);
            let vssLimit = testNapi.getVssLimit();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0300 > vssLimit =: ${vssLimit}`);
            expect(rssLimit >= 0 && vssLimit >= 0).assertTrue();
            done();
        } catch (err) {
            console.error(`testHiDebug03 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_C_0400
     * @tc.name testHiDebugC04
     * @tc.desc 验证获取应用的Shared Clean、Private Clean的能力-C接口-getAppNativeMemInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let sharedClean = testNapi.getSharedClean();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0400 > sharedClean =: ${sharedClean}`);
            let privateClean = testNapi.getPrivateClean();
            console.info(`SUB_DFX_DFT_HiDebug_Mem_C_0400 > privateClean =: ${privateClean}`);
            expect(sharedClean >= 0 && privateClean >= 0).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_Mem_C_0400 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_CPU_C_0100
     * @tc.name testHiDebugC05
     * @tc.desc 验证获取系统CPU使用率的能力-C接口-OH_HiDebug_GetSystemCpuUsage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let n_sysCpuUsage1 = testNapi.getSysCpuUsage();
            console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0100 > c_sysCpuUsage =: ${n_sysCpuUsage1}`);
            expect(n_sysCpuUsage1 >= 0 && n_sysCpuUsage1 <= 1).assertTrue();
            let n_sysCpuUsage2 = testNapi.getSysCpuUsage();
            console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0100 > c_sysCpuUsage =: ${n_sysCpuUsage2}`);
            expect(n_sysCpuUsage1 >= n_sysCpuUsage2).assertTrue();
            setTimeout(() => {
                let n_sysCpuUsage3 = testNapi.getSysCpuUsage();
                console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0100 > sysCpuUsage =: ${n_sysCpuUsage3}`);
                expect(n_sysCpuUsage3 != n_sysCpuUsage1).assertTrue();
                done();
            }, 2000)
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_CPU_C_0100 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_CPU_C_0200
     * @tc.name testHiDebugC06
     * @tc.desc 验证获取应用线程CPU使用率的能力-ts接口-OH_HiDebug_GetAppThreadCpuUsage、OH_HiDebug_FreeThreadCpuUsage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let appThreadCpuUsage = testNapi.getAppThreadCpuUsage();
            console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0200 > length =: ${appThreadCpuUsage.length}`);
            expect(appThreadCpuUsage.length > 0).assertTrue();
            console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0200 > length =: ${appThreadCpuUsage.length}`)
            for (let ii = 0; ii < appThreadCpuUsage.length; ii++) {
                console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0200 > threadId =: ${appThreadCpuUsage[ii].threadId}`)
                console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0200 > cpuUsage =: ${appThreadCpuUsage[ii].cpuUsage}`)
                expect(appThreadCpuUsage[ii].cpuUsage >= 0 && appThreadCpuUsage[ii].cpuUsage <= 100).assertTrue();
            }
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_CPU_C_0200 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_CPU_C_0300
     * @tc.name testHiDebugC07
     * @tc.desc 验证获取应用进程CPU使用率的能力-C接口-GetAppCpuUsage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let appCpuUsage = 0;
            while (appCpuUsage == 0) {
                appCpuUsage = testNapi.getAppCpuUsage();
                // console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0300 > appCpuUsage =: ${appCpuUsage}`);
            }
            console.info(`SUB_DFX_DFT_HiDebug_CPU_C_0300 > last appCpuUsage =: ${appCpuUsage}`);
            expect(appCpuUsage > 0).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_CPU_C_0300 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0100
     * @tc.name testHiDebugC08
     * @tc.desc 验证应用内动态启停采集应用trace-C接口-OH_HiDebug_StartAppTraceCapture-HIDEBUG_TRACE_FLAG_MAIN_THREAD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.startAppTraceCapture(1, 500 * 1024 * 1024, 256);
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0100 > start errCode : ${errCode}`);
            expect(errCode == 0).assertTrue();
            errCode = testNapi.stopAppTraceCapture();
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0100 > stop errCode : ${errCode}`);
            expect(errCode == 0).assertTrue();

            let filename = testNapi.getAppTraceCaptureFile(1, 500 * 1024 * 1024, 256);
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0100 > start filename : ${filename}`);
            expect(filename != "").assertTrue();
            errCode = testNapi.stopAppTraceCapture();
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0100 > stop errCode : ${errCode}`);
            expect(errCode == 0).assertTrue();

            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0100 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0200
     * @tc.name testHiDebugC09
     * @tc.desc 验证应用内动态启停采集应用trace-C接口-OH_HiDebug_StartAppTraceCapture-HIDEBUG_TRACE_FLAG_ALL_THREADS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.startAppTraceCapture(2, 1, 256);
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0200 > start errCode : ${errCode}`);
            expect(errCode == 0).assertTrue();
            errCode = testNapi.stopAppTraceCapture();
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0200 > stop errCode : ${errCode}`);
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0200 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0300
     * @tc.name testHiDebugC10
     * @tc.desc 验证应用内动态启停采集应用trace-C-tag无效，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.startAppTraceCaptureTag();
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0300 > start errCode : ${errCode}`);
            expect(errCode == 401).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0300 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0400
     * @tc.name testHiDebugC11
     * @tc.desc 验证应用内动态启停采集应用trace-C-limitSize小于1bytes，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.startAppTraceCapture(2, 0, 256);
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0400 > start errCode : ${errCode}`);
            expect(errCode == 401).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0400 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0500
     * @tc.name testHiDebugC12
     * @tc.desc 验证应用内动态启停采集应用trace-C-flag无效，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.startAppTraceCapture(3, 1, 256);
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0500 > start errCode : ${errCode}`);
            expect(errCode == 401).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0500 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0600
     * @tc.name testHiDebugC13
     * @tc.desc 验证应用内重复开始采集应用trace-C，返回错误码11400102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.startAppTraceCapture(1, 1024 * 1024, 256);
            errCode = testNapi.startAppTraceCapture(1, 1024 * 1024, 256);
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0600 > start errCode : ${errCode}`);
            expect(errCode == 11400102).assertTrue();
            testNapi.stopAppTraceCapture()
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0600 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0700
     * @tc.name testHiDebugC14
     * @tc.desc 验证应用在没有采集任务的情况下停止采集应用trace-C，返回错误码11400105
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.stopAppTraceCapture();
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0700 > stop errCode : ${errCode}`);
            expect(errCode == 11400104 || errCode == 11400105).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0700 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0800
     * @tc.name testHiDebugC15
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.getGraphicsMemory();
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0800 > start errCode : ${errCode}`);
            expect(errCode == 0).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0800 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_0900
     * @tc.name testHiDebugC16
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemory传入一个指向数组的指针
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
      it('testHiDebugC16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.getGraphicsMemoryArray();
            console.info(`SUB_DFX_DFT_Trace_Collect_C_0900 > start errCode : ${errCode}`);
            expect(errCode == 0 ).assertTrue();
             done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_0900 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_C_1100
     * @tc.name testHiDebugC17
     * @tc.desc 验证OH_HiDebug_GetGraphicsMemory空指针NULL，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugC17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let errCode = testNapi.getGraphicsMemoryNULL();
            console.info(`SUB_DFX_DFT_Trace_Collect_C_1100 > start errCode : ${errCode}`);
            expect(errCode == 401 ).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_C_1100 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })
})
}
