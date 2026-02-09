/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { promptAction } from '@kit.ArkUI';

const tag = "[HUKS_XTS]"

export class Logger {
  static maxCount: number = 5;
  static msgArr: string[] = []
  static curIndex: number = 0;

  static info(...args: string[]) {
    console.info(tag, ...args);
  }

  static log(...args: string[]) {
    console.log(tag, ...args);
  }

  static error(...args: string[]) {
    console.error(tag, ...args);
  }

  static showMsg(str: string) {
    let msg = "";
    for (let i = Logger.curIndex; i < Logger.maxCount; i++) {
      msg += Logger.msgArr[i%Logger.maxCount];
    }
    LogToConsoleToastUi(`${str}: ${msg}`)
  }

  static pushMsg(str: string) {
    Logger.msgArr[Logger.curIndex] = str;
    Logger.curIndex = (Logger.curIndex + 1) % Logger.maxCount;
  }

  static clearMsg() {
    Logger.msgArr = [];
    Logger.curIndex = 0;
  }
}

export function LogToConsoleToastUi(msg: string) {
  Logger.info(msg);
  promptAction.showToast({
    message: msg,
    duration: 3000,
  })
}