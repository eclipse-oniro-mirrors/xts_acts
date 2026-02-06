/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import buffer from '@ohos.buffer';

function stringToUint8Array(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

function uint8ArrayToString(fileData: Uint8Array): string {
  let dataString = "";
  for (let i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}

function hex2dec(n: string, m: string): number {
  let tmp: number = 0;
  if (n == "a" || n == "A") {
    tmp += 10 * 16;
  } else if (n == "b" || n == "B") {
    tmp += 11 * 16;
  } else if (n == "c" || n == "C") {
    tmp += 12 * 16;
  } else if (n == "d" || n == "D") {
    tmp += 13 * 16;
  } else if (n == "e" || n == "E") {
    tmp += 14 * 16;
  } else if (n == "f" || n == "F") {
    tmp += 15 * 16;
  } else {
    tmp += Number(n) * 16;
  }

  if (m == "a" || m == "A") {
    tmp += 10;
  } else if (m == "b" || m == "B") {
    tmp += 11;
  } else if (m == "c" || m == "C") {
    tmp += 12;
  } else if (m == "d" || m == "D") {
    tmp += 13;
  } else if (m == "e" || m == "E") {
    tmp += 14;
  } else if (m == "f" || m == "F") {
    tmp += 15;
  }  else {
    tmp += Number(m);
  }

  return tmp;
}

function hexToUint8Array(hexString: string): Uint8Array {
  const length: number = hexString.length;
  if (length % 2 !== 0) {
    throw new Error('Invalid input');
  }
  let a = '[';
  const uint8Array = new Uint8Array(length / 2);
  for (let i = 0; i < length; i += 2) {
    let n: string = `"${hexString[i]}"`;
    let m: string = `"${hexString[i+1]}"`;
    const byteValue = hex2dec(n, m);
    uint8Array[i/2] = byteValue;
    a = a + byteValue + ','
  }
  return uint8Array;
}

function uint8ArrayToHex(data: Uint8Array) {
  return buffer.from(data).toString('hex');
}

export {
  stringToUint8Array, uint8ArrayToString, hexToUint8Array, uint8ArrayToHex
}