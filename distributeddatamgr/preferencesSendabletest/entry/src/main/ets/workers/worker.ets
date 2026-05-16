/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import utils from '@arkts.utils';
import worker, { ThreadWorkerGlobalScope, MessageEvents } from '@ohos.worker';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

async function exclusiveMultiWorkerJob(lockName: string, timeout: number, 
                                        tidBuf: Uint32Array, tid: number): Promise<void> {
    let lock = utils.locks.AsyncLock.request(lockName);
    return lock.lockAsync<void>(async () => {
        let old = Atomics.compareExchange(tidBuf, 0, 0, tid);
        if (old != 0) {
            throw new Error('Expected 0, but was: ' + old);
        }
        await new Promise<void>(resolve => setTimeout(resolve, timeout));
        old = Atomics.compareExchange(tidBuf, 0, tid, 0);
        if (old != tid) {
            throw new Error('Expected old=' + tid + ', but was: ' + old);
        }
    }, utils.locks.AsyncLockMode.EXCLUSIVE);
}

async function sharedMultiWorkerJob(lockName: string, timeout: number, idBuf: Uint32Array, id: number) {
    let lock = utils.locks.AsyncLock.request(lockName);
    return lock.lockAsync<void>(async () => {
        let old = Atomics.compareExchange(idBuf, 0, 0, id);
        if (old != 0) {
            throw new Error('Expected 0, but was: ' + old);
        }
        await new Promise<void>(resolve => setTimeout(resolve, timeout));
        old = Atomics.compareExchange(idBuf, 0, id, 0);
        if (old != id) {
            throw new Error('Expected old=' + id + ', but was: ' + old);
        }
    }, utils.locks.AsyncLockMode.SHARED);
}

async function twoThreadedDeadlockT2(lockNameL1: string, lockNameL2: string, flagBuf: Uint32Array) {
    let L2 = utils.locks.AsyncLock.request(lockNameL2);
    L2.lockAsync<void>(async () => { // F2
        hilog.info(0x00000, 'Worker:twoThreadedDeadlockT2', '>T2 F2');
        hilog.info(0x00000, 'Worker:twoThreadedDeadlockT2', '0->1');
        Atomics.compareExchange(flagBuf, 0, 0, 1);
        // now lock the second lock
        let L1 = utils.locks.AsyncLock.request(lockNameL1);
        await L1.lockAsync<void>(() => {
            // deadlock should happen, then T1 timeout exceeds and locks will unlock
        }, utils.locks.AsyncLockMode.EXCLUSIVE);
    }, utils.locks.AsyncLockMode.EXCLUSIVE);
}

async function lockHolderWorkerJob(lockName: string, timeout: number, flagBuf: Uint32Array): Promise<void> {
    let lock = utils.locks.AsyncLock.request(lockName);
    lock.lockAsync<void>(async () => {
        hilog.info(0x00000, 'Worker:lockHolderWorkerJob', '0->1');
        Atomics.compareExchange(flagBuf, 0, 0, 1);
        hilog.info(0x00000, 'Worker:lockHolderWorkerJob', '>timeout');
        await new Promise<void>(resolve => setTimeout(resolve, timeout));
        hilog.info(0x00000, 'Worker:lockHolderWorkerJob', '<timeout');
        }, utils.locks.AsyncLockMode.EXCLUSIVE);
}

workerPort.onmessage = (e: MessageEvents) => {
    let result: Promise<void> | null = null;
    if (e.data['test'] == 'exclusiveMultiWorkerTest') {
        result = exclusiveMultiWorkerJob(e.data['lockName'], e.data['timeout'], e.data['tidBuf'], e.data['tid']);
    } else if (e.data['test'] == 'sharedMultiWorkerTest') {
        result = sharedMultiWorkerJob(e.data['lockName'], e.data['timeout'], e.data['tidBuf'], e.data['tid']);
    } else if (e.data['test'] == 'twoThreadedDeadlockT2') {
        result = twoThreadedDeadlockT2(e.data['lockNameL1'], e.data['lockNameL2'], e.data['flagBuf']);
    } else if (e.data['test'] == 'sequentialLockWorkerTest') {
        result = lockHolderWorkerJob(e.data['lockName'], e.data['timeout'], e.data['flagBuf']);
    } else {
        workerPort.postMessage('FAILED: unknown test ' + e.data['test']);
        return;
    }
    result.then(() => {
        workerPort.postMessage('PASSED')
    }, (e: Error) => {
        workerPort.postMessage('FAILED: ' + e.message);
    });
}
