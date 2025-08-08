/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { ArkTSUtils, collections, lang } from '@kit.ArkTS';

@Concurrent
export function shareTypeTask0001(data: collections.ConcatArray<number>): collections.ConcatArray<number> {
  return data.slice(0, 1);
}

@Concurrent
export function shareTypeTask0002(data: collections.Array<number>): collections.Array<number> {
  data.push(1);
  return data;
}

@Concurrent
export function shareTypeTask0003(data: collections.Map<string, string>): collections.Map<string, string> {
  data.set('key', 'value');
  return data;
}

@Concurrent
export function shareTypeTask0004(data: collections.Set<number>): collections.Set<number> {
  data.add(1);
  return data;
}

@Concurrent
export function shareTypeTask0005(data: collections.BitVector): collections.BitVector {
  data.push(1);
  return data;
}

@Concurrent
export function shareTypeTask0006(data: ArkTSUtils.locks.AsyncLock): ArkTSUtils.locks.AsyncLock {
  data.lockAsync(() => {
    console.info(`shareTypeTask0006 locks name: ${data.name}`);
  });
  return data;
}

@Concurrent
export function shareTypeTask0007(data: lang.ISendable): lang.ISendable {
  ArkTSUtils.ASON.stringify(data);
  return data;
}

@Sendable
export class SendableClass {
  count_: number = 0;
  static count: number = 1;

  static getPromiseCount(): number {
    return SendableClass.count;
  }
}

@Concurrent
export function shareTypeTask0008(data: number): number {
  data = 1;
  return data;
}

@Sendable
export function SendableFunc(): boolean {
  console.info(`SendableFunc done`);
  return true;
}

@Concurrent
export function shareTypeTaskFun(data: Function): Function {
  data();
  return data;
}

@Concurrent
export function shareTypeTask0011(data: SendableClass): SendableClass {
  data.count_ = 1;
  return data;
}

@Concurrent
export function shareTypeTask0013(data: number): number {
  return data + 1;
}

@Sendable
export class ISendableClass implements lang.ISendable {
  count: number = 0;
}

@Concurrent
export function shareTypeTask0015(data: ISendableClass): ISendableClass {
  data.count = 1;
  return data;
}

export type unionType = string | number | boolean

@Concurrent
export function shareTypeTask0016(data: unionType): unionType {
  data = true;
  return data;
}

export class CustomizeClass {
  name: string = 'CustomizeClass';
  count: number = 0;
  sendable: SendableClass = new SendableClass();
}

@Concurrent
export function shareTypeTask0017(data: CustomizeClass): CustomizeClass {
  data.sendable.count_ = 1;
  return data;
}