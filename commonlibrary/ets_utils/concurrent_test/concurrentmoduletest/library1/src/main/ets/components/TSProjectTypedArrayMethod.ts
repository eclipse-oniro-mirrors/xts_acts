/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
const TSsharedBuffer1: SharedArrayBuffer = new SharedArrayBuffer(8);

export const TSint8Array: Int8Array = new Int8Array(TSsharedBuffer1);

const TSsharedBuffer2: SharedArrayBuffer = new SharedArrayBuffer(8);

export const TSuint8Array: Uint8Array = new Uint8Array(TSsharedBuffer2);

const TSsharedBuffer3: SharedArrayBuffer = new SharedArrayBuffer(8);

export const TSuint8ClampedArray: Uint8ClampedArray = new Uint8ClampedArray(TSsharedBuffer3);


const TSsharedBuffer4: SharedArrayBuffer = new SharedArrayBuffer(16);

export const TSint16Array: Int16Array = new Int16Array(TSsharedBuffer4);

const TSsharedBuffer5: SharedArrayBuffer = new SharedArrayBuffer(16);

export const TSuint16Array: Uint16Array = new Uint16Array(TSsharedBuffer5);


const TSsharedBuffer6: SharedArrayBuffer = new SharedArrayBuffer(32);

export const TSint32Array: Int32Array = new Int32Array(TSsharedBuffer6);

const TSsharedBuffer7: SharedArrayBuffer = new SharedArrayBuffer(32);

export const TSuint32Array: Uint32Array = new Uint32Array(TSsharedBuffer7);

const TSsharedBuffer8: SharedArrayBuffer = new SharedArrayBuffer(32);

export const TSfloat32Array: Float32Array = new Float32Array(TSsharedBuffer8);


const TSsharedBuffer9: SharedArrayBuffer = new SharedArrayBuffer(64);

export const TSbigint64Array: BigInt64Array = new BigInt64Array(TSsharedBuffer9);

const TSsharedBuffer10: SharedArrayBuffer = new SharedArrayBuffer(64);

export const TSbiguint64Array: BigUint64Array = new BigUint64Array(TSsharedBuffer10);