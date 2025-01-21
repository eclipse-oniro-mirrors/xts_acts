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

import fileIO from "@ohos.file.fs";
import util from "@ohos.util";
import { describe, it, expect } from "@ohos/hypium";
import common from '@ohos.app.ability.common';

export const FILE_CONTENT: string = "hello world";

export default class GlobalContext {
  private constructor() {
  }

  private static instance: GlobalContext;
  private _abilityContext: common.UIAbilityContext = undefined;

  public static getContext(): GlobalContext {
    if (!GlobalContext.instance) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  getAbility(): common.UIAbilityContext {
    return this._abilityContext;
  }

  setAbility(ability: common.UIAbilityContext): void {
    this._abilityContext = ability;
  }
}

export function prepareFile(fpath: string, content: string | ArrayBuffer) {
  try {
    let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE);
    fileIO.truncateSync(file.fd);
    fileIO.writeSync(file.fd, content);
    fileIO.fsyncSync(file.fd);
    fileIO.closeSync(file);
    return true;
  } catch (e) {
    console.log("Failed to prepareFile for " + e);
    return false;
  }
}

export async function nextFileName(testName: string) {
  let context: common.UIAbilityContext = GlobalContext.getContext().getAbility();
  let data: string = context.cacheDir;
  let BASE_PATH = data + "/";
  return BASE_PATH + testName + "_" + randomString(testName.length);
}

export async function fileName(testName: string) {
  let context: common.UIAbilityContext = GlobalContext.getContext().getAbility();
  let data: string = context.filesDir;
  let BASE_PATH = data + "/";
  return BASE_PATH + testName + "_" + randomString(testName.length);
}

export function randomString(num: number) {
  let len: number = num;
  let $chars: string = "aaaabbbbcccc";
  let maxPos: number = $chars.length;
  let pwd: string = "";
  for (let i: number = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  return pwd;
}

function isIntNum(val: number) {
  return typeof val === "number" && val % 1 === 0;
}

function isBigInt(val: bigint) {
  return typeof val === "bigint";
}

function isString(str: string) {
  return typeof str == "string" && str.constructor == String;
}

function isBoolean(val: boolean) {
  return typeof val == "boolean";
}

export { fileIO, isIntNum, isBigInt, isString, isBoolean, describe, it, expect, util };
