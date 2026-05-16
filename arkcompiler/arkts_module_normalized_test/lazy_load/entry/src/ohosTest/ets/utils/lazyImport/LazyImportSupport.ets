/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// lazy import support current hap
import lazy { numA } from "./LazyCurrentHapVariable"
import lazy { funcAdd } from "./LazyCurrentHapFunc"
import lazy { funcAdd as add } from  "./LazyCurrentHapFunc"
import lazy { User } from "./LazyCurrentHapClass"
import lazy { add as hapSoAdd } from "libentry.so"
// lazy import support har
import lazy { numAHar, funcAddHar, UserHar, harSoAdd } from "lazyhar"
// lazy import support hsp
import lazy { numAHsp, funcAddHsp, UserHsp, hspSoAdd } from "lazyhsp"
// lazy import support worker
import { worker } from "@kit.ArkTS"
// lazy import support sendable
import { funcAdd as funcAddSendable, User as SendableFuncUser } from "./LazySendable"
// lazy import support shared module
import { numA as numAShared, funcAdd as funcAddShared, User as SharedFuncUser } from "./LazySharedModule"


// lazy import support hap
export function lazyImportSupportHap() {
  let msgLog: string = '';
  try {
    msgLog = "lazy import current hap variable numA=" + numA +
      "\nlazy import current hap func funcAdd(1,2)=" + funcAdd(1, 2) +
      "\nlazy import current hap func funcAdd as add(1,2)=" + add(1, 2) +
      "\nlazy import current hap class User.name=" + new User("lazy import current Hap", 10).name +
      "\nlazy import current hap func so add(1,2)=" + hapSoAdd(1, 2);
    console.log(msgLog);
    if (numA === 123 && funcAdd(1, 2) === 3 && add(1, 2) === 3 && new User("lazy import current Hap", 10).name === "lazy import current Hap" && hapSoAdd(1, 2) === 3) {
      return "success";
    }
  } catch (e) {
    console.log("lazy import current hap e" + e.toString());
  }
  return "failed"
}

// lazy import support har
export function lazyImportSupportHar() {
  let msgLog: string = '';
  try {
    msgLog = "lazy import har variable numAHar=" + numAHar +
      "\nlazy import har func funcAddHar(1,2)=" + funcAddHar(1, 2) +
      "\nlazy import har class UserHar.name=" + new UserHar("lazy import har", 10).name +
      "\nlazy import har func so add(1,2)=" + harSoAdd(1, 2);
    console.log(msgLog);
    if (numAHar === 123 && funcAddHar(1, 2) === 3 && new UserHar("lazy import har", 10).name === "lazy import har" && harSoAdd(1, 2) === 3) {
      return "success";
    }
  } catch (e) {
    console.log("lazy import current har e" + e.toString());
  }
  return "failed"
}

// lazy import support hsp
export function lazyImportSupportHsp() {
  let msgLog: string = '';
  try {
    msgLog = "lazy import hsp variable numAHsp=" + numAHsp +
      "\nlazy import hsp func funcAddHsp(1,2)=" + funcAddHsp(1, 2) +
      "\nlazy import hsp class UserHsp.name=" + new UserHsp("lazy import hsp", 10).name +
      "\nlazy import hsp func so add(1,2)=" + hspSoAdd(1, 2);
    console.log(msgLog);
    if (numAHsp === 123 && funcAddHsp(1, 2) === 3 && new UserHsp("lazy import hsp", 10).name === "lazy import hsp" && hspSoAdd(1, 2) === 3) {
      return "success";
    }
  } catch (e) {
    console.log("lazy import current hsp e" + e.toString());
  }
  return "failed"
}

export function lazyImportSupportWorker() {
  try {
    let threadWorker = new worker.ThreadWorker("./LazyWorker")
    threadWorker.postMessage("lazy import worker");
    console.log("lazy import worker success");
    return "success";
  } catch (e) {
    console.log("lazy import worker e" + e.toString());
  }
  return "failed"
}

export function lazyImportSupportSendable() {
  let msgLog: string = '';
  try {
    msgLog = "lazy import sendableFuncAdd(1,2)=" + funcAddSendable(1, 2) +
      "\nlazy import SendableFuncUser.name=" + new SendableFuncUser("lazy import sendable", 10).name +
    console.log(msgLog);
    if (funcAddSendable(1, 2) === 3 && new SendableFuncUser("lazy import sendable", 10).name === "lazy import sendable") {
      return "success";
    }
  } catch (e) {
    console.log("lazy import sendable e" + e.toString());
  }
  return "failed"
}

export function lazyImportSupportSharedModule() {
  let msgLog: string = '';
  try {
    msgLog = "lazy import shared module variable numAShared=" + numAShared +
      "\nlazy import shared module funcAddShared(1,2)=" + funcAddShared(1, 2) +
      "\nlazy import shared module class SendableFuncUser.name=" + new SharedFuncUser("lazy import shared module", 10).name +
    console.log(msgLog);
    if (numAShared === 123 && funcAddShared(1, 2) === 3 && new SharedFuncUser("lazy import shared module", 10).name === "lazy import shared module") {
      return "success";
    }
  } catch (e) {
    console.log("lazy import shared module e" + e.toString());
  }
  return "failed"
}

export async function lazyImportSupportDynamicImport() {
  try {
    let dynamicModule = await import("./LazyDynamicImport");
    if (dynamicModule.res === "success") {
      console.log("lazy import in dynamic module success");
      return "success";
    }
  } catch (e) {
    console.log("lazy import in dynamic module e" + e.toString());
  }
  return "failed"
}