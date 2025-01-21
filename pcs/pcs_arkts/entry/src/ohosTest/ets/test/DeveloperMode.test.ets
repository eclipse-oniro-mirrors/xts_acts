/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import hidebug from '@ohos.hidebug';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import AbilityUtils from './AbilityUtils';
import { Driver } from '@ohos.UiTest';

class testClass {
  number: Number = 0
}

export default function developerModeTest() {
  describe('DeveloperModeTest', () => {
    let abilityContext: common.UIAbilityContext
    let applicationContext: common.ApplicationContext

    beforeAll(async (done: Function) => {
      abilityContext = AppStorage.get<common.UIAbilityContext>('TestAbilityContext') as common.UIAbilityContext
      applicationContext = abilityContext.getApplicationContext()
      expect(await AbilityUtils.startAbility('com.acts.pcs.arktstest', 'TestAbility', abilityContext)).assertTrue()
      let driver = Driver.create()
      await driver.delayMs(2000)
      done()
    })
    
    /*
     * @tc.number: G-TOOLS-0100
     * @tc.name: testSupportDebuggingConsole0100
     * @tc.desc: 【G-TOOLS-0100】必须支持 OpenHarmony 调试命令控制台
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportDebuggingConsole0100', 0, async (done: Function) => {
      try {
        const number = 0;
        console.debug("number: %d", number)
        console.log("number: %d", number)
        console.info("number: %d", number)
        console.warn("number: %d", number)
        console.error("number: %d", number)
        console.assert(true, "print nothing")
        console.assert(false, "print assert failed")
        console.count('test')
        console.countReset('test')
        let testObject: testClass = {
          number: 1
        }
        console.dir(testObject)
        console.dirxml("number: %d", number)
        console.group()
        console.groupCollapsed()
        console.groupEnd()
        console.table([1, 2, 3])
        console.time("test")
        console.timeLog("test")
        console.timeEnd("test")
        console.trace()
      } catch (error) {
        let err: BusinessError = error as BusinessError
        console.error(`Debug Fail. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: G-TOOLS-0101
     * @tc.name: testSupportDebuggingCommand0100
     * @tc.desc: 【G-TOOLS-0101】必须支持 OpenHarmony 调试命令集合
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportDebuggingCommand0100', 0, async (done: Function) => {
      try {
        let nativeHeapSize: bigint = hidebug.getNativeHeapSize();
        let nativeHeapAllocatedSize: bigint = hidebug.getNativeHeapAllocatedSize();
        let nativeHeapFreeSize: bigint = hidebug.getNativeHeapFreeSize();
        let pss: bigint = hidebug.getPss();
        let vss: bigint = hidebug.getVss();
        let sharedDirty: bigint = hidebug.getSharedDirty();
        let privateDirty: bigint = hidebug.getPrivateDirty();
        let cpuUsage: number = hidebug.getCpuUsage();
        hidebug.startJsCpuProfiling("cpu_profiling");
        hidebug.stopJsCpuProfiling();
        hidebug.dumpJsHeapData("heapData");
      } catch (error) {
        let err: BusinessError = error as BusinessError
        console.error(`Debug Fail. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: G-TOOLS-0102
     * @tc.name: testSupportDebuggingPermission0100
     * @tc.desc: 【G-TOOLS-0102】必须支持 OpenHarmony 调试所需权限
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testSupportDebuggingPermission0100', 0, async (done: Function) => {
      let filesDir: string = applicationContext!.filesDir;
      let path: string = filesDir + "/serviceInfo.txt";
      let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      let serviceId: number = 10;
      let args: Array<string> = new Array("allInfo");
      try {
        hidebug.getServiceDump(serviceId, file.fd, args);
      } catch (error) {
        let err: BusinessError = error as BusinessError
        console.error(`Debug Fail. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      fs.closeSync(file);
      done()
    })

    /*
     * @tc.number: G-TOOLS-0103
     * @tc.name: testDebuggingNodesIntegrity0100
     * @tc.desc: 【G-TOOLS-0103】必须支持 OpenHarmony 调试节点的完整性
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testDebuggingNodesIntegrity0100', 0, async (done: Function) => {
      let hilogSupported = canIUse("SystemCapability.HiviewDFX.HiLog")
      expect(hilogSupported).assertTrue()
      let hitraceSupported = canIUse("SystemCapability.HiviewDFX.HiTrace")
      expect(hitraceSupported).assertTrue()
      let appEventSupported = canIUse("SystemCapability.HiviewDFX.HiAppEvent")
      expect(appEventSupported).assertTrue()
      let sysEventSupported = canIUse("SystemCapability.HiviewDFX.HiSysEvent")
      expect(sysEventSupported).assertTrue()
      let faultLoggerSupported = canIUse("SystemCapability.HiviewDFX.Hiview.FaultLogger")
      expect(faultLoggerSupported).assertTrue()
      done()
    })

    /*
     * @tc.number: G-TOOLS-0104
     * @tc.name: testLogInputOutputRequirements0100
     * @tc.desc: 【G-TOOLS-0104】必须满足 OpenHarmony 日志、trace 等格式输入输出要求
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testLogInputOutputRequirements0100', 0, async (done: Function) => {
      try {
        if (hilog.isLoggable(0x0001, "testTag", hilog.LogLevel.DEBUG)) {
          hilog.debug(0x0001, "testTag", "%{public}s %{private}d", "hello World", 3);
        }
        if (hilog.isLoggable(0x0001, "testTag", hilog.LogLevel.INFO)) {
          hilog.info(0x0001, "testTag", "%{public}s %{private}d", "hello World", 3);
        }
        if (hilog.isLoggable(0x0001, "testTag", hilog.LogLevel.WARN)) {
          hilog.warn(0x0001, "testTag", "%{public}s %{private}d", "hello World", 3);
        }
        if (hilog.isLoggable(0x0001, "testTag", hilog.LogLevel.ERROR)) {
          hilog.error(0x0001, "testTag", "%{public}s %{private}d", "hello World", 3);
        }
        if (hilog.isLoggable(0x0001, "testTag", hilog.LogLevel.FATAL)) {
          hilog.fatal(0x0001, "testTag", "%{public}s %{private}d", "hello World", 3);
        }
      } catch (error) {
        let err: BusinessError = error as BusinessError
        console.error(`Debug Fail. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: STD-TOOLS-0105
     * @tc.name: testTuningSystemDataAcquire0100
     * @tc.desc: 【STD-TOOLS-0105】必须满足 OpenHarmony 调试调优相关系统数据获取格式
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testTuningSystemDataAcquire0100', 0, async (done: Function) => {
      try {
        let nativeHeapSize: bigint = hidebug.getNativeHeapSize();
        let nativeHeapAllocatedSize: bigint = hidebug.getNativeHeapAllocatedSize();
        let nativeHeapFreeSize: bigint = hidebug.getNativeHeapFreeSize();
        let pss: bigint = hidebug.getPss();
        let vss: bigint = hidebug.getVss();
        let sharedDirty: bigint = hidebug.getSharedDirty();
        let privateDirty: bigint = hidebug.getPrivateDirty();
        let cpuUsage: number = hidebug.getCpuUsage();
      } catch (error) {
        let err: BusinessError = error as BusinessError
        console.error(`Debug Fail. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue()
      }
      done()
    })

    /*
     * @tc.number: G-TOOLS-0106
     * @tc.name: testToolChainsNotChange0100
     * @tc.desc: 【G-TOOLS-0106】必须满足 OpenHarmony 工具链 API 与工具行为不发生改变
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testToolChainsNotChange0100', 0, async (done: Function) => {
      let hilogSupported = canIUse("SystemCapability.HiviewDFX.HiLog")
      expect(hilogSupported).assertTrue()
      let hitraceSupported = canIUse("SystemCapability.HiviewDFX.HiTrace")
      expect(hitraceSupported).assertTrue()
      let appEventSupported = canIUse("SystemCapability.HiviewDFX.HiAppEvent")
      expect(appEventSupported).assertTrue()
      let sysEventSupported = canIUse("SystemCapability.HiviewDFX.HiSysEvent")
      expect(sysEventSupported).assertTrue()
      let faultLoggerSupported = canIUse("SystemCapability.HiviewDFX.Hiview.FaultLogger")
      expect(faultLoggerSupported).assertTrue()
      done()
    })

    /*
     * @tc.number: C-STD-TOOLS-0107
     * @tc.name: testCommandAa0100
     * @tc.desc: 【C-STD-TOOLS-0107】如果设备支持 ability_runtime，必须支持 aa 工具命令行。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCommandAa0100', 0, async (done: Function) => {
      if(canIUse("SystemCapability.Ability.AbilityRuntime.Core")) {
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        let result = await abilityDelegator.executeShellCommand("aa help", 1000)
        expect(result != undefined)
        expect(result.exitCode).assertEqual(0)
        expect(result.stdResult != '').assertTrue()
      }
      done()
    })

    /*
     * @tc.number: C-STD-TOOLS-0108
     * @tc.name: testCommandBm0100
     * @tc.desc: 【C-STD-TOOLS-0108】如果设备支持 bundle_framework，必须支持 bm 工具命令行。
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testCommandBm0100', 0, async (done: Function) => {
      if(canIUse("SystemCapability.BundleManager.BundleFramework.Core")) {
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        let result = await abilityDelegator.executeShellCommand("bm help", 1000)
        expect(result != undefined)
        expect(result.exitCode).assertEqual(0)
        expect(result.stdResult != '').assertTrue()
      }
      done()
    })
  })
}