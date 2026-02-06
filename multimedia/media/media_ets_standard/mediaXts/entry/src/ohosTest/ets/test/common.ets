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

import { Driver, MatchPattern, ON } from "@kit.TestKit";
import { LOG_TAG, SLEEP_TIME_500 } from "./Constants";
import fs from '@ohos.file.fs';
import { media } from "@kit.MediaKit";

const TAG = LOG_TAG + 'MediaTestBase';

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

export async function driveFn() {
  console.info(TAG, `case come in driveFn`);
  let driver = Driver.create();
  console.info(TAG, `driver is ${JSON.stringify(driver)}`);
  await sleep(SLEEP_TIME_500);
  let power = await driver?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), SLEEP_TIME_500);
  await sleep(SLEEP_TIME_500);
  await power?.click();
  await sleep(SLEEP_TIME_500);
}

export async function getFd(pathName: string) {
  console.info(TAG, 'case come in getFd');
  pathName = globalThis.abilityContext.filesDir + "/" + pathName;
  console.info(TAG, 'pathName =' + pathName);
  let file = await fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
  console.info(TAG, 'case getFd number is: ' + file.fd);
  return file.fd;
}

export async function closeFd(fdNumber: number | null) {
  console.info(TAG, 'case come in closeFd');
  if (fdNumber != null) {
    fs.closeSync(fdNumber);
  } else {
    console.info(TAG, '[fs.closeSync] case fdNumber is null');
  }
}

export function getUrl(descriptor: media.AVFileDescriptor): string {
  let fd: string = descriptor.fd.toString();
  let offset: string = descriptor.offset!.toString();
  let length: string = descriptor.length!.toString();
  let url: string = "fd://" + fd + "?offset=" + offset + "&size=" + length;
  console.info(TAG, 'file url: ' + url);
  return url;
}