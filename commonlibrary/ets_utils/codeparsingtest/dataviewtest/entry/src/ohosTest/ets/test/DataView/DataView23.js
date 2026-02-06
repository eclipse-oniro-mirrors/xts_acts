/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export function DataView23Test012() {

    function createDataView() {
        const buffer = new ArrayBuffer(40);
        return new DataView(buffer, 10, 20);
    }

    const dataView12 = createDataView();
    const originalBuffer12 = dataView12.buffer;
    return dataView12.buffer === originalBuffer12;
}

export function DataView23Test026() {
    let savedBuffer26;

    function createDataViewWithSave() {
        const buffer = new ArrayBuffer(36);
        savedBuffer26 = buffer;
        return new DataView(buffer, 6, 12);
    }

    const dataView26 = createDataViewWithSave();
    return dataView26.buffer === savedBuffer26;
}

export function DataView23Test038() {
    let buffer38 = new ArrayBuffer(16);
    const dataView38 = new DataView(buffer38);
    let ref38 = buffer38;
    buffer38 = new ArrayBuffer(8);
    return dataView38.buffer === ref38;
}

export function DataView23Test041() {

    function getBuffer41() {
        return new ArrayBuffer(32);
    }

    const buffer41 = getBuffer41();
    const dataView41 = new DataView(buffer41, 10, 12);
    return dataView41.buffer === buffer41;
}

export function DataView23Test071() {
    const buffer71 = new ArrayBuffer(8);
    const dataView71 = new DataView(buffer71);
    const obj71 = { buf: dataView71.buffer };
    return dataView71.buffer === obj71.buf;
}

export function DataView23Test076() {
    let dataView76;
    try {
        const buffer = new ArrayBuffer(15);
        dataView76 = new DataView(buffer, 5, 5);
        throw new Error('测试异常');
    } catch (e) { /* 忽略异常 */
    }
    return dataView76.buffer === dataView76.buffer;
}

export function DataView23Test087() {
    let asyncDataView87;
    (async () => {
        const buffer = new ArrayBuffer(22);
        asyncDataView87 = new DataView(buffer);
    })();
    return asyncDataView87?.buffer === asyncDataView87?.buffer;
}

export function DataView23Test094() {
    class BufferHolder94 {
        constructor() {
            this.buffer = new ArrayBuffer(24);
            this.view = new DataView(this.buffer, 8, 8);
        }
    }

    const holder94 = new BufferHolder94();
    return holder94.view.buffer === holder94.buffer;
}

export function DataView23Test101() {

    function createBufferWithView101() {
        const buffer = new ArrayBuffer(20);
        const view = new DataView(buffer, 5, 10);
        return { buffer, view };
    }

    const { buffer: buffer101, view: view101 } = createBufferWithView101();
    return view101.buffer === buffer101;
}

export function DataView23Test105() {
    const nestedObj105 = {
        inner: {
            buffer: new ArrayBuffer(16),
            view: null
        }
    };
    nestedObj105.inner.view = new DataView(nestedObj105.inner.buffer);
    return nestedObj105.inner.view.buffer === nestedObj105.inner.buffer;
}

export function DataView23Test107() {
    const buffer107 = new ArrayBuffer(12);
    const dataView107 = new DataView(buffer107);
    const weakMap107 = new WeakMap();
    weakMap107.set(dataView107.buffer, 'value');
    return weakMap107.has(dataView107.buffer);
}

export function DataView23Test109() {
    const buffer109 = new ArrayBuffer(9);
    const dataView109 = new DataView(buffer109);
    const fakeBuffer109 = JSON.parse(JSON.stringify(buffer109));
    return dataView109.buffer === fakeBuffer109;
}

export function DataView23Test114() {
    const buffer114 = new ArrayBuffer(25);
    const dataView114 = new DataView(buffer114);
    const map114 = new Map();
    map114.set('buf', dataView114.buffer);
    return dataView114.buffer === map114.get('buf');
}

export function DataView23Test116() {
    const buffer116 = new ArrayBuffer(10);
    const dataView116 = new DataView(buffer116);
    return ArrayBuffer.prototype.isPrototypeOf(dataView116.buffer);
}

export function DataView23Test117() {
    let promiseView117;
    new Promise((resolve) => {
        const buffer = new ArrayBuffer(18);
        promiseView117 = new DataView(buffer, 3, 12);
        resolve();
    });
    return promiseView117?.buffer === promiseView117?.buffer;
}

export function DataView23Test123() {
    const int8Array123 = new Int8Array([-5, 3, -1, 7]);
    const reduced123 = int8Array123.reduce((acc, val) => [...acc, val * 2], []);
    const buffer123 = new Int8Array(reduced123).buffer;
    const dataView123 = new DataView(buffer123, 1, 2);
    return dataView123.buffer === buffer123;
}

export function DataView23Test127() {
    const buffer127 = new ArrayBuffer(15);
    const dataView127 = new DataView(buffer127, 3, 9);
    const bufferSet127 = new Set();
    bufferSet127.add(dataView127.buffer);
    return bufferSet127.has(buffer127);
}

export function DataView23Test130() {
    const moduleLike130 = (() => {
        const buffer = new ArrayBuffer(28);
        return {
            getView: () => new DataView(buffer, 8, 12)
        };
    })();
    const dataView130 = moduleLike130.getView();
    const moduleBuffer130 = dataView130.buffer;
    return dataView130.buffer === moduleBuffer130;
}

export function DataView23Test139() {
    class ParentView139 {
        constructor() {
            this.buffer = new ArrayBuffer(30);
        }
    }

    class ChildView139 extends ParentView139 {
        constructor() {
            super();
            this.view = new DataView(this.buffer, 5, 20);
        }
    }

    const child139 = new ChildView139();
    return child139.view.buffer === child139.buffer;
}




