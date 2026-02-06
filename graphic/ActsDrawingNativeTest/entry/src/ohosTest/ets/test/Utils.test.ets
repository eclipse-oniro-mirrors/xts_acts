/*
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
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

const DEFAULT_TAG = 'ActsNewDrawingNativeTest';

export default class Utils {
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }
}

export class Log {
  static error(msg: string, tag: string = DEFAULT_TAG) {
    hilog.error(0x0001, tag, msg);
  }

  static info(msg: string, tag: string = DEFAULT_TAG) {
    hilog.info(0x0001, tag, msg);
  }

  static debug(msg: string, tag: string = DEFAULT_TAG) {
    hilog.debug(0x0001, tag, msg);
  }
}

