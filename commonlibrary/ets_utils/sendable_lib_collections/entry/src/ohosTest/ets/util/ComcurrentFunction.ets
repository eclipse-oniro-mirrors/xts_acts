/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import collections from '@arkts.collections';
import taskpool from '@ohos.taskpool';

@Concurrent
export function arrayPop(array: collections.Array<number>): Promise<number | undefined> {
  let result: number | undefined = array.pop();
  return new Promise((res) => {
    res(result);
  })
}

@Concurrent
export function arrayPush(array: collections.Array<number>): Promise<number> {
  let pushLength: number = array.push(5, 6);
  return new Promise((res) => {
    res(pushLength);
  })
}

@Concurrent
export function arrayJoin(array: collections.Array<number>): Promise<string> {
  let joinStr: string = array.join('-');
  taskpool.Task.sendData(joinStr);
  return new Promise((res) => {
    res(joinStr);
  })
}

@Concurrent
export function arrayShift(array: collections.Array<number>): Promise<number | undefined> {
  let firstElement: number | undefined = array.shift();
  return new Promise((res) => {
    res(firstElement);
  })
}

@Concurrent
export function arrayUnshift(array: collections.Array<number>): Promise<number> {
  let pushLength: number = array.unshift(5, 6);
  return new Promise((res) => {
    res(pushLength);
  })
}

@Concurrent
export function arraySlice(array: collections.Array<number>): Promise<number> {
  let newArray: collections.Array<number> = array.slice(0, 2);
  return new Promise((res) => {
    res(newArray.length);
  })
}

@Concurrent
export function arrayIndexOf(array: collections.Array<number>): Promise<number | undefined> {
  let firstElement: number | undefined = array.shift();
  return new Promise((res) => {
    res(firstElement);
  })
}

@Concurrent
export function arrayAt(array: collections.Array<number>): Promise<number | undefined> {
  let firstElement: number | undefined = array.shift();
  return new Promise((res) => {
    res(firstElement);
  })
}

@Concurrent
export function arrayFill(array: collections.Array<number>): Promise<number> {
  let fillArray: collections.Array<number> = array.fill(0, 1, 2);
  return new Promise((res) => {
    res(fillArray[1]);
  })
}

@Concurrent
export function mapClear(map: collections.Map<number, string>): Promise<string> {
  map.clear();
  return new Promise((res) => {
    res('success');
  })
}

@Concurrent
export function mapDelete(map: collections.Map<number, string>): Promise<boolean> {
  let deleteFlg: boolean = map.delete(0);
  return new Promise((res) => {
    res(deleteFlg);
  })
}

@Concurrent
export function mapGet(map: collections.Map<number, string>): Promise<boolean> {
  let deleteFlg: boolean = map.delete(0);
  return new Promise((res) => {
    res(deleteFlg);
  })
}

@Concurrent
export function mapHas(map: collections.Map<number, string>): Promise<boolean> {
  let deleteFlg: boolean = map.delete(0);
  return new Promise((res) => {
    res(deleteFlg);
  })
}

@Concurrent
export function mapSet(map: collections.Map<number, string>): Promise<string> {
  map.set(0, '1');
  return new Promise((res) => {
    res("success");
  })
}

@Concurrent
export function setClear(set: collections.Set<number>): Promise<string> {
  set.clear();
  return new Promise((res) => {
    res("success");
  })
}

@Concurrent
export function setDelete(set: collections.Set<number>): Promise<boolean> {
  let flg: boolean = set.delete(1);
  return new Promise((res) => {
    res(flg);
  })
}

@Concurrent
export function setAdd(set: collections.Set<number>): Promise<string> {
  set.add(5);
  return new Promise((res) => {
    res("success");
  })
}