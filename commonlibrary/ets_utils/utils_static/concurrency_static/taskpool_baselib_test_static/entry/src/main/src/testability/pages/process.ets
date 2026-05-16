'use static'

// 01: uid

export function testProcessUid001() {
  const TAG = 'testGetUid0001';
  try {
    console.log(`${TAG} test start`);
    let userId:int = StdProcess.uid();
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

export function testProcessPid002() {
  const TAG = 'testGetPid0001';
  try {
    console.log(`${TAG} test start`);
    let processId = StdProcess.pid();
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

export function testProcessTid003() {
  const TAG = 'testGetTid0001';
  try {
    console.log(`${TAG} test start`);
    let threadId = StdProcess.tid();
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

export function testProcessIsIsolated004() {
  const TAG = 'testisIsolatedProcess0001';
  try {
    console.log(`${TAG} test start`);
    const pres = StdProcess.isIsolatedProcess();
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

export function testProcessIs64Bit005() {
  const TAG = 'testIs64Bit0001';
  try {
    console.log(`${TAG} test start`);
    const isorno = StdProcess.is64Bit();
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

export function testProcessGetStartRealtime006() {
  const TAG = 'testGetStartRealtime0001';
  try {
    console.log(`${TAG} test start`);
    let flag = false;
    for (let i: int = 0; i < 3; i++) {
      const pri = StdProcess.getStartRealtime();
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

export function testProcessGetPastCpuTime007() {
  const TAG = 'testGetPastCpuTime0001';
  try {
    console.log(`${TAG} test start`);
    let flag = false;
    for (let i: int = 0; i < 3; i++) {
      const pri = StdProcess.getPastCpuTime();
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

export function testProcessUptime008() {
  const TAG = 'testUptime0001';
  try {
    console.log(`${TAG} test start`);
    const result1 = StdProcess.uptime();
    setTimeout(():void => {
      try {
        const result2 = StdProcess.uptime();
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

export function testProcessGetUidForName009() {
  const TAG = 'testGetUidForName0001';
  try {
    console.log(`${TAG} test start`);
    const pres = new StdProcess.ProcessManager().getUidForName('root');
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

export function testProcessManagerKill010() {
  const TAG = 'testProcessManagerKill0001';
  try {
    console.log(`${TAG} test start`);
    const pro = new StdProcess.ProcessManager();
    const pres = StdProcess.pid();
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

export function testProcessManagerGetThreadPriority011() {
  const TAG = 'testGetThreadPriority0001';
  try {
    console.log(`${TAG} test start`);
    const pro = new StdProcess.ProcessManager();
    const tid = StdProcess.tid();
    let flag = false;
    for (let i: int = 0; i < 5; i++) {
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

export function testProcessIsAppUid012() {
  const TAG = 'testIsappuid0001';
  try {
    console.log(`${TAG} test start`);
    const uid = StdProcess.uid();
    const isorno = new StdProcess.ProcessManager().isAppUid(uid);
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

export function testProcessGetSystemConfig013() {
  const TAG = 'testGetSystemConfig0001';
  try {
    console.log(`${TAG} test start`);
    const SYSTEM_CONFIG_ARG_MAX: int = 0;
    const MAX_RETRIES: int = 5;
    let flag = false;
    for (let i: int = 0; i < MAX_RETRIES; i++) {
      const configValue = new StdProcess.ProcessManager().getSystemConfig(SYSTEM_CONFIG_ARG_MAX);
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

export function testProcessGetEnvironmentVar014() {
  const TAG = 'testGetEnvironmentVar0001';
  try {
    console.log(`${TAG} test start`);
    const MAX_RETRIES: int = 5;
    let isPathVarPresent = false;
    for (let i: int = 0; i < MAX_RETRIES; i++) {
      const environmentVar = new StdProcess.ProcessManager().getEnvironmentVar('PATH');
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


// 16: ProcessManager.getUidForName

export function testProcessManagerGetUidForName016() {
  const TAG = 'testGetUidForNameProcess0001';
  try {
    console.log(`${TAG} test start`);
    let pro = new StdProcess.ProcessManager();
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

export function testProcessManagerIsAppUid017() {
  const TAG = 'testIsappuidProcess0001';
  try {
    console.log(`${TAG} test start`);
    const uid = StdProcess.uid();
    let pro = new StdProcess.ProcessManager();
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

export function testProcessManagerGetSystemConfig018() {
  const TAG = 'testGetSystemConfigProcess0001';
  try {
    console.log(`${TAG} test start`);
    const SYSTEM_CONFIG_ARG_MAX: int = 0;
    const MAX_RETRIES: int = 5;
    let flag = false;
    for (let i: int = 0; i < MAX_RETRIES; i++) {
      let pro = new StdProcess.ProcessManager();
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

export function testProcessManagerGetEnvironmentVar019() {
  const TAG = 'testGetEnvironmentVarProcess0001';
  try {
    console.log(`${TAG} test start`);
    const MAX_RETRIES: int = 5;
    let isPathVarPresent = false;
    for (let i: int = 0; i < MAX_RETRIES; i++) {
      let pro = new StdProcess.ProcessManager();
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