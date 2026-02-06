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
const JSsharedBuffer1 = new SharedArrayBuffer(8);

export const JSint8Array = new Int8Array(JSsharedBuffer1);

const JSsharedBuffer2 = new SharedArrayBuffer(8);

export const JSuint8Array = new Uint8Array(JSsharedBuffer2);

const JSsharedBuffer3 = new SharedArrayBuffer(8);

export const JSuint8ClampedArray = new Uint8ClampedArray(JSsharedBuffer3);


const JSsharedBuffer4 = new SharedArrayBuffer(16);

export const JSint16Array = new Int16Array(JSsharedBuffer4);

const JSsharedBuffer5 = new SharedArrayBuffer(16);

export const JSuint16Array = new Uint16Array(JSsharedBuffer5);


const JSsharedBuffer6 = new SharedArrayBuffer(32);

export const JSint32Array = new Int32Array(JSsharedBuffer6);

const JSsharedBuffer7 = new SharedArrayBuffer(32);

export const JSuint32Array = new Uint32Array(JSsharedBuffer7);

const JSsharedBuffer8 = new SharedArrayBuffer(32);

export const JSfloat32Array = new Float32Array(JSsharedBuffer8);


const JSsharedBuffer9 = new SharedArrayBuffer(64);

export const JSbigint64Array = new BigInt64Array(JSsharedBuffer9);

const JSsharedBuffer10 = new SharedArrayBuffer(64);

export const JSbiguint64Array = new BigUint64Array(JSsharedBuffer10);