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
import {describe, it, expect, TestType, Level, Size} from '@ohos/hypium';

export default function HidebugToDevJsTest() {
describe('HidebugToDevJsTest', function () {

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_Js_0100
     * @tc.name testHiDebugJs01
     * @tc.desc 验证获取系统内存MemTotal、MemFree、MemAvaiable内存大小能力-ts接口-getSystemMemInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        try {
            let sysMemInfo = hidebug.getSystemMemInfo();
            hilog.info(0x3200, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0100 memTotal=%{public}d', sysMemInfo.totalMem);
            hilog.info(0x3200, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0100 memFree=%{public}d', sysMemInfo.freeMem);
            hilog.info(0x3200, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0100 memAvailable=%{public}d', sysMemInfo.availableMem);
            expect(sysMemInfo.totalMem >= BigInt(0)).assertTrue();
            expect(sysMemInfo.freeMem >= BigInt(0)).assertTrue();
            expect(sysMemInfo.availableMem >= BigInt(0)).assertTrue();
            done();
        } catch (err) {
            console.error(`testHiDebug01 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_Js_0200
     * @tc.name testHiDebugJs02
     * @tc.desc 验证获取应用的RSS、PSS、VSS内存、共享脏内存、私有脏内存的能力-ts接口-getAppNativeMemInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let nativeMemInfo = hidebug.getAppNativeMemInfo();
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0200 pss=%{public}d', nativeMemInfo.pss);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0200 vss=%{public}d', nativeMemInfo.vss);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0200 rss=%{public}d', nativeMemInfo.rss);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0200 privateDirty=%{public}d', nativeMemInfo.privateDirty);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0200 sharedDirty=%{public}d', nativeMemInfo.sharedDirty);
            expect(nativeMemInfo.vss >= nativeMemInfo.rss && nativeMemInfo.rss >= nativeMemInfo.pss).assertTrue();
            expect(nativeMemInfo.pss >= 0 && nativeMemInfo.privateDirty >= 0 && nativeMemInfo.sharedDirty >= 0).assertTrue();
            done();
        } catch (err) {
            console.error(`testHiDebug02 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_Js_0300
     * @tc.name testHiDebugJs03
     * @tc.desc 验证获取应用的virtual memory、resident set size限制阈值的能力-ts接口-getAppMemoryLimit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let memoryLimit = hidebug.getAppMemoryLimit();
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0300 rssLimit=%{public}d', memoryLimit.rssLimit);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0300 vssLimit=%{public}d', memoryLimit.vssLimit);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0300 vmHeapLimit=%{public}d', memoryLimit.vmHeapLimit);
            expect(memoryLimit.rssLimit >= 0 && memoryLimit.vssLimit >= 0 && memoryLimit.vmHeapLimit >= 0).assertTrue();
            done();
        } catch (err) {
            console.error(`testHiDebug03 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_Js_0400
     * @tc.name testHiDebugJs04
     * @tc.desc 验证获取应用的获取应用的JS VM的Heap Size、Heap Used Size、Heap Size大小的限制阈值的能力-ts接口-getAppVMMemoryInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let vmMemory = hidebug.getAppVMMemoryInfo();
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0400 heapTotal=%{public}d', vmMemory.totalHeap);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0400 heapUsed=%{public}d', vmMemory.heapUsed);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0400 arraySize=%{public}d', vmMemory.allArraySize);
            expect(vmMemory.totalHeap >= 0 && vmMemory.heapUsed >= 0 && vmMemory.allArraySize >= 0).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_Mem_Js_0400 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_Mem_Js_0500
     * @tc.name testHiDebugJs05
     * @tc.desc 验证获取应用的Shared Clean、Private Clean的能力-ts接口-getAppNativeMemInfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let nativeMemInfo = hidebug.getAppNativeMemInfo();
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0500 sharedClean=%{public}d', nativeMemInfo.sharedClean);
            hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_0500 privateClean=%{public}d', nativeMemInfo.privateClean);
            expect(nativeMemInfo.sharedClean >= 0 && nativeMemInfo.privateClean >= 0).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_Mem_Js_0500 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_CPU_Js_0100
     * @tc.name testHiDebugJs06
     * @tc.desc 验证获取系统CPU使用率的能力-ts接口-getSystemCpuUsage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let sysCpuUsage = hidebug.getSystemCpuUsage();
            console.info(`SUB_DFX_DFT_HiDebug_CPU_Js_0100 > sysCpuUsage =: ${sysCpuUsage}`)
            expect(sysCpuUsage >= 0 && sysCpuUsage <= 1).assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_CPU_Js_0100 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_HiDebug_CPU_Js_0200
     * @tc.name testHiDebugJs07
     * @tc.desc 验证提供应用线程CPU使用率的能力-ts接口-getAppThreadCpuUsage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let appThreadCpuUsage = hidebug.getAppThreadCpuUsage();
            console.info(`SUB_DFX_DFT_HiDebug_CPU_Js_0200 > length =: ${appThreadCpuUsage.length}`)
            expect(appThreadCpuUsage.length > 0).assertTrue();
            for (let ii = 0; ii < appThreadCpuUsage.length; ii++) {
                console.info(`SUB_DFX_DFT_HiDebug_CPU_Js_0200 > threadId =: ${appThreadCpuUsage[ii].threadId}`)
                console.info(`SUB_DFX_DFT_HiDebug_CPU_Js_0200 > cpuUsage =: ${appThreadCpuUsage[ii].cpuUsage}`)
                expect(appThreadCpuUsage[ii].cpuUsage >= 0 && appThreadCpuUsage[ii].cpuUsage <= 100).assertTrue();
            }
            done()
        } catch (err) {
            console.error(`SUB_DFX_DFT_HiDebug_CPU_Js_0200 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0100
     * @tc.name testHiDebugJs08
     * @tc.desc 验证应用内动态启停采集应用trace-ts接口-startAppTraceCapture、stopAppTraceCapture-MAIN_THREAD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = hidebug.TraceFlag.MAIN_THREAD;
            let tag = [hidebug.tags.ABILITY_MANAGER, hidebug.tags.ARKUI, hidebug.tags.ARK, hidebug.tags.BLUETOOTH,
                hidebug.tags.COMMON_LIBRARY, hidebug.tags.DISTRIBUTED_HARDWARE_DEVICE_MANAGER,
                hidebug.tags.DISTRIBUTED_AUDIO, hidebug.tags.DISTRIBUTED_CAMERA, hidebug.tags.DISTRIBUTED_DATA,
                hidebug.tags.DISTRIBUTED_HARDWARE_FRAMEWORK, hidebug.tags.DISTRIBUTED_INPUT,
                hidebug.tags.DISTRIBUTED_SCREEN, hidebug.tags.DISTRIBUTED_SCHEDULER, hidebug.tags.FFRT,
                hidebug.tags.FILE_MANAGEMENT, hidebug.tags.GLOBAL_RESOURCE_MANAGER, hidebug.tags.GRAPHICS,
                hidebug.tags.HDF, hidebug.tags.MISC, hidebug.tags.MULTIMODAL_INPUT, hidebug.tags.NET,
                hidebug.tags.NOTIFICATION, hidebug.tags.NWEB, hidebug.tags.OHOS, hidebug.tags.POWER_MANAGER,
                hidebug.tags.RPC, hidebug.tags.SAMGR, hidebug.tags.WINDOW_MANAGER, hidebug.tags.AUDIO,
                hidebug.tags.CAMERA, hidebug.tags.IMAGE, hidebug.tags.MEDIA];
            let limit_size = 500 * 1024 * 1024;
            let path = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0100 > path =: ${path}`)
            expect(path != "").assertTrue();
            // 采集一段时间以后，调用关闭接口
            setTimeout(() => {
                hidebug.stopAppTraceCapture();
                console.info(`SUB_DFX_DFT_Trace_Collect_Js_0100 stop`)
                done();
            }, 1000)
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0100 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0200
     * @tc.name testHiDebugJs09
     * @tc.desc 验证应用内动态启停采集应用trace-ts接口-startAppTraceCapture、stopAppTraceCapture-ALL_THREADS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = hidebug.TraceFlag.ALL_THREADS;
            let tag = [hidebug.tags.ABILITY_MANAGER, hidebug.tags.ARKUI, hidebug.tags.ARK, hidebug.tags.BLUETOOTH,
                hidebug.tags.COMMON_LIBRARY, hidebug.tags.DISTRIBUTED_HARDWARE_DEVICE_MANAGER,
                hidebug.tags.DISTRIBUTED_AUDIO, hidebug.tags.DISTRIBUTED_CAMERA, hidebug.tags.DISTRIBUTED_DATA,
                hidebug.tags.DISTRIBUTED_HARDWARE_FRAMEWORK, hidebug.tags.DISTRIBUTED_INPUT,
                hidebug.tags.DISTRIBUTED_SCREEN, hidebug.tags.DISTRIBUTED_SCHEDULER, hidebug.tags.FFRT,
                hidebug.tags.FILE_MANAGEMENT, hidebug.tags.GLOBAL_RESOURCE_MANAGER, hidebug.tags.GRAPHICS,
                hidebug.tags.HDF, hidebug.tags.MISC, hidebug.tags.MULTIMODAL_INPUT, hidebug.tags.NET,
                hidebug.tags.NOTIFICATION, hidebug.tags.NWEB, hidebug.tags.OHOS, hidebug.tags.POWER_MANAGER,
                hidebug.tags.RPC, hidebug.tags.SAMGR, hidebug.tags.WINDOW_MANAGER, hidebug.tags.AUDIO,
                hidebug.tags.CAMERA, hidebug.tags.IMAGE, hidebug.tags.MEDIA];
            let limit_size = 500 * 1024 * 1024;
            let path = hidebug.startAppTraceCapture(tag, flag, limit_size);
            hidebug.stopAppTraceCapture();
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0200 > path =: ${path}`)
            expect(path != "").assertTrue();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0200 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0300
     * @tc.name testHiDebugJs10
     * @tc.desc 验证应用内动态启停采集应用trace-tag无效，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = hidebug.TraceFlag.ALL_THREADS;
            let tag = [123];
            let limit_size = 1;
            let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0300 > path1 =: ${path1}`);
            expect().assertFail();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0300 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0400
     * @tc.name testHiDebugJs11
     * @tc.desc 验证应用内动态启停采集应用trace-limitSize小于1bytes，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = hidebug.TraceFlag.ALL_THREADS;
            let tag = [hidebug.tags.ABILITY_MANAGER];
            let limit_size = 0;
            let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0400 > path1 =: ${path1}`)
            expect().assertFail();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0400 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0500
     * @tc.name testHiDebugJs12
     * @tc.desc 验证应用内动态启停采集应用trace-flag无效，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = 3;
            let tag = [hidebug.tags.ABILITY_MANAGER];
            let limit_size = 1;
            let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0500 > path1 =: ${path1}`)
            expect().assertFail();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0500 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0600
     * @tc.name testHiDebugJs13
     * @tc.desc 验证应用内动态启停采集应用trace-tag为undefined，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = hidebug.TraceFlag.ALL_THREADS;
            let tag = undefined;
            let limit_size = 1;
            let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0600 > path1 =: ${path1}`)
            expect().assertFail();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0600 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0700
     * @tc.name testHiDebugJs14
     * @tc.desc 验证应用内动态启停采集应用trace-limitSize为undefined，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = hidebug.TraceFlag.ALL_THREADS;
            let tag = [hidebug.tags.ABILITY_MANAGER];
            let limit_size = undefined;
            let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0700 > path1 =: ${path1}`)
            expect().assertFail();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0700 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0800
     * @tc.name testHiDebugJs15
     * @tc.desc 验证应用内动态启停采集应用trace-flag为undefined，返回错误码401
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = undefined;
            let tag = [hidebug.tags.ABILITY_MANAGER];
            let limit_size = 1;
            let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0800 > path1 =: ${path1}`)
            expect().assertFail();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0800 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0900
     * @tc.name testHiDebugJs16
     * @tc.desc 验证应用内重复开始采集应用trace，返回错误码11400102
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            let flag = 1;
            let tag = [hidebug.tags.ABILITY_MANAGER];
            let limit_size = 1024 * 1024;
            let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0900 > path1 =: ${path1}`);
            let path2 = hidebug.startAppTraceCapture(tag, flag, limit_size);
            console.info(`SUB_DFX_DFT_Trace_Collect_Js_0900 > path2 =: ${path2}`);
            expect().assertFail();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_0900 > error code: ${err.code}, error msg: ${err.message}`);
            hidebug.stopAppTraceCapture();
            expect(err.code == 11400102).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0900
     * @tc.name testHiDebugJs17
     * @tc.desc 验证应用在没有采集任务的情况下停止采集应用trace，返回错误码11400105
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        try {
            hidebug.stopAppTraceCapture();
            hidebug.stopAppTraceCapture();
            expect().assertFail();
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1000 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 11400105).assertTrue();
            done();
        }
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1100
     * @tc.name testHiDebugJs18
     * @tc.desc getVMRuntimeStat正常测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs18 start');
        try {
            let runtimeStats = hidebug.getVMRuntimeStats();
            expect(runtimeStats["ark.gc.gc-count"] >= 0).assertTrue();
            expect(runtimeStats["ark.gc.gc-time"] >= 0).assertTrue();
            expect(runtimeStats["ark.gc.gc-bytes-allocated"] >= 0).assertTrue();
            expect(runtimeStats["ark.gc.gc-bytes-freed"] >= 0).assertTrue();
            expect(runtimeStats["ark.gc.fullgc-longtime-count"] >= 0).assertTrue();
            expect(runtimeStats["others"] === undefined).assertTrue();
        }catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1100 > error code: ${err.code}, error msg: ${err.message}`);
            expect(false).assertTrue();
        }
        console.info('testHiDebugJs18 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1200
     * @tc.name testHiDebugJs19
     * @tc.desc getVMRuntimeStats正常测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs19 start');
        try {
            let gcCount = hidebug.getVMRuntimeStat("ark.gc.gc-count");
            let gcTime = hidebug.getVMRuntimeStat("ark.gc.gc-time");
            let gcBytesAllocated = hidebug.getVMRuntimeStat("ark.gc.gc-bytes-allocated");
            let gcBytesFreed = hidebug.getVMRuntimeStat("ark.gc.gc-bytes-freed");
            let fullGcLongTimeCount = hidebug.getVMRuntimeStat("ark.gc.fullgc-longtime-count");
            expect(gcCount >= 0).assertTrue();
            expect(gcTime >= 0).assertTrue();
            expect(gcBytesAllocated >= 0).assertTrue();
            expect(gcBytesFreed >= 0).assertTrue();
            expect(fullGcLongTimeCount >= 0).assertTrue();
        } catch (error) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1200 > error code: ${err.code}, error msg: ${err.message}`);
            expect(false).assertTrue();
        }
        console.info('testHiDebugJs19 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1300
     * @tc.name testHiDebugJs20
     * @tc.desc getVMRuntimeStat参数异常测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs20', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs20 start');
        try {
            hidebug.getVMRuntimeStat("others");
            expect(false).assertTrue();
        }catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1300 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code === "401").assertTrue();
            expect(err.message === "Invalid parameter, unknown property.").assertTrue();
        }
        console.info('testHiDebugJs20 end');
        done();
    })

    /*
    * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1400
    * @tc.name testHiDebugJs21
    * @tc.desc getAppMemoryLimit
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level3
    */
    it('testHiDebugJs21', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs21 start');
        try {
            let temp = hidebug.getAppMemoryLimit();
            expect(temp.rssLimit >= BigInt(0)).assertTrue();
            expect(temp.vssLimit >= BigInt(0)).assertTrue();
            expect(temp.vmHeapLimit >= BigInt(0)).assertTrue();
            expect(temp.vmTotalHeapSize >= BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.info('testHiDebugJs21 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1500
     * @tc.name testHiDebugJs22
     * @tc.desc 验证应用内设置资源限制值setAppResourceLimit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs22', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs22 start');
        try {
            let type = 'js_heap';
            let value = 85;
            let enabledDebugLog = true;
            hidebug.setAppResourceLimit(type, value, enabledDebugLog);
            type = 'pss_memory';
            value = 1024;
            enabledDebugLog = true;
            hidebug.setAppResourceLimit(type, value, enabledDebugLog);
            type = 'fd';
            value = 10;
            enabledDebugLog = true;
            hidebug.setAppResourceLimit(type, value, enabledDebugLog);
            type = 'thread';
            value = 10;
            enabledDebugLog = true;
            hidebug.setAppResourceLimit(type, value, enabledDebugLog);
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1500 > error code: ${err.code}, error msg: ${err.message}`);
            expect().assertFail();
        }
        console.info('testHiDebugJs22 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1600
     * @tc.name testHiDebugJs23
     * @tc.desc 验证应用内设置资源限制值, type无效
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs23', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs23 start');
        try {
            let type = 'testHiDebugJs23';
            let value = 85;
            let enabledDebugLog = true;
            hidebug.setAppResourceLimit(type, value, enabledDebugLog);
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1600 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
        }
        console.info('testHiDebugJs23 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1700
     * @tc.name testHiDebugJs24
     * @tc.desc 验证应用内设置资源限制值, value为undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs24', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs24 start');
        try {
            let type = 'js_heap';
            let value = undefined;
            let enabledDebugLog = true;
            hidebug.setAppResourceLimit(type, value, enabledDebugLog);
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1700 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
        }
        console.info('testHiDebugJs24 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1800
     * @tc.name testHiDebugJs25
     * @tc.desc 验证应用内设置资源限制值, enabledDebugLog为undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs25', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs25 start');
        try {
            let type = 'js_heap';
            let value = 85;
            let enabledDebugLog = undefined;
            hidebug.setAppResourceLimit(type, value, enabledDebugLog);
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1800 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
        }
        console.info('testHiDebugJs25 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1900
     * @tc.name testHiDebugJs26
     * @tc.desc 验证应用内设置资源限制值, value不在范围内
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs26', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs26 start');
        try {
            let type = 'js_heap';
            let value = 15;
            let enabledDebugLog = true;
            hidebug.setAppResourceLimit(type, value, enabledDebugLog);
            done();
        } catch (err) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_1900 > error code: ${err.code}, error msg: ${err.message}`);
            expect(err.code == 401).assertTrue();
        }
        console.info('testHiDebugJs26 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_2000
     * @tc.name testHiDebugJs27
     * @tc.desc 验证isDebugState,未连接调试状态下
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs27', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs27 start');
        try {
            let result = hidebug.isDebugState();
            expect(result).assertFalse();
        } catch (error) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_2000 > error code: ${err.code}, error msg: ${err.message}`);
        }
        console.info('testHiDebugJs27 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_2100
     * @tc.name testHiDebugJs28
     * @tc.desc getGraphicsMemory正常测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs28 start');
        try {
            let result = hidebug.getGraphicsMemory();
            expect(result >= 0).assertFalse();
        } catch (error) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_2100 > error code: ${err.code}, error msg: ${err.message}`);
        }
        console.info('testHiDebugJs28 end');
        done();
    })

    /**
     * @tc.number SUB_DFX_DFT_Trace_Collect_Js_2200
     * @tc.name testHiDebugJs29
     * @tc.desc getGraphicsMemorySync正常测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testHiDebugJs29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
        console.info('testHiDebugJs29 start');
        try {
            let result = hidebug.getGraphicsMemorySync();
            expect(result >= 0).assertTrue();
        } catch (error) {
            console.error(`SUB_DFX_DFT_Trace_Collect_Js_2200 > error code: ${err.code}, error msg: ${err.message}`);
        }
        console.info('testHiDebugJs29 end');
        done();
    })

})
}
