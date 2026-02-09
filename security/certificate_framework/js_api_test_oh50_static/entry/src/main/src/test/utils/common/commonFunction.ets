/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { expect } from "../../../../../hypium/index";
import { BusinessError } from '@ohos.base';
import cryptoFramework from "@ohos.security.cryptoFramework";
import { reg } from './commonParam';
import buffer from '@ohos.buffer';

function stringToArray(str: string): number[] {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return arr;
}

//input stream convert to string
function uInt8ArrayToString(fileData: Uint8Array): string {
  let dataString = "";
  for (let i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}

//string convert to input stream
function stringTouInt8Array(str: string): Uint8Array {
  if (str.length == 0) {
    console.error("stringTouInt8Array length is 0");
  }
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  let tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
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

//input stream convert to hex format
function uInt8ArrayToShowStr(uInt8Array: Uint8Array): string {
  if (uInt8Array.length == 0) {
    console.error("uInt8ArrayToShowStr length is 0");
  }
  const list: string[] = [];
  for (let index = 0; index < uInt8Array.length; index++) {
    const element = uInt8Array[index];
    // const temp = ("00" + element.toString(16)).slice(-2);
    const temp = stringToHex(element);
    list.push(temp);
  }
  return list.join("");
}

function genIvParamsSpec(n: number): cryptoFramework.IvParamsSpec|null {
  let arr: number[];
  if (n == 8) {
    arr = [0, 0, 0, 0, 0, 0, 0, 0];
  } else if (n == 16) {
    arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  } else {
    console.error("genIvParamsSpec error: n = " + n);
    return null;
  }
  let dataIv = new Uint8Array(arr);
  let dataBlob: cryptoFramework.DataBlob = { data: dataIv };
  let ivParamSpec: cryptoFramework.IvParamsSpec = {
    iv: dataBlob,
    algName: "IvParamsSpec",
  };
  return ivParamSpec;
}

function genGcmParamsSpec(): cryptoFramework.GcmParamsSpec {
  let arr: number[] = [0, 0, 0, 0, 0, 0, 0, 0];
  let dataAad = new Uint8Array(arr);
  let aadBlob: cryptoFramework.DataBlob = { data: dataAad };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataIv = new Uint8Array(arr);
  let ivBlob: cryptoFramework.DataBlob = { data: dataIv };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag = new Uint8Array(arr);
  let tagBlob: cryptoFramework.DataBlob = { data: dataTag };
  let gcmParamsSpec: cryptoFramework.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}

function genCcmParamsSpec(): cryptoFramework.CcmParamsSpec {
  let arr: number[] = [0, 0, 0, 0, 0, 0, 0];
  let dataIv = new Uint8Array(arr);
  let ivBlob: cryptoFramework.DataBlob = { data: dataIv };
  arr = [0, 0, 0, 0, 0, 0, 0, 0];
  let dataAad = new Uint8Array(arr);
  let aadBlob: cryptoFramework.DataBlob = { data: dataAad };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag = new Uint8Array(arr);
  let tagBlob: cryptoFramework.DataBlob = { data: dataTag };
  let ccmParamsSpec: cryptoFramework.CcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "CcmParamsSpec",
  };
  return ccmParamsSpec;
}

function genKeyMaterialBlob(keyLen: number): cryptoFramework.DataBlob {
  let arr: number[];
  if (keyLen == 128) {
    //16 bytes
    arr = [
      0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56, 0xad, 0x47, 0xfc, 0x5a,
      0x46, 0x39, 0xee, 0x7c,
    ];
  } else if (keyLen == 192) {
    //24 bytes
    arr = [
      0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56, 0xad, 0x47, 0xfc, 0x5a,
      0x46, 0x39, 0xee, 0x7c, 0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56,
    ];
  } else if (keyLen == 256) {
    //32 bytes
    arr = [
      0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56, 0xad, 0x47, 0xfc, 0x5a,
      0x46, 0x39, 0xee, 0x7c, 0xba, 0x3b, 0xc2, 0x71, 0x21, 0x1e, 0x30, 0x56,
      0xad, 0x47, 0xfc, 0x5a, 0x46, 0x39, 0xee, 0x7c,
    ];
  } else {
    console.error("genKeyMaterialBlob: KeyLen may be error");
    arr = [];
    for (let i = 0; i < keyLen; i++) {
      arr[i] = 0xba;
    }
  }

  let keyMaterial = new Uint8Array(arr);
  let keyMaterialBlob: cryptoFramework.DataBlob = { data: keyMaterial };
  return keyMaterialBlob;
}

function convertToUint8Array(str: string): Uint8Array {
  let tmp: number[] = [];
  for (let i = 0; i < str.length; i++) {
    tmp.push(Number("0x" + str.substring(i, i+2)));
    i++;
  }
  return new Uint8Array(
    tmp
  );
}

function compareString(a: string, b: string): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (b.length !== a.length) {
    return false;
  }
  if (buf1.compare(buf2, 0, b.length as int, 0, a.length as int) == 0) {
    return true;
  } else {
    return false;
  }
}

function compareUint8Array(a: Uint8Array, b: Uint8Array): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (b.length !== a.length) {
    return false;
  }
  if (buf1.compare(buf2, 0, b.length, 0, a.length) == 0) {
    return true;
  } else {
    return false;
  }
}

async function createUint8Array(dataLen: int): Promise<Uint8Array>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);

    return rawData.data;
  } catch (error: BusinessError) {
    console.error('[XTS] create data ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createData(dataLen: int): Promise<cryptoFramework.DataBlob>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);

    return rawData;
  } catch (error: BusinessError) {
    console.error('[XTS] create data ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}


export {
  stringToArray,
  uInt8ArrayToString,
  stringTouInt8Array,
  uInt8ArrayToShowStr,
  genGcmParamsSpec,
  genIvParamsSpec,
  genCcmParamsSpec,
  genKeyMaterialBlob,
  convertToUint8Array,
  compareString,
  createData,
  createUint8Array,
  compareUint8Array
};
