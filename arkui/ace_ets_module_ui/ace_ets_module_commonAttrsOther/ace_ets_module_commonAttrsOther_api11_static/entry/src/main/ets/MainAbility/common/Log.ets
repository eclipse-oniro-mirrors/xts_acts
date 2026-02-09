'use static';
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

const TAG = 'ets_apiLack_add';

/**
 * Basic log class
 */
export default class Log {
  /**
   * print info level log
   *
   * @param {String} tag - Page or class tag
   * @param {String} log - Log needs to be printed
   */
  static showInfo(tag: String, log: String) {
    console.info(`${TAG} tag: ${tag} --> ${log}`);
  }

  /**
   * print debug level log
   *
   * @param {String} tag - Page or class tag
   * @param {String} log - Log needs to be printed
   */
  static showDebug(tag: String, log: String) {
    console.debug(`${TAG} tag: ${tag} --> ${log}`);
  }

  /**
   * print error level log
   *
   * @param {String} tag - Page or class tag
   * @param {String} log - Log needs to be printed
   */
  static showError(tag: String, log: String) {
    console.error(`${TAG} tag: ${tag} --> ${log}`);
  }
}
