
import process from '@ohos.process';

// 01: uid
@Concurrent
export function testProcessUid001() {
  const TAG = 'testGetUid0001';
  try {
    console.log(`${TAG} test start`);
    let userId = process.uid;
    if (!(userId > 0)) {
      throw new Error(`${TAG} uid <= 0`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 02: pid
@Concurrent
export function testProcessPid002() {
  const TAG = 'testGetPid0001';
  try {
    console.log(`${TAG} test start`);
    let processId = process.pid;
    if (!(processId > 0)) {
      throw new Error(`${TAG} pid <= 0`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 03: tid
@Concurrent
export function testProcessTid003() {
  const TAG = 'testGetTid0001';
  try {
    console.log(`${TAG} test start`);
    let threadId = process.tid;
    if (!(threadId > 0)) {
      throw new Error(`${TAG} tid <= 0`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 04: isIsolatedProcess
@Concurrent
export function testProcessIsIsolated004() {
  const TAG = 'testisIsolatedProcess0001';
  try {
    console.log(`${TAG} test start`);
    const pres = process.isIsolatedProcess();
    if (pres !== true) {
      throw new Error(`${TAG} isIsolatedProcess !== true`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 05: is64Bit
@Concurrent
export function testProcessIs64Bit005() {
  const TAG = 'testIs64Bit0001';
  try {
    console.log(`${TAG} test start`);
    const isorno = process.is64Bit();
    if (isorno !== true && isorno !== false) {
      throw new Error(`${TAG} is64Bit invalid value`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 06: getStartRealtime
@Concurrent
export function testProcessGetStartRealtime006() {
  const TAG = 'testGetStartRealtime0001';
  try {
    console.log(`${TAG} test start`);
    let flag = false;
    for (let i = 0; i < 3; i++) {
      const pri = process.getStartRealtime();
      if (pri !== null) {
        flag = true;
      }
    }
    if (flag !== true) {
      throw new Error(`${TAG} getStartRealtime all null`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 07: getPastCpuTime
@Concurrent
export function testProcessGetPastCpuTime007() {
  const TAG = 'testGetPastCpuTime0001';
  try {
    console.log(`${TAG} test start`);
    let flag = false;
    for (let i = 0; i < 3; i++) {
      const pri = process.getPastCpuTime();
      if (pri > 0) {
        flag = true;
      }
    }
    if (flag !== true) {
      throw new Error(`${TAG} getPastCpuTime all <= 0`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 08: uptime
@Concurrent
export function testProcessUptime008() {
  const TAG = 'testUptime0001';
  try {
    console.log(`${TAG} test start`);
    const result1 = process.uptime();
    setTimeout(() => {
      try {
        const result2 = process.uptime();
        const flag = (result2 - result1) >= 3;
        if (flag !== true) {
          throw new Error(`${TAG} uptime diff < 3s`);
        }
        console.log(`${TAG} test end`);
      } catch (err) {
        console.error(`${TAG} failed: ${err.message}`);
        throw new Error(`${TAG} catch error.`);
      }
    }, 3000);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 09: getUidForName
@Concurrent
export function testProcessGetUidForName009() {
  const TAG = 'testGetUidForName0001';
  try {
    console.log(`${TAG} test start`);
    const pres = process.getUidForName('root');
    if (pres !== 0) {
      throw new Error(`${TAG} getUidForName(root) !== 0`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 10: ProcessManager.kill
@Concurrent
export function testProcessManagerKill010() {
  const TAG = 'testProcessManagerKill0001';
  try {
    console.log(`${TAG} test start`);
    const pro = new process.ProcessManager();
    const pres = process.pid;
    const result = pro.kill(23, pres);
    if (result !== true) {
      throw new Error(`${TAG} kill failed`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 11: ProcessManager.getThreadPriority
@Concurrent
export function testProcessManagerGetThreadPriority011() {
  const TAG = 'testGetThreadPriority0001';
  try {
    console.log(`${TAG} test start`);
    const pro = new process.ProcessManager();
    const tid = process.tid;
    let flag = false;
    for (let i = 0; i < 5; i++) {
      const priority = pro.getThreadPriority(tid);
      if (priority >= -20 && priority <= 19) {
        flag = true;
        break;
      }
    }
    if (flag !== true) {
      throw new Error(`${TAG} getThreadPriority out of range`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 12: isAppUid
@Concurrent
export function testProcessIsAppUid012() {
  const TAG = 'testIsappuid0001';
  try {
    console.log(`${TAG} test start`);
    const uid = process.uid;
    const isorno = process.isAppUid(uid);
    if (isorno !== true) {
      throw new Error(`${TAG} isAppUid(current uid) !== true`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 13: getSystemConfig
@Concurrent
export function testProcessGetSystemConfig013() {
  const TAG = 'testGetSystemConfig0001';
  try {
    console.log(`${TAG} test start`);
    const SYSTEM_CONFIG_ARG_MAX = 0;
    const MAX_RETRIES = 5;
    let flag = false;
    for (let i = 0; i < MAX_RETRIES; i++) {
      const configValue = process.getSystemConfig(SYSTEM_CONFIG_ARG_MAX);
      if (configValue > 0) {
        flag = true;
        break;
      }
    }
    if (flag !== true) {
      throw new Error(`${TAG} getSystemConfig all <= 0`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 14: getEnvironmentVar
@Concurrent
export function testProcessGetEnvironmentVar014() {
  const TAG = 'testGetEnvironmentVar0001';
  try {
    console.log(`${TAG} test start`);
    const MAX_RETRIES = 5;
    let isPathVarPresent = false;
    for (let i = 0; i < MAX_RETRIES; i++) {
      const environmentVar = process.getEnvironmentVar('PATH');
      if (environmentVar) {
        isPathVarPresent = true;
        break;
      }
    }
    if (isPathVarPresent !== true) {
      throw new Error(`${TAG} PATH not found`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 15: exit
@Concurrent
export function testProcessExit015() {
  const TAG = 'testExit0001';
  try {
    console.log(`${TAG} test start`);
    try {
      process.exit(undefined);
      throw new Error(`${TAG} exit(undefined) should throw`);
    } catch (err) {
      if (err.name !== 'Error') {
        throw new Error(`${TAG} exit threw wrong error name`);
      }
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 16: ProcessManager.getUidForName
@Concurrent
export function testProcessManagerGetUidForName016() {
  const TAG = 'testGetUidForNameProcess0001';
  try {
    console.log(`${TAG} test start`);
    let pro = new process.ProcessManager();
    const pres = pro.getUidForName('root');
    if (pres !== 0) {
      throw new Error(`${TAG} getUidForName(root) !== 0`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 17: ProcessManager.isAppUid
@Concurrent
export function testProcessManagerIsAppUid017() {
  const TAG = 'testIsappuidProcess0001';
  try {
    console.log(`${TAG} test start`);
    const uid = process.uid;
    let pro = new process.ProcessManager();
    const isorno = pro.isAppUid(uid);
    if (isorno !== true) {
      throw new Error(`${TAG} ProcessManager.isAppUid(current uid) !== true`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 18: ProcessManager.getSystemConfig
@Concurrent
export function testProcessManagerGetSystemConfig018() {
  const TAG = 'testGetSystemConfigProcess0001';
  try {
    console.log(`${TAG} test start`);
    const SYSTEM_CONFIG_ARG_MAX = 0;
    const MAX_RETRIES = 5;
    let flag = false;
    for (let i = 0; i < MAX_RETRIES; i++) {
      let pro = new process.ProcessManager();
      let configValue = pro.getSystemConfig(SYSTEM_CONFIG_ARG_MAX);
      if (configValue > 0) {
        flag = true;
        break;
      }
    }
    if (flag !== true) {
      throw new Error(`${TAG} ProcessManager.getSystemConfig all <= 0`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}

// 19: ProcessManager.getEnvironmentVar
@Concurrent
export function testProcessManagerGetEnvironmentVar019() {
  const TAG = 'testGetEnvironmentVarProcess0001';
  try {
    console.log(`${TAG} test start`);
    const MAX_RETRIES = 5;
    let isPathVarPresent = false;
    for (let i = 0; i < MAX_RETRIES; i++) {
      let pro = new process.ProcessManager();
      const environmentVar = pro.getEnvironmentVar('PATH');
      if (environmentVar) {
        isPathVarPresent = true;
        break;
      }
    }
    if (isPathVarPresent !== true) {
      throw new Error(`${TAG} ProcessManager PATH not found`);
    }
    console.log(`${TAG} test end`);
  } catch (err) {
    console.error(`${TAG} failed: ${err.message}`);
    throw new Error(`${TAG} catch error.`);
  }
}