'use static'
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
import { numA } from './LazyCurrentHapVariable'
import { funcAdd } from './LazyCurrentHapFunc'
import { funcAdd as add } from './LazyCurrentHapFunc'
import { User } from './LazyCurrentHapClass'
// lazy import support har
import { numAHar, funcAddHar, UserHar } from 'lazyhar/Index'

// lazy import support sendable
import { funcAdd as funcAddSendable, User as SendableFuncUser } from './LazySendable'
// lazy import support shared module
import { numA as numAShared, funcAdd as funcAddShared, User as SharedFuncUser } from './LazySharedModule'
import * as dynamicModule from './LazyDynamicImport';

// lazy import support hap
export function lazyImportSupportHap() {
  let msgLog: string = '';
  try {
    msgLog = 'lazy import current hap variable numA=' + numA +
      '\nlazy import current hap func funcAdd(1,2)=' + funcAdd(1, 2) +
      '\nlazy import current hap func funcAdd as add(1,2)=' + add(1, 2) +
      '\nlazy import current hap class User.name=' + new User('lazy import current Hap', 10).name;
    console.log(msgLog);
    if (numA === 123 && funcAdd(1, 2) === 3 && add(1, 2) === 3 && new User('lazy import current Hap', 10).name === 'lazy import current Hap') {
      return 'success';
    }
  } catch (e) {
    console.log('lazy import current hap e' + e.toString());
  }
  return 'failed'
}

// lazy import support har
export function lazyImportSupportHar() {
  let msgLog: string = '';
  try {
    msgLog = 'lazy import har variable numAHar=' + numAHar +
      '\nlazy import har func funcAddHar(1,2)=' + funcAddHar(1, 2) +
      '\nlazy import har class UserHar.name=' + new UserHar('lazy import har', 10).name ;
    console.log(msgLog);
    if (numAHar === 123 && funcAddHar(1, 2) === 3 && new UserHar('lazy import har', 10).name === 'lazy import har' ) {
      return 'success';
    }
  } catch (e) {
    console.log('lazy import current har e' + e.toString());
  }
  return 'failed'
}

export function lazyImportSupportSendable() {
  let msgLog: string = '';
  try {
    msgLog = 'lazy import sendableFuncAdd(1,2)=' + funcAddSendable(1, 2) +
      '\nlazy import SendableFuncUser.name=' + new SendableFuncUser('lazy import sendable', 10).name;
    console.log(msgLog);
    if (funcAddSendable(1, 2) === 3 && new SendableFuncUser('lazy import sendable', 10).name === 'lazy import sendable') {
      return 'success';
    }
  } catch (e) {
    console.log('lazy import sendable e' + e.toString());
  }
  return 'failed'
}

export function lazyImportSupportSharedModule() {
  let msgLog: string = '';
  try {
    msgLog = 'lazy import shared module variable numAShared=' + numAShared +
      '\nlazy import shared module funcAddShared(1,2)=' + funcAddShared(1, 2) +
      '\nlazy import shared module class SendableFuncUser.name=' + new SharedFuncUser('lazy import shared module', 10).name;
    console.log(msgLog);
    if (numAShared === 123 && funcAddShared(1, 2) === 3 && new SharedFuncUser('lazy import shared module', 10).name === 'lazy import shared module') {
      return 'success';
    }
  } catch (e) {
    console.log('lazy import shared module e' + e.toString());
  }
  return 'failed'
}

export async function lazyImportSupportDynamicImport() {
  try {
    if (dynamicModule.res === 'success') {
      console.log('lazy import in dynamic module success');
      return 'success';
    }
  } catch (e) {
    console.log('lazy import in dynamic module e' + e.toString());
  }
  return 'failed'
}