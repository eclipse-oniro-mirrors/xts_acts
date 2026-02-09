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

function stringToArray(str: string) {
  let arr: number[] = [];
  for (let i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return arr;
}

//字节流转成可理解的字符串
function uInt8ArrayToString(fileData: Uint8Array): string {
  let dataString: string = "";
  for (let i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}

//可理解的字符串转成自字节流
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

//字节流以16进制形式输出
function uInt8ArrayToShowStr(uInt8Array: Uint8Array): string {
  let arr: string = "";
  for (let i = 0; i < uInt8Array.length; ++i) {
    let tmp: string = "";
    let num: number = uInt8Array[i];
    tmp = stringToHex(num);
    // tmp = num.toString(16);
    // if(tmp.length == 1) {
    //   tmp = "0" + tmp;
    // }
    arr += tmp;
  }
  return arr;
}

function genIvParamsSpec(n: number): crypto.IvParamsSpec|null {
  let arr: number[] = [0];
  if (n == 8) {
    arr = [0, 0, 0, 0, 0, 0, 0, 0];
  } else if (n == 16) {
    arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  } else {
    console.error("genIvParamsSpec error: n = " + n);
    return null;
  }
  let dataIv = new Uint8Array(arr);
  let dataBlob: crypto.DataBlob = { data: dataIv };
  let ivParamSpec: crypto.IvParamsSpec = {
    iv: dataBlob,
    algName: "IvParamsSpec",
  };
  return ivParamSpec;
}

function genCcmParamsSpec(): crypto.CcmParamsSpec {
  let arr: number[] = [0, 0, 0, 0, 0, 0, 0];
  let dataIv = new Uint8Array(arr);
  let ivBlob: crypto.DataBlob = { data: dataIv };
  arr = [0, 0, 0, 0, 0, 0, 0, 0];
  let dataAad = new Uint8Array(arr);
  let aadBlob: crypto.DataBlob = { data: dataAad };
  arr = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  let dataTag = new Uint8Array(arr);
  let tagBlob: crypto.DataBlob = { data: dataTag };
  let ccmParamsSpec: crypto.CcmParamsSpec = {
    iv: ivBlob,
    aad: aadBlob,
    authTag: tagBlob,
    algName: "CcmParamsSpec",
  };
  return ccmParamsSpec;
}

//分段打印原始字符串
function sliceAndPrintString(sourceString: string, MaxLength: number) {
  let count: int;
  if (MaxLength < 1 || MaxLength > 1023) {
    console.log("MaxLength Value Error , range is: [1, 1023]");
  }
  if (sourceString.length <= MaxLength) {
    console.log(sourceString);
  } else {
    count = Math.ceil(sourceString.length / MaxLength).toInt()
    for (let i = 0; i <= count; i++) {
      console.log(sourceString.substring(i * MaxLength.toInt(), (i + 1) * MaxLength.toInt()));
    }
  }
}

export {
  stringToArray,
  uInt8ArrayToString,
  stringTouInt8Array,
  uInt8ArrayToShowStr,
  genIvParamsSpec,
  genCcmParamsSpec,
  sliceAndPrintString
};
