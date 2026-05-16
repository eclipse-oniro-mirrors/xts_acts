/*
 * Copyright (C) 2024-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import cryptoFramework from '@ohos.security.cryptoFramework';
import buffer from '@ohos.buffer';

enum asyncType {
  TYPE_IS_SYNC = 0,
  TYPE_IS_PROMISE = 1,
  TYPE_IS_CALLBACK = 2,
}

function stringToUint8Array(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return new Uint8Array(arr);
}


function stringToHex(n: number): string {
  let tmp: string = "";
  if (n < 10) {
    tmp += `0${n}`
  } else if (n == 10) {
    tmp += "0a"
  }  else if (n == 11) {
    tmp += "0b"
  } else if (n == 12) {
    tmp += "0c"
  } else if (n == 13) {
    tmp += "0d"
  } else if (n == 14) {
    tmp += "0e"
  } else if (n == 15) {
    tmp += "0f"
  } else if (n > 15) {
    let tmpi: string = ""
    let j = n % 16
    let i = (n - j) / 16
    if (i < 10) {
      tmpi += `${i}`
    } else if (i == 10) {
      tmpi += "a"
    }  else if (i == 11) {
      tmpi += "b"
    } else if (i == 12) {
      tmpi += "c"
    } else if (i == 13) {
      tmpi += "d"
    } else if (i == 14) {
      tmpi += "e"
    } else if (i == 15) {
      tmpi += "f"
    }
    if (j < 10) {
      tmpi += `${j}`
    } else if (j == 10) {
      tmpi += "a"
    }  else if (j == 11) {
      tmpi += "b"
    } else if (j == 12) {
      tmpi += "c"
    } else if (j == 13) {
      tmpi += "d"
    } else if (j == 14) {
      tmpi += "e"
    } else if (j == 15) {
      tmpi += "f"
    }
    tmp += tmpi
  }

  return tmp;
}

function decToHexString(data: cryptoFramework.DataBlob): string {
  let arr: string = "";
  for (let i = 0; i < data.data.length; ++i) {
    let tmp: string = "";
    let num: number = data.data[i];
    // tmp = num.toString(16);
    // if(tmp.length == 1) {
    //   tmp = "0" + tmp;
    // }
    tmp = stringToHex(num);
    arr += tmp;
  }
  return arr;
}

function convertToUint8Array(str: string): number[] {
  let tmp: number[] = [];
  for (let i = 0; i < str.length; i++) {
    // tmp[j] = Number("0x" + str.substring(i, i+2));
    tmp.push(Number("0x" + str.substring(i, i+2)));
    i++;
  }

  return tmp;
}

function compareDataBlob(a: cryptoFramework.DataBlob|null, b: cryptoFramework.DataBlob|null): boolean {
  if (a === null || b === null) {
    return false;
  }
  let buf1 = buffer.from(a.data);
  let buf2 = buffer.from(b.data);
  if (buf1.compare(buf2, 0, a.data.byteLength as int, 0, b.data.byteLength as int) == 0) {
    return true;
  } else {
    return false;
  }
}

function compareNumber(a: number[], b: number[]): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (buf1.compare(buf2, 0, b.length as int, 0, a.length as int) == 0) {
    return true;
  } else {
    return false;
  }
}

function compareUint8Array(a: Uint8Array, b: Uint8Array): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (buf1.compare(buf2, 0, a.byteLength as int, 0, b.byteLength as int) == 0) {
    return true;
  } else {
    return false;
  }
}

function compareString(a: string, b: string): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (buf1.compare(buf2, 0, b.length as int, 0, a.length as int) == 0) {
    return true;
  } else {
    return false;
  }
}

async function createData(dataLen: int): Promise<cryptoFramework.DataBlob>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);
    rawData.data[0] = 0 as number;

    return rawData;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createFullData(dataLen: int): Promise<cryptoFramework.DataBlob>{
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
  compareString,
  asyncType,
  compareUint8Array
}