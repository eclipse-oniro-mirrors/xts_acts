/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import cryptoFramework from '@ohos.security.cryptoFramework';

function stringToUint8Array(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}

function decToHexString(data: cryptoFramework.DataBlob): string {
  let arr: string = "";
  for (let i = 0; i < data.data.length; ++i) {
    let tmp: string = "";
    let num: number = data.data[i];
    tmp = num.toString(16);
    if(tmp.length == 1) {
      tmp = "0" + tmp;
    }
    arr += tmp;
  }
  return arr;
}

function convertToUint8Array(str: string): number[] {
  let tmp: number[] = [];
  let j: number = 0;
  for (let i = 0; i < str.length; i++) {
    tmp[j] = Number("0x" + str.substring(i, i+2));
    j++;
    i++;
  }

  return tmp;
}

function compareDataBlob(a: cryptoFramework.DataBlob, b: cryptoFramework.DataBlob): boolean {
  if (a.data.length != b.data.length) {
    return false;
  }
  for (let i = 0; i < a.data.length; i++) {
    if (a.data[i] !== b.data[i]) {
      return false;
    }
  }
  return true;
}

function compareNumber(a: number[], b: number[]): boolean {
  if (a.length != b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) {
      return false;
    }
  }
  return true;
}

function compareString(a: string, b: string): boolean {
  if (a.length != b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) {
      return false;
    }
  }
  return true;
}

async function createData(dataLen: number): Promise<cryptoFramework.DataBlob>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);
    rawData.data[0] = 0;

    return rawData;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createFullData(dataLen: number): Promise<cryptoFramework.DataBlob>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);

    return rawData;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export {
  stringToUint8Array,
  decToHexString,
  convertToUint8Array,
  compareDataBlob,
  createData,
  createFullData,
  compareNumber,
  compareString
}