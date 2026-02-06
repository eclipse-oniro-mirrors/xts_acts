/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { process } from '@kit.ArkTS';
import { ArkTSUtils, worker } from "@kit.ArkTS";

@Concurrent
export function printArgs1(): number {
  console.log(`UID: ${process.uid}`);
  return process.uid;
}

@Concurrent
export function printArgs2(): number {
  console.log(`PID: ${process.pid}`);
  return process.pid;
}

@Concurrent
export function printArgs3(): number {
  console.log(`TID: ${process.tid}`);
  return process.tid;
}

@Concurrent
export function printArgs4(): boolean {
  const result = process.isIsolatedProcess();
  console.info(`isIsolatedProcess() = ${result}`);
  return result;
}

@Concurrent
export function printArgs5(): boolean {
  const result = process.is64Bit();
  console.info(`isIsolatedProcess() = ${result}`);
  return result;
}

@Concurrent
export function printArgs6(): number {
  const currentTime = process.getStartRealtime();
  console.log(`Start Realtime = ${currentTime}`);
  return currentTime;
}

@Concurrent
export function printArgs7(): number {
  const currentTime = process.getPastCpuTime();
  console.log(`Realtime = ${currentTime}`);
  return currentTime;
}

@Concurrent
export function printArgs8(): number {
  const currentTime = process.uptime();
  console.log(`Realtime = ${currentTime}`);
  return currentTime;
}

export class WorkThread {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker');
}

export class WorkThread2 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker2');
}

export class WorkThread3 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker3');
}

export class WorkThread4 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker4');
}

export class WorkThread5 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker5');
}

export class WorkThread6 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker6');
}

export class WorkThread7 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker7');
}

export class WorkThread8 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker8');
}

export class WorkThread9 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker9');
}


export class WorkThread10 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker10');
}


export class WorkThread11 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker11');
}

export class WorkThread12 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker12');
}


export class WorkThread13 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker13');
}

export class WorkThread14 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker14');
}

export class WorkThread15 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker15');
}

export class WorkThread16 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker16');
}

export class WorkThread17 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker17');
}

export class WorkThread18 {
  public static workerStageModel = new worker.ThreadWorker('./workers/Worker18');
}


@Concurrent
export function taskpoolTestFunc1(uid: number): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      const result = process.isAppUid(uid);
      if (typeof result === 'boolean') {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

@Concurrent
export function taskpoolTestFunc2(uname: string): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      const result = process.getUidForName(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

@Concurrent
export function taskpoolTestFunc3(uname: number): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      const result = process.getThreadPriority(uname);
      if (result <= 19 && result >= -20) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

@Concurrent
export function taskpoolTestFunc4(uname: number): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      const result = process.getSystemConfig(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

@Concurrent
export function taskpoolTestFunc5(uname: string): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      const result = process.getEnvironmentVar(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};


@Concurrent
export function taskpoolTestFunc6(uid: number): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      let pro = new process.ProcessManager();
      let result = pro.isAppUid(uid);
      if (typeof result === 'boolean') {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

@Concurrent
export function taskpoolTestFunc7(uname: string): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      let pro = new process.ProcessManager();
      let result = pro.getUidForName(uname);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

@Concurrent
export function taskpoolTestFunc8(uname: number): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      let pro = new process.ProcessManager();
      let tid = process.tid;
      let result = pro.getThreadPriority(tid);
      if (result <= 19 && result >= -20) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

@Concurrent
export function taskpoolTestFunc9(uname: number): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {

      let pro = new process.ProcessManager();
      let _SC_ARG_MAX = 0;
      let result = pro.getSystemConfig(_SC_ARG_MAX);
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};

@Concurrent
export function taskpoolTestFunc10(uname: string): Promise<number> {
  return new Promise((resolve) => {
    let taskSuccess = 0;
    try {
      let pro = new process.ProcessManager();
      let result = pro.getEnvironmentVar("PATH");
      if (result) {
        taskSuccess++;
        console.info(`taskpool call success, result: ${result}`);
      } else {
        console.error(` taskpool call failed: invalid return type`);
      }
    } catch (error) {
      console.error(` taskpool call exception: ${error.message}`);
    }
    resolve(taskSuccess);
  });
};



export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re()
    }, time)
  })
}