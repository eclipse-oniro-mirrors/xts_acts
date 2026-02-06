import { describe, it, expect, TestType, Size, Level} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import hidebug from '@ohos.hidebug'
import fileIo from '@ohos.file.fs';

export default function HidebugJsTest() {
    describe("HidebugJsTest", (): void => {
        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_0600
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_0600
         * @tc.desc      : Get total native heap memory size
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** DFX_DFR_Hiprofiler_Interface_Static_0600 Test start***********');
            try {
                let heapSize = hidebug.getNativeHeapSize();
                expect(heapSize >= BigInt(0)).assertTrue();
            } catch (err: BusinessError) {
                hilog.info(0x0000, 'testTag', '%{public}s', JSON.stringify(err));
                expect().assertFail();
            }
            hilog.info(0x0000, 'testTag', '*********** DFX_DFR_Hiprofiler_Interface_Static_0600 Test end***********');
        });

        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_0400
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_0400
         * @tc.desc      : Get Native heap memory allocation size.
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** DFX_DFR_Hiprofiler_Interface_Static_0400 Test start***********');
            try {
                let heapAllocatedSize = hidebug.getNativeHeapAllocatedSize();
                expect(heapAllocatedSize >= BigInt(0)).assertTrue();
            } catch (err: BusinessError) {
                expect().assertFail();
            }
            hilog.info(0x0000, 'testTag', '*********** DFX_DFR_Hiprofiler_Interface_Static_0400 Test end***********');
        });

        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_0500
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_0500
         * @tc.desc      : Get Native heap memory free size
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** DFX_DFR_Hiprofiler_Interface_Static_0500 Test start***********');
            try {
                let heapFreeSize = hidebug.getNativeHeapFreeSize();
                expect(heapFreeSize >= BigInt(0)).assertTrue();
            } catch (err: BusinessError) {
                expect().assertFail();
            }
            hilog.info(0x0000, 'testTag', '*********** DFX_DFR_Hiprofiler_Interface_Static_0500 Test end***********');
        });

        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_0800
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_0800
         * @tc.desc      : Get application process proportional set size memory information
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '*********** DFX_DFR_Hiprofiler_Interface_Static_0800 Test start***********');
            try {
                const times: number = 3;
                let pssValue: number = 0;
                for (let i = 0; i < times; i++) {
                    let arr: number[] = new Array<number>(i * 100000).fill(1) as number[];
                    let tmp: number = Number(hidebug.getPss());
                    hilog.info(0x0000, 'testTag', 'No.' + i + ' tmp: ' + tmp);
                    expect(tmp).assertLarger(pssValue);
                    pssValue = tmp;
                }
            } catch (err: BusinessError) {
                expect().assertFail();
            }
            hilog.info(0x0000, 'testTag', '*********** DFX_DFR_Hiprofiler_Interface_Static_0800 Test end***********');
        });

        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_1200
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_1200
         * @tc.desc      : Obtains the size of the shared dirty memory of a process.
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '************* DFX_DFR_Hiprofiler_Interface_Static_1200 Test start*************');
            try {
                let temp = hidebug.getSharedDirty();
                expect(temp >= BigInt(0)).assertTrue();
            } catch (err: BusinessError) {
                expect().assertFail();
            }
            hilog.info(0x0000, 'testTag', '************* DFX_DFR_Hiprofiler_Interface_Static_1200 Test end*************');
        });

        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_0700
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_0700
         * @tc.desc      : Get the size of the private dirty memory
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '************* DFX_DFR_Hiprofiler_Interface_Static_0700 Test start*************');
            try {
                let temp = hidebug.getPrivateDirty();
                expect(temp>=BigInt(0)).assertTrue();
            } catch (err: BusinessError) {
                expect().assertFail();
            }
            hilog.info(0x0000, 'testTag', '************* DFX_DFR_Hiprofiler_Interface_Static_0700 Test end*************');
        });

        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_1700
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_1700
         * @tc.desc      : Get the cpu usage of a process
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            hilog.info(0x0000, 'testTag', '************* DFX_DFR_Hiprofiler_Interface_Static_1700 Test start*************');
            try {
                let temp: number = -1;
                for(let i=0;i<=101;i++){
                    for(let j=0;j<=101;j++){
                        if(i+j == 202){
                            temp = hidebug.getCpuUsage();
                            hilog.info(0x0000, 'testTag', "CpuUsage is " + temp);
                        }
                    }
                }
                expect(temp>=0 && temp<=1).assertTrue();
            } catch (err: BusinessError) {
                expect().assertFail();
            }
            hilog.info(0x0000, 'testTag', '************* DFX_DFR_Hiprofiler_Interface_Static_1700 Test end*************');
        });

        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_2200
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_2200
         * @tc.desc      : test getVss
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            console.log('************* DFX_DFR_Hiprofiler_Interface_Static_2200 Test start*************');
            try {
                let temp = hidebug.getVss();
                expect(temp>=BigInt(0)).assertTrue();
            } catch (error) {
                expect().assertFail();
            }
            console.log('************* DFX_DFR_Hiprofiler_Interface_Static_2200 Test end*************');
        });

        /**
         * @tc.number SUB_DFX_DFT_HiDebug_Mem_Js_Static_0100
         * @tc.name testHiDebugJsStatic01
         * @tc.desc 验证获取系统内存MemTotal、MemFree、MemAvaiable内存大小能力-ts接口-getSystemMemInfo
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
            try {
                let sysMemInfo = hidebug.getSystemMemInfo();
                hilog.info(0x3200, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0100 memTotal=%{public}d', sysMemInfo.totalMem);
                hilog.info(0x3200, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0100 memFree=%{public}d', sysMemInfo.freeMem);
                hilog.info(0x3200, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0100 memAvailable=%{public}d', sysMemInfo.availableMem);
                expect(sysMemInfo.totalMem >= BigInt(0)).assertTrue();
                expect(sysMemInfo.freeMem >= BigInt(0)).assertTrue();
                expect(sysMemInfo.availableMem >= BigInt(0)).assertTrue();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s", `testHiDebug01 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_HiDebug_Mem_Js_Static_0200
         * @tc.name testHiDebugJsStatic02
         * @tc.desc 验证获取应用的RSS、PSS、VSS内存、共享脏内存、私有脏内存的能力-ts接口-getAppNativeMemInfo
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            try {
                let nativeMemInfo: hidebug.NativeMemInfo = hidebug.getAppNativeMemInfo();
                hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0200 pss=%{public}d', nativeMemInfo.pss);
                hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0200 vss=%{public}d', nativeMemInfo.vss);
                hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0200 rss=%{public}d', nativeMemInfo.rss);
                hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0200 privateDirty=%{public}d', nativeMemInfo.privateDirty);
                hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0200 sharedDirty=%{public}d', nativeMemInfo.sharedDirty);

                // 修正：确保比较的是数值
                expect(
                    Number(nativeMemInfo.vss) >= Number(nativeMemInfo.rss) &&
                        Number(nativeMemInfo.rss) >= Number(nativeMemInfo.pss)
                ).assertTrue();

                expect(
                    Number(nativeMemInfo.pss) >= 0 &&
                        Number(nativeMemInfo.privateDirty) >= 0 &&
                        Number(nativeMemInfo.sharedDirty) >= 0
                ).assertTrue();

                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s", `testHiDebug02 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number SUB_DFX_DFT_HiDebug_Mem_Js_Static_0500
         * @tc.name testHiDebugJsStatic05
         * @tc.desc 验证获取应用的Shared Clean、Private Clean的能力-ts接口-getAppNativeMemInfo
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            try {
                let nativeMemInfo = hidebug.getAppNativeMemInfo();
                hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0500 sharedClean=%{public}d', nativeMemInfo.sharedClean);
                hilog.info(0x0000, 'HIDEBUGTEST', 'SUB_DFX_DFT_HiDebug_Mem_Js_Static_0500 privateClean=%{public}d', nativeMemInfo.privateClean);
                expect(Number(nativeMemInfo.sharedClean) >= 0 &&
                    Number(nativeMemInfo.privateClean) >= 0).assertTrue();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_HiDebug_Mem_Js_Static_0500 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_HiDebug_CPU_Js_0100
         * @tc.name testHiDebugJsStatic06
         * @tc.desc 验证获取系统CPU使用率的能力-ts接口-getSystemCpuUsage
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            try {
                let sysCpuUsage = hidebug.getSystemCpuUsage();
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_HiDebug_CPU_Js_0100 > sysCpuUsage =: ${sysCpuUsage}`)
                expect(sysCpuUsage >= 0 && sysCpuUsage <= 1).assertTrue();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_HiDebug_CPU_Js_0100 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_HiDebug_CPU_Js_0200
         * @tc.name testHiDebugJsStatic07
         * @tc.desc 验证提供应用线程CPU使用率的能力-ts接口-getAppThreadCpuUsage
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            try {
                let appThreadCpuUsage = hidebug.getAppThreadCpuUsage();
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_HiDebug_CPU_Js_0200 > length =: ${appThreadCpuUsage.length}`)
                expect(appThreadCpuUsage.length > 0).assertTrue();
                for (let ii = 0; ii < appThreadCpuUsage.length; ii++) {
                    hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_HiDebug_CPU_Js_0200 > threadId =: ${appThreadCpuUsage[ii].threadId}`)
                    hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_HiDebug_CPU_Js_0200 > cpuUsage =: ${appThreadCpuUsage[ii].cpuUsage}`)
                    expect(appThreadCpuUsage[ii].cpuUsage >= 0 && appThreadCpuUsage[ii].cpuUsage <= 100).assertTrue();
                }
                done()
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_HiDebug_CPU_Js_0200 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0100
         * @tc.name testHiDebugJsStatic08
         * @tc.desc 验证应用内动态启停采集应用trace-ts接口-startAppTraceCapture、stopAppTraceCapture-MAIN_THREAD
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic08', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
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
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_Trace_Collect_Js_0100 > path =: ${path}`)
                expect(path != "").assertTrue();
                // 采集一段时间以后，调用关闭接口
                setTimeout(() => {
                    hidebug.stopAppTraceCapture();
                    hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_Trace_Collect_Js_0100 stop`)
                    done();
                }, 1000)
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_0100 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0200
         * @tc.name testHiDebugJsStatic09
         * @tc.desc 验证应用内动态启停采集应用trace-ts接口-startAppTraceCapture、stopAppTraceCapture-ALL_THREADS
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic09', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
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
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_Trace_Collect_Js_0200 > path =: ${path}`)
                expect(path != "").assertTrue();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_0200 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0300
         * @tc.name testHiDebugJsStatic10
         * @tc.desc 验证应用内动态启停采集应用trace-tag无效，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            try {
                let flag = hidebug.TraceFlag.ALL_THREADS;
                let tag = [123];
                let limit_size = 1;
                let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_0300 > path1 =: ${path1}`);
                expect().assertFail();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_0300 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0400
         * @tc.name testHiDebugJsStatic11
         * @tc.desc 验证应用内动态启停采集应用trace-limitSize小于1bytes，返回错误码401
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            try {
                let flag = hidebug.TraceFlag.ALL_THREADS;
                let tag = [hidebug.tags.ABILITY_MANAGER];
                let limit_size = 0;
                let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_Trace_Collect_Js_0400 > path1 =: ${path1}`)
                expect().assertFail();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_0400 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_Trace_Collect_Js_0900
         * @tc.name testHiDebugJsStatic16
         * @tc.desc 验证应用内重复开始采集应用trace，返回错误码11400102
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            try {
                let flag = hidebug.TraceFlag.ALL_THREADS;
                let tag = [hidebug.tags.ABILITY_MANAGER];
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}d", tag[0]);
                let limit_size = 1024 * 1024;
                let path1 = hidebug.startAppTraceCapture(tag, flag, limit_size);
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_Trace_Collect_Js_0900 > path1 =: ${path1}`);
                let path2 = hidebug.startAppTraceCapture(tag, flag, limit_size);
                hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", `SUB_DFX_DFT_Trace_Collect_Js_0900 > path2 =: ${path2}`);
                expect().assertFail();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_0900 > error code: ${err.code}, error msg: ${err.message}`);
                hidebug.stopAppTraceCapture();
                expect(err.code == 11400102).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_Trace_Collect_Js_1000
         * @tc.name testHiDebugJsStatic17
         * @tc.desc 验证应用在没有采集任务的情况下停止采集应用trace，返回错误码11400105
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done:()=>void) : Promise<void> => {
            try {
                hidebug.stopAppTraceCapture();
                hidebug.stopAppTraceCapture();
                expect().assertFail();
                done();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_1000 > error code: ${err.code}, error msg: ${err.message}`);
                expect(err.code == 11400105).assertTrue();
                done();
            }
        })

        /**
         * @tc.number SUB_DFX_DFT_Trace_Collect_Js_2100
         * @tc.name testHiDebugJsStatic28
         * @tc.desc getGraphicsMemory正常测试
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic28', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", 'testHiDebugJsStatic28 start');
            try {
                let result: number = await hidebug.getGraphicsMemory();
                hilog.info(0x0000, 'HIDEBUGTEST', "result = %{public}d", result);
                expect(result >= 0).assertTrue();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_2100 > error code: ${err.code}, error msg: ${err.message}`);
                expect().assertFail();
            }
            hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", 'testHiDebugJsStatic28 end');
            done();
        })

        /**
         * @tc.number SUB_DFX_DFT_Trace_Collect_Js_2200
         * @tc.name testHiDebugJsStatic29
         * @tc.desc getGraphicsMemorySync正常测试
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level3
         */
        it('testHiDebugJsStatic29', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void) : Promise<void> => {
            hilog.info(0x0000, 'HIDEBUGTEST', "%{public}s", 'testHiDebugJsStatic29 start');
            try {
                let result: number = hidebug.getGraphicsMemorySync();
                expect(result >= 0).assertTrue();
            } catch (err: BusinessError) {
                hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s",
                    `SUB_DFX_DFT_Trace_Collect_Js_2200 > error code: ${err.code}, error msg: ${err.message}`);
            }
            hilog.error(0x0000, 'HIDEBUGTEST', "%{public}s", 'testHiDebugJsStatic29 end');
            done();
        })

        /*
         * @tc.number    : DFX_DFR_Hiprofiler_Interface_Static_1000
         * @tc.name      : DFX_DFR_Hiprofiler_Interface_Static_1000
         * @tc.desc      : getServiceDump with check system ability failed
         * @tc.number: test_1000
         * @tc.level: Level 2
         * @tc.size: MediumTest
         * @tc.type: Function
         */
        it('DFX_DFR_Hiprofiler_Interface_Static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
            console.log('************* DFX_DFR_Hiprofiler_Interface_Static_1000 Test start*************');
            let path: string = "/data/storage/el2/base/files/serviceInfo3.txt";
            let file = fileIo.openSync(path, 0o102);
            let serviceId = -10
            let args: Array<string> = new Array<string>("allInfo");
            try {
                hidebug.getServiceDump(serviceId, file.fd, args)
                expect().assertFail();
            } catch (error: BusinessError) {
                console.info(error.code)
                console.info(error.message)
                expect(error.code == 11400101).assertTrue();
            }
            fileIo.closeSync(file.fd);
            console.log('************* DFX_DFR_Hiprofiler_Interface_Static_1000 Test end*************');
        });
    })
}
