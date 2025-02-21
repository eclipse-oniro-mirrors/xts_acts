/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
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

function stringToArray(str) {
  var arr = [];
  for (var i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  return arr;
}

//字节流转成可理解的字符串
function uInt8ArrayToString(fileData) {
  var dataString = "";
  for (var i = 0; i < fileData.length; i++) {
    dataString += String.fromCharCode(fileData[i]);
  }
  return dataString;
}

//可理解的字符串转成自字节流
function stringTouInt8Array(str) {
  if (str.length == 0) {
    console.error("stringTouInt8Array length is 0");
  }
  var arr = [];
  for (var i = 0, j = str.length; i < j; ++i) {
    arr.push(str.charCodeAt(i));
  }
  var tmpUint8Array = new Uint8Array(arr);
  return tmpUint8Array;
}

//字节流以16进制形式输出
function uInt8ArrayToShowStr(uInt8Array) {
  if (uInt8Array.length == 0) {
    console.error("uInt8ArrayToShowStr length is 0");
  }
  return Array.prototype.map
    .call(uInt8Array, (x) => ("00" + x.toString(16)).slice(-2))
    .join("");
}

export {
  stringToArray,
  uInt8ArrayToString,
  stringTouInt8Array,
  uInt8ArrayToShowStr,
};
