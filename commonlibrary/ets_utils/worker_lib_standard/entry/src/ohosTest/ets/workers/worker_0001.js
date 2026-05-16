/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import worker from '@ohos.worker';

const parentPort = worker.parentPort;

function post1() {
    try {
        parentPort.addEventListener('', () => {
        });
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.addEventListener(null, () => {
        });
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.addEventListener(undefined, () => {
        });
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.addEventListener('test', null);
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.addEventListener('test', undefined);
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
}

function post2() {
    try {
        parentPort.removeEventListener('', () => {
        });
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.removeEventListener(null, () => {
        });
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.removeEventListener(undefined, () => {
        });
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.removeEventListener('test', null);
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.removeEventListener('test', undefined);
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
}


function post3() {
    try {
        parentPort.dispatchEvent('');
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.dispatchEvent(null);
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.dispatchEvent(undefined);
        parentPort.postMessage('success');
    } catch (error) {
        parentPort.postMessage(error.code);
    }
}


parentPort.onmessage = function (e) {
    console.log('worker:: worker receive data ' + e.data);
    try {
        parentPort.postMessage(null);
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.postMessage(undefined);
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.postMessage(1, null);
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.postMessage(1, undefined);
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.postMessage(1, []);
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        const buffer = new ArrayBuffer(8);
        parentPort.postMessage(1, [buffer]);
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        parentPort.postMessage(2, { transfer: [] });
    } catch (error) {
        parentPort.postMessage(error.code);
    }
    try {
        const buffer = new ArrayBuffer(8);
        parentPort.postMessage(2, { transfer: [buffer] });
    } catch (error) {
        parentPort.postMessage(error.code);
    }

    post1();
    post2();
    post3();

};
parentPort.onmessageerror = () => {
};
