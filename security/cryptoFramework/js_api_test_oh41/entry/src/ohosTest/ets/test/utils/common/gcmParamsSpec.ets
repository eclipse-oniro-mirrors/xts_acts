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
import crypto from '@ohos.security.cryptoFramework';

function genGcmParamsSpecWithVariableLength(aadLength: number, ivLength: number): crypto.GcmParamsSpec {
  let arrAAD: Array<number> = [];
  for (let i = 0; i < aadLength; i++) {
    arrAAD.push(0);
  }
  let dataAAD: Uint8Array = new Uint8Array(arrAAD);
  console.log("dataAAD length is: " + dataAAD.length);
  let aadBlob: crypto.DataBlob = { data: dataAAD };
  let arrIV: Array<number> = [];
  for (let i = 0; i < ivLength; i++) {
    arrIV.push(0);
  }
  let dataIV: Uint8Array = new Uint8Array(arrIV);
  console.log("dataIV length is: " + dataIV.length);
  let ivBlob: crypto.DataBlob = { data: dataIV };
  let arrTag: Array<number> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag: Uint8Array = new Uint8Array(arrTag);
  let tagBlob: crypto.DataBlob = { data: dataTag };
  let gcmParamsSpec: crypto.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}

function genGcmParamsSpecNullAAD(): crypto.GcmParamsSpec {
  let ivArr: Array<number> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataIv: Uint8Array = new Uint8Array(ivArr);
  let ivBlob: crypto.DataBlob = { data: dataIv };
  let tagArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag: Uint8Array = new Uint8Array(tagArr);
  let tagBlob: crypto.DataBlob = { data: dataTag };
  let gcmParamsSpec: crypto.GcmParamsSpec = {
    iv: ivBlob,
    aad: {data: new Uint8Array([])},
    authTag: tagBlob,
    algName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}

function genGcmParamsSpecEmptyAAD(): crypto.GcmParamsSpec {
  let dataAAd: Uint8Array = new Uint8Array();
  let aadBlob: crypto.DataBlob = { data: dataAAd };
  let ivArr: Array<number> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataIv: Uint8Array = new Uint8Array(ivArr);
  let ivBlob: crypto.DataBlob = { data: dataIv };
  let tagArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag: Uint8Array = new Uint8Array(tagArr);
  let tagBlob: crypto.DataBlob = { data: dataTag };
  let gcmParamsSpec: crypto.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}

function genGcmParamsSpecAADNullData(): crypto.GcmParamsSpec {
  let aadBlob: crypto.DataBlob = { data: new Uint8Array([]) };
  let ivArr: Array<number> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataIv: Uint8Array = new Uint8Array(ivArr);
  let ivBlob: crypto.DataBlob = { data: dataIv };
  let tagArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag: Uint8Array = new Uint8Array(tagArr);
  let tagBlob: crypto.DataBlob = { data: dataTag };
  let gcmParamsSpec: crypto.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}

function genGcmParamsSpecWithoutAADData() {
  let aadBlob: crypto.DataBlob = { data: new Uint8Array([]) };
  let ivArr: Array<number> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataIv: Uint8Array = new Uint8Array(ivArr);
  let ivBlob: crypto.DataBlob = { data: dataIv };
  let tagArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag: Uint8Array = new Uint8Array(tagArr);
  let tagBlob: crypto.DataBlob = { data: dataTag };
  let gcmParamsSpec: crypto.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}

function genGcmParamsSpecWithoutAAD() {
  let aadBlob: crypto.DataBlob = { data: new Uint8Array([]) };
  let ivArr: Array<number> = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataIv: Uint8Array = new Uint8Array(ivArr);
  let ivBlob: crypto.DataBlob = { data: dataIv };
  let tagArr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag: Uint8Array = new Uint8Array(tagArr);
  let tagBlob: crypto.DataBlob = { data: dataTag };
  let gcmParamsSpec: crypto.GcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "GcmParamsSpec",
  };
  return gcmParamsSpec;
}


function createGcmParam(paramType: string, aadLength: number = 0, ivLength: number = 0): crypto.GcmParamsSpec {
  let params: crypto.GcmParamsSpec = {} as crypto.GcmParamsSpec;
  try {
    switch (paramType) {
      case 'genGcmParamsSpecNullAAD':
        params = genGcmParamsSpecNullAAD();
        break;
      case 'genGcmParamsSpecEmptyAAD':
        params = genGcmParamsSpecEmptyAAD();
        break;
      case 'genGcmParamsSpecAADNullData':
        params = genGcmParamsSpecAADNullData();
        break;
      case 'genGcmParamsSpecWithoutAAD':
        let paramsErr1: crypto.GcmParamsSpec = genGcmParamsSpecWithoutAAD();
        return paramsErr1;
      case 'genGcmParamsSpecWithoutAADData':
        let paramsErr2: crypto.GcmParamsSpec = genGcmParamsSpecWithoutAADData();
        return paramsErr2;
      case 'genGcmParamsSpecWithVariableLength':
        let paramsVarLen: crypto.GcmParamsSpec = genGcmParamsSpecWithVariableLength(aadLength, ivLength);
        return paramsVarLen;
      default:
        break;
    }
    return params;
  } catch (err) {
    throw err as Error;
  }
}

export { createGcmParam };