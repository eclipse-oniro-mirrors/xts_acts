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

/**
 * 定义常量类
 */
export class Constant {
  static readonly SLEEP_TIME_100: number = 100;
  static readonly PARAM_EORRCODE: string = "401";
  static readonly PERM_EORRCODE: string = "13900012";
  static readonly ARGS_EORRCODE: string = "13900020";
  static readonly SYSTEM_EORRCODE: string = "14000011";
}

export function sleep(ms: int): Promise<string> {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export function rand_sleep(ms: int): Promise<string> {
  let random: int = Math.floor(Math.random() * ms) as int;
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('');
    }, random);
  });
}
