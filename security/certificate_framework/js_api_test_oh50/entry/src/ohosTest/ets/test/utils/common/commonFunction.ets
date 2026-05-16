/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { reg } from './commonParam';
import { DataUint8Array, IAnyObj } from './commonType';
import { buffer } from '@kit.ArkTS';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';

function stringToArray(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return arr;
}

//input stream convert to string
function uInt8ArrayToString(fileData: Uint8Array) {
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

//input stream convert to hex format
function uInt8ArrayToShowStr(uInt8Array: Uint8Array): string {
  if (uInt8Array.length == 0) {
    console.error("uInt8ArrayToShowStr length is 0");
  }
  const list: string[] = [];
  for (let index = 0; index < uInt8Array.length; index++) {
    const element = uInt8Array[index];
    const temp = ("00" + element.toString(16)).slice(-2);
    list.push(temp);
  }
  return list.join("");
}

function genIvParamsSpec(n: number) {
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
  let dataBlob: DataUint8Array = { data: dataIv };
  let ivParamSpec: IAnyObj = {
    iv: dataBlob,
    algoName: "IvParamsSpec",
  };
  return ivParamSpec;
}

function genGcmParamsSpec() {
  let arr: number[] = [0, 0, 0, 0, 0, 0, 0, 0];
  let dataAad = new Uint8Array(arr);
  let aadBlob: DataUint8Array = { data: dataAad };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataIv = new Uint8Array(arr);
  let ivBlob: DataUint8Array = { data: dataIv };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag = new Uint8Array(arr);
  let tagBlob: IAnyObj = { data: dataTag };
  let gcmParamsSpec: IAnyObj = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algoName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}

function genCcmParamsSpec() {
  let arr = [0, 0, 0, 0, 0, 0, 0];
  let dataIv = new Uint8Array(arr);
  let ivBlob: DataUint8Array = { data: dataIv };
  arr = [0, 0, 0, 0, 0, 0, 0, 0];
  let dataAad = new Uint8Array(arr);
  let aadBlob: DataUint8Array = { data: dataAad };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag = new Uint8Array(arr);
  let tagBlob: DataUint8Array = { data: dataTag };
  let ccmParamsSpec: IAnyObj = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algoName: "CcmParamsSpec",
  };
  return ccmParamsSpec;
}

function genKeyMaterialBlob(keyLen: number) {
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
  let keyMaterialBlob: DataUint8Array = { data: keyMaterial };
  return keyMaterialBlob;
}

function convertToUint8Array(str: string) {
  const match = str.match(reg);
  let temp: number[] = [];
  if (match) {
    temp = match.map((h) => {
      return Number("0x" + h);
    });
  }
  return new Uint8Array(
    temp
  );
}

function compareString(a: string, b: string): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (buf1.compare(buf2, 0, b.length, 0, a.length) == 0) {
    return true;
  } else {
    return false;
  }
}

function compareUint8Array(a: Uint8Array, b: Uint8Array): boolean {
  let buf1 = buffer.from(a);
  let buf2 = buffer.from(b);
  if (buf1.compare(buf2, 0, b.length, 0, a.length) == 0) {
    return true;
  } else {
    return false;
  }
}

function decToHexString(data: Uint8Array) {
  let arr: string[] = [];
  for (let i = 0; i < data.length; ++i) {
    let tmp: string = "";
    let num: number = data[i];
    tmp = num.toString(16);
    if(tmp.length == 1) {
      tmp = "0" + tmp;
    }
    arr.push("0x" + tmp + ",");
    if (arr.length == 16) {
      console.log("##################### :" + arr);
      arr = []
    }
  }
  console.log("##################### :" + arr);
}

async function createData(dataLen: number): Promise<cryptoFramework.DataBlob>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);

    return rawData;
  } catch (error) {
    console.error('[XTS] create data ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createUint8Array(dataLen: number): Promise<Uint8Array>{
  try {
    let rand: cryptoFramework.Random = cryptoFramework.createRandom();
    let rawData: cryptoFramework.DataBlob = await rand.generateRandom(dataLen);

    return rawData.data;
  } catch (error) {
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
  compareUint8Array,
  decToHexString,
  createData,
  createUint8Array
};
