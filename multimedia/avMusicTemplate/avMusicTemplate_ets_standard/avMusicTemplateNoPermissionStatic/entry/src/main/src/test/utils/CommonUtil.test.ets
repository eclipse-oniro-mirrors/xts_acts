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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { CommonConstants } from '../constants/CommonConstants.test';

const DOMAIN = 0x000;
const TAG = 'AVMusicTemplateNoPermissionStaticTest';

export class CommonUtils {
  static async msSleep(count: int = CommonConstants.DEFAULT_TIME_INTERVAL): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static logInfo(tag: string, msg: string) {
    hilog.info(DOMAIN, TAG, `${tag}: ${msg}`, msg);
  }

  static logError(tag: string, msg: string) {
    hilog.error(DOMAIN, TAG, `${tag}: ${msg}`, msg);
  }

  static getError(err: object) {
    const e = err as BusinessError;
    return `code: ${e.code}, message: ${e.message}`;
  }
}