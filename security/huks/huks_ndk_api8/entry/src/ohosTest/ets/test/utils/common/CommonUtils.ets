/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { buffer, util } from '@kit.ArkTS';

export function StringToUint8Array(str: String) {
  let arr: number[] = new Array();
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

export function Uint8ArrayToString(fileData: Uint8Array) {
  let str: string = "";
  for (let i = 0; i < fileData.length; i++) {
    str += String.fromCharCode(fileData[i]);
  }
  return str;
}

export function HexToUint8Array(hexString: string) {
  const length: number = hexString.length;
  if (length % 2 !== 0) {
    throw new Error('Invalid input');
  }
  let a = '[';
  const uint8Array = new Uint8Array(length / 2);
  for (let i = 0; i < length; i += 2) {
    const byteValue = parseInt(hexString[i] + hexString[i+1], 16);
    uint8Array[i/2] = byteValue;
    a = a + byteValue + ','
  }
  return uint8Array;
}

export function Uint8ArrayToHexString(data: Uint8Array) {
  return buffer.from(data).toString('hex');
}

export function GetDataBySize(size: number) {
  return 'A'.repeat(size);
}

export function Uint8ArrayToStringAscii(data: Uint8Array): string {
  return String.fromCharCode(...data);
}

export function StringToUint8ArrayBak(str: string) {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}

export async function Sleep(ms: number) {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms)
  })
}