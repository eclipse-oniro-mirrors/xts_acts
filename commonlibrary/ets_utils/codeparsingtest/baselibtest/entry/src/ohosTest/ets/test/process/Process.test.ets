/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import process from '@ohos.process'

export default function processTest() {
  describe('processTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETUID_0100
     * @tc.name       : testGetUid0001
     * @tc.desc       : Returns the digital user ID of the process.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testGetUid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetUid0001";
      try {
        let userId = process.uid;
        expect(userId > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETPID_0100
     * @tc.name       : testGetPid0001
     * @tc.desc       : Returns the digital process ID of the process.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testGetPid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetPid0001";
      try {
        let processId = process.pid;
        expect(processId > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETTID_0100
     * @tc.name       : testGetTid0001
     * @tc.desc       : Returns the digital thread ID of the process.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testGetTid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testGetTid0001";
      try {
        // 获取当前线程的线程ID
        let threadId = process.tid;
        // 断言线程ID应大于0
        expect(threadId > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISOLATEDPROCESS_0100
     * @tc.name       : testisIsolatedProcess0001
     * @tc.desc       : Returns a boolean whether the process is isolated.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testisIsolatedProcess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testisIsolatedProcess0001";
      try {
        const pres = process.isIsolatedProcess();
        expect(pres).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_IS64BIT_0100
     * @tc.name       : testIs64Bit0001
     * @tc.desc       : Returns a boolean whether the process is running in a 64-bit environment.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testIs64Bit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const TAG = "testIs64Bit0001";
      try {
        const isorno = process.is64Bit();
        expect(isorno === true || isorno === false).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETSTARTREALTIME_0100
     * @tc.name       : testGetStartRealtime0001
     * @tc.desc       : Returns the elapsed real time (in milliseconds) taken from the start of the system to the start of the process.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetStartRealtime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetStartRealtime0001";
      try {
        let flag = false;
        for (let i = 0; i < 3; i++) {
          const pri = process.getStartRealtime();
          if (pri !== null) {
            flag = true;
          }
        }
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETPASTCPUTIME_0100
     * @tc.name       : testGetPastCpuTime0001
     * @tc.desc       : Returns the cpu time (in milliseconds) from the time when the process starts to the current time.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetPastCpuTime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetPastCpuTime0001";
      try {
        let flag = false;
        for (let i = 0; i < 3; i++) {
          const pri = process.getPastCpuTime();
          if (pri > 0) {
            flag = true;
          }
        }
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_UPTIME_0100
     * @tc.name       : testUptime0001
     * @tc.desc       : Returns the running time of the system.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testUptime0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testUptime0001";
      const result1 = process.uptime();
      setTimeout(() => {
        try {
          const result2 = process.uptime();
          const flag = (result2 - result1) >= 3;
          expect(flag).assertEqual(true);
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.code}`);
          expect().assertFail();
        }
      }, 3000);
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETUIDFORNAME_0100
     * @tc.name       : testGetUidForName0001
     * @tc.desc       : Gets the uid of the "root" user.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetUidForName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUidForName0001";
      try {
        const pres = process.getUidForName("root");
        expect(pres).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETUIDFORNAME_0200
     * @tc.name       : testGetUidForName0002
     * @tc.desc       : Attempts to get the uid of a non-existent user and expects failure.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetUidForName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUidForName0002";
      try {
        for (let i = 0; i < 3; i++) {
          const pres = process.getUidForName("root12356");
          expect(pres).assertEqual(-1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETUIDFORNAME_0300
     * @tc.name       : testGetUidForName0003
     * @tc.desc       : Attempts to get the uid with an undefined user name and expects an error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetUidForName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUidForName0003";
      try {
        process.getUidForName(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGER_KILL_0100
     * @tc.name       : testProcessManagerKill0001
     * @tc.desc       : Attempt to send a signal to the current process and expect success.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProcessManagerKill0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testProcessManagerKill0001";
      try {
        const pro = new process.ProcessManager();
        const pres = process.pid;
        const result = pro.kill(23, pres);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGER_KILL_0200
     * @tc.name       : testProcessManagerKill0002
     * @tc.desc       : Attempt to send a signal to a non-existent process and expect failure.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProcessManagerKill0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testProcessManagerKill0002";
      try {
        const pro = new process.ProcessManager();
        const result = pro.kill(3, 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGERKILL_0400
     * @tc.name       : testProcessManagerKill0004
     * @tc.desc       : Attempt to send a signal to the current process with an out-of-range signal and expect an err.code.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProcessManagerKill0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testProcessManagerKill0004";
      try {
        const pro = new process.ProcessManager();
        pro.kill(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGER_GETTHREADPRIORITY_0100
     * @tc.name       : testGetThreadPriority0001
     * @tc.desc       : Get thread priority using the specified thread ID (tid) and verify the priority range is -20 to 19.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetThreadPriority0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetThreadPriority0001";
      const pro = new process.ProcessManager();
      const tid = process.tid;
      for (let i = 0; i < 5; i++) {
        try {
          const priority = pro.getThreadPriority(tid);
          console.info(`Attempt ${i + 1}: Thread priority is ${priority}`);
          expect(priority >= -20 && priority <= 19).assertTrue();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.code}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGER_GETTHREADPRIORITY_0300
     * @tc.name       : testGetThreadPriority0003
     * @tc.desc       : Attempt to get thread priority using an undefined thread ID (tid) and expect an error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetThreadPriority0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetThreadPriority0003";
      try {
        const pro = new process.ProcessManager();
        pro.getThreadPriority(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISAPPUID_0100
     * @tc.name       : testIsappuid0001
     * @tc.desc       : Given a user's UID, testing if it belongs to the current application,
     *                  expecting the method to return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsappuid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsappuid0001";
      try {
        const uid = process.uid;
        const isorno = process.isAppUid(uid);
        console.info(`${TAG} - UID ${uid} belongs to the current app: ${isorno}`);
        expect(isorno).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISAPPUID_0200
     * @tc.name       : testIsappuid0002
     * @tc.desc       : Given a user's UID, testing if it belongs to the current application,
     *                  expecting the method to return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsappuid0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsappuid0002";
      try {
        const uid = process.getUidForName("root");
        const isorno = process.isAppUid(uid);
        console.info(`${TAG} - UID ${uid} belongs to the current app: ${isorno}`);
        expect(isorno).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISAPPUID_0300
     * @tc.name       : testIsappuid0003
     * @tc.desc       : Given undefined input, expect a thrown exception with error code: 401.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsappuid0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsappuid0003";
      try {
        process.isAppUid(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(err.name).assertEqual('Error')
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETSYSTEMCONFIG_0100
     * @tc.name       : testGetSystemConfig0001
     * @tc.desc       : Given system config parameter 0, expect a return value greater than 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetSystemConfig0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSystemConfig0001";
      const SYSTEM_CONFIG_ARG_MAX = 0;
      const MAX_RETRIES = 5;
      let flag = false;
      try {
        for (let i = 0; i < MAX_RETRIES; i++) {
          let configValue = process.getSystemConfig(SYSTEM_CONFIG_ARG_MAX);

          if (configValue > 0) {
            flag = true;
            break;
          }
        }
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETSYSTEMCONFIG_0200
     * @tc.name       : testGetSystemConfig0002
     * @tc.desc       : Given a non-existent system config parameter 111111, expect a return value of -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetSystemConfig0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSystemConfig0002";
      const NON_EXISTENT_PARAM = 111111;
      try {
        const configValue = process.getSystemConfig(NON_EXISTENT_PARAM);
        expect(configValue).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETSYSTEMCONFIG_0300
     * @tc.name       : testGetSystemConfig0003
     * @tc.desc       : Given a non-existent system config parameter 111111, expect a return value of -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetSystemConfig0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSystemConfig0003";
      const NON_EXISTENT_PARAM = undefined;
      try {
        process.getSystemConfig(NON_EXISTENT_PARAM);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.name).assertEqual('Error')
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETENVVAR_0100
     * @tc.name       : testGetEnvironmentVar0001
     * @tc.desc       : testing if the PATH environment variable is set and not empty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetEnvironmentVar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetEnvironmentVar0001";
      const MAX_RETRIES = 5;
      let isPathVarPresent = false;
      try {
        for (let i = 0; i < MAX_RETRIES; i++) {
          const environmentVar = process.getEnvironmentVar("PATH")
          console.log("testGetEnvironmentVar0001 PATH is", environmentVar)
          if (environmentVar) {
            isPathVarPresent = true;
            break;
          }
        }
        expect(isPathVarPresent).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETENVVAR_0200
     * @tc.name       : testGetEnvironmentVar0002
     * @tc.desc       : testing if the PATH1111 environment variable is set and return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetEnvironmentVar0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetEnvironmentVar0002";
      try {
        const environmentVar = process.getEnvironmentVar("PATH1111")
        console.log("testGetEnvironmentVar0002 PATH is", environmentVar)
        expect(environmentVar).assertEqual(undefined)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETENVVAR_0300
     * @tc.name       : testGetEnvironmentVar0003
     * @tc.desc       : testing if the undefined environment variable is set and return err.name is Error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetEnvironmentVar0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetEnvironmentVar0003";
      try {
        process.getEnvironmentVar(undefined)
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.name).assertEqual('Error')
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_EXIT_0100
     * @tc.name       : testExit0001
     * @tc.desc       : testing exit(undefined) return err.name is Error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testExit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testExit0001";
      try {
        process.exit(undefined)
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(err.name).assertEqual('Error')
      }
    });
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETUIDFORNAME_PROCESS_0100
     * @tc.name       : testGetUidForName0001
     * @tc.desc       : Gets the uid of the "root" user.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetUidForNameProcess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUidForNameProcess0001";
      try {
        let pro = new process.ProcessManager();
        const pres = pro.getUidForName("root");
        expect(pres).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETUIDFORNAME_PROCESS_0200
     * @tc.name       : testGetUidForName0002
     * @tc.desc       : Attempts to get the uid of a non-existent user and expects failure.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetUidForNameProcess0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUidForNameProcess0002";
      try {
        for (let i = 0; i < 3; i++) {
          let pro = new process.ProcessManager();
          const pres = pro.getUidForName("root12356");
          expect(pres).assertEqual(-1);
        }
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETUIDFORNAME_PROCESS_0300
     * @tc.name       : testGetUidForName0003
     * @tc.desc       : Attempts to get the uid with an undefined user name and expects an error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetUidForNameProcess0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetUidForNameProcess0003";
      try {
        let pro = new process.ProcessManager();
        pro.getUidForName(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.name).assertEqual('BuisnessError');
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGER_KILL_PROCESS_0100
     * @tc.name       : testProcessManagerKill0001
     * @tc.desc       : Attempt to send a signal to the current process and expect success.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProcessManagerKillProcess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testProcessManagerKillProcess0001";
      try {
        const pro = new process.ProcessManager();
        const pres = process.pid;
        const result = pro.kill(23, pres);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGER_KILL_PROCESS_0200
     * @tc.name       : testProcessManagerKill0002
     * @tc.desc       : Attempt to send a signal to a non-existent process and expect failure.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProcessManagerKillProcess0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testProcessManagerKillProcess0002";
      try {
        const pro = new process.ProcessManager();
        const result = pro.kill(3, 123);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGERKILL_PROCESS_0400
     * @tc.name       : testProcessManagerKill0004
     * @tc.desc       : Attempt to send a signal to the current process with an out-of-range signal and expect an err.code.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testProcessManagerKillProcess0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testProcessManagerKillProcess0004";
      try {
        const pro = new process.ProcessManager();
        pro.kill(undefined, undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGER_GETTHREADPRIORITY_PROCESS_0100
     * @tc.name       : testGetThreadPriority0001
     * @tc.desc       : Get thread priority using the specified thread ID (tid) and verify the priority range is -20 to 19.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetThreadPriorityProcess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetThreadPriorityProcess0001";
      const pro = new process.ProcessManager();
      const tid = process.tid;
      for (let i = 0; i < 5; i++) {
        try {
          const priority = pro.getThreadPriority(tid);
          console.info(`Attempt ${i + 1}: Thread priority is ${priority}`);
          expect(priority >= -20 && priority <= 19).assertTrue();
        } catch (err) {
          console.error(`${TAG} failed, error: ${err.code}`);
          expect().assertFail();
        }
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROCESSMANAGER_GETTHREADPRIORITY_PROCESS_0300
     * @tc.name       : testGetThreadPriority0003
     * @tc.desc       : Attempt to get thread priority using an undefined thread ID (tid) and expect an error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetThreadPriorityProcess0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetThreadPriorityProcess0003";
      try {
        const pro = new process.ProcessManager();
        pro.getThreadPriority(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISAPPUID_PROCESS_0100
     * @tc.name       : testIsappuid0001
     * @tc.desc       : Given a user's UID, testing if it belongs to the current application,
     *                  expecting the method to return true.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsappuidProcess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsappuidProcess0001";
      try {
        const uid = process.uid;
        let pro = new process.ProcessManager();
        const isorno = pro.isAppUid(uid);
        console.info(`${TAG} - UID ${uid} belongs to the current app: ${isorno}`);
        expect(isorno).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISAPPUID_PROCESS_0200
     * @tc.name       : testIsappuid0002
     * @tc.desc       : Given a user's UID, testing if it belongs to the current application,
     *                  expecting the method to return false.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsappuidProcess0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsappuidProcess0002";
      try {
        let pro = new process.ProcessManager();
        const uid = pro.getUidForName("root");
        const isorno = process.isAppUid(uid);
        console.info(`${TAG} - UID ${uid} belongs to the current app: ${isorno}`);
        expect(isorno).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_ISAPPUID_PROCESS_0300
     * @tc.name       : testIsappuid0003
     * @tc.desc       : Given undefined input, expect a thrown exception with error code: 401.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testIsappuidProcess0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testIsappuidProcess0003";
      try {
        let pro = new process.ProcessManager();
        pro.isAppUid(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.name}`);
        expect(err.name).assertEqual('BuisnessError')
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETSYSTEMCONFIG_PROCESS_0100
     * @tc.name       : testGetSystemConfig0001
     * @tc.desc       : Given system config parameter 0, expect a return value greater than 0.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetSystemConfigProcess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSystemConfigProcess0001";
      const SYSTEM_CONFIG_ARG_MAX = 0;
      const MAX_RETRIES = 5;
      let flag = false;
      try {
        for (let i = 0; i < MAX_RETRIES; i++) {
          let pro = new process.ProcessManager();
          let configValue = pro.getSystemConfig(SYSTEM_CONFIG_ARG_MAX);

          if (configValue > 0) {
            flag = true;
            break;
          }
        }
        expect(flag).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETSYSTEMCONFIG_PROCESS_0200
     * @tc.name       : testGetSystemConfig0002
     * @tc.desc       : Given a non-existent system config parameter 111111, expect a return value of -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetSystemConfigProcess0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSystemConfigProcess0002";
      const NON_EXISTENT_PARAM = 111111;
      try {
        let pro = new process.ProcessManager();
        const configValue = pro.getSystemConfig(NON_EXISTENT_PARAM);
        expect(configValue).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETSYSTEMCONFIG_PROCESS_0300
     * @tc.name       : testGetSystemConfig0003
     * @tc.desc       : Given a non-existent system config parameter 111111, expect a return value of -1.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetSystemConfigProcess0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetSystemConfigProcess0003";
      const NON_EXISTENT_PARAM = undefined;
      try {
        let pro = new process.ProcessManager();
        pro.getSystemConfig(NON_EXISTENT_PARAM);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.name).assertEqual('BuisnessError')
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETENVVAR_PROCESS_0100
     * @tc.name       : testGetEnvironmentVar0001
     * @tc.desc       : testing if the PATH environment variable is set and not empty.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetEnvironmentVarProcess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetEnvironmentVarProcess0001";
      const MAX_RETRIES = 5;
      let isPathVarPresent = false;
      try {
        for (let i = 0; i < MAX_RETRIES; i++) {
          let pro = new process.ProcessManager();
          const environmentVar = pro.getEnvironmentVar("PATH")
          console.log("testGetEnvironmentVar0001 PATH is", environmentVar)
          if (environmentVar) {
            isPathVarPresent = true;
            break;
          }
        }
        expect(isPathVarPresent).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETENVVAR_PROCESS_0200
     * @tc.name       : testGetEnvironmentVar0002
     * @tc.desc       : testing if the PATH1111 environment variable is set and return undefined.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetEnvironmentVarProcess0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetEnvironmentVarProcess0002";
      try {
        let pro = new process.ProcessManager();
        const environmentVar = pro.getEnvironmentVar("PATH1111")
        console.log("testGetEnvironmentVar0002 PATH is", environmentVar)
        expect(environmentVar).assertEqual(undefined)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_GETENVVAR_PROCESS_0300
     * @tc.name       : testGetEnvironmentVar0003
     * @tc.desc       : testing if the undefined environment variable is set and return err.name is Error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testGetEnvironmentVarProcess0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testGetEnvironmentVarProcess0003";
      try {
        let pro = new process.ProcessManager();
        pro.getEnvironmentVar(undefined);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.code}`);
        expect(err.name).assertEqual('BuisnessError')
      }
    });
  })
}