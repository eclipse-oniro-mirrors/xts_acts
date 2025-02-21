/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import taskpool from '@ohos.taskpool'
import hilog from '@ohos.hilog';
import { check } from './utils';
import { image } from '@kit.ImageKit';
import { fillPixelMap, fillPixelMapSync } from './PixelMapFillFunction';

const options: image.InitializationOptions = { editable: true, pixelFormat: image.PixelMapFormat.BGRA_8888, size: { height: 1, width: 4 } }

const BYTES_PER_PIXEL = 4;
const MAP_SIZE = 1 * 4 * BYTES_PER_PIXEL;
const BL = MAP_SIZE;


export function testPixMapWriteTask(): Promise<Object> {
  let p = testPixMapTaskImpl();
  return check("PixelMapSendableTaskTest", p);
}

export function testPixMapWriteTaskGroup(): Promise<Object> {
  let p = testPixMapTaskGroupImpl();
  return check("PixelMapSendableTaskGroupTest", p);
}

export function testPixMapWriteSingleTaskGroup(): Promise<Object> {
  let p = testPixMapSingleTaskGroupImpl();
  return check("PixelMapSendableSingleTaskGroupTest", p);
}

async function testPixMapTaskGroupImpl() {
  let ab = new ArrayBuffer(BL);

  let pm: PixelMap = image.createPixelMapSync(ab, options);
  if(pm == undefined) return Promise.reject("FAILED");

  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', ':createPixelMapSync: %{public}s\n%{public}s', JSON.stringify(pm.getImageInfoSync()) ?? '', JSON.stringify(pm.getBytesNumberPerRow()));

  let group = new taskpool.TaskGroup();
  group.addTask(new taskpool.Task(fillPixelMap, pm, 0, 10, 20, 30));
  group.addTask(new taskpool.Task(fillPixelMap, pm, 1, 40, 50, 60));
  group.addTask(new taskpool.Task(fillPixelMap, pm, 2, 70, 80, 90));
  group.addTask(new taskpool.Task(fillPixelMap, pm, 3, 100, 110, 120));

  let pg: Promise<Object> = taskpool.execute(group);
  await (pg);

  let readBuffer: ArrayBuffer = new ArrayBuffer(BL);
  pm.readPixelsToBufferSync(readBuffer);

  let buff = new Uint8Array(readBuffer);
  let expected =  [10, 20, 30, 255, 40, 50, 60, 255, 70, 80, 90, 255, 100, 110, 120, 255];

  for(let i= 0; i< readBuffer.byteLength; i++) {
    if(expected[i] == buff[i]) continue;
    throw new Error("Data Mismatch at " + i + ", expected " + expected[i] + " and got " + buff[i]);
  }

  return "Test passed";
}

async function testPixMapSingleTaskGroupImpl() {
  let ab = new ArrayBuffer(BL);

  let pm: PixelMap = image.createPixelMapSync(ab, options);
  if(pm == undefined) return Promise.reject("FAILED");

  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', ':createPixelMapSync: %{public}s\n%{public}s', JSON.stringify(pm.getImageInfoSync()) ?? '', JSON.stringify(pm.getBytesNumberPerRow()));

  let group = new taskpool.TaskGroup();
  group.addTask(new taskpool.Task(fillPixelMap, pm, 0, 10, 20, 30));

  let pg: Promise<Object> = taskpool.execute(group);
  await (pg);

  let readBuffer: ArrayBuffer = new ArrayBuffer(BL);
  pm.readPixelsToBufferSync(readBuffer);

  let buff = new Uint8Array(readBuffer);
  let expected =  [10, 20, 30, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', JSON.stringify(buff));

  for(let i= 0; i< readBuffer.byteLength; i++) {
    if(expected[i] == buff[i]) continue;
    throw new Error("Data Mismatch at " + i + ", expected " + expected[i] + " and got " + buff[i]);
  }

  return "Test passed";
}

async function testPixMapTaskImpl() {
  let ab = new ArrayBuffer(BL);

  let pm: PixelMap = image.createPixelMapSync(ab, options);
  if(pm == undefined) return Promise.reject("FAILED");

  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', ':createPixelMapSync: %{public}s\n%{public}s', JSON.stringify(pm.getImageInfoSync()) ?? '', JSON.stringify(pm.getBytesNumberPerRow()));

  let task = new taskpool.Task(fillPixelMap, pm, 0, 10, 20, 30)

  let pg: Promise<Object> = taskpool.execute(task);
  await (pg);

  let readBuffer: ArrayBuffer = new ArrayBuffer(BL);
  pm.readPixelsToBufferSync(readBuffer);

  let buff = new Uint8Array(readBuffer);
  let expected =  [10, 20, 30, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  hilog.info(0x0000, 'ActsConcurrencyBaseJSTest', JSON.stringify(buff));

  for(let i= 0; i< readBuffer.byteLength; i++) {
    if(expected[i] == buff[i]) continue;
    throw new Error("Data Mismatch at " + i + ", expected " + expected[i] + " and got " + buff[i]);
  }

  return "Test passed";
}