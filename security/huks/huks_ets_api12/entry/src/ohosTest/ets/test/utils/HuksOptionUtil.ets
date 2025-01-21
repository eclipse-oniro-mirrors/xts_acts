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
import huks from '@ohos.security.huks';

export function genParam(paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): huks.HuksParam {
  return {
    tag: paramTag,
    value: paramValue
  } as huks.HuksParam;
}

export function setParam(huksOption: huks.HuksOptions, paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): void {
  let properties: Array<huks.HuksParam> = huksOption.properties as Array<huks.HuksParam>;
  deleteParam(huksOption, paramTag);
  properties.push(genParam(paramTag, paramValue));
}

export function deleteParam(huksOption: huks.HuksOptions, paramTag: huks.HuksTag): void {
  let properties: Array<huks.HuksParam> = huksOption.properties as Array<huks.HuksParam>;
  for (let i = 0; i < properties.length; i++) {
    if (properties[i].tag == paramTag) {
      properties.splice(i, 1);
      break;
    }
  }
}

export function getDataBySize(size: number): string {
  if (size <= 0) {
    return "";
  }
  let strArr: Array<string> = new Array(size);
  strArr.fill("A");
  return strArr.join("");
}

