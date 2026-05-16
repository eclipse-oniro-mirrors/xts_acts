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

import { hilog } from '@kit.PerformanceAnalysisKit';

export class Logger {
  private domain: number;
  private identifies: string;
  private tag: string;

  constructor(domain: number, identifies: string, tag: string) {
    this.domain = domain;
    this.identifies = identifies;
    this.tag = tag;
  }

  public log(msg: string): void {
    hilog.info(this.domain, this.identifies, `${this.tag}===>${msg}`);
  }

  public err(msg: string): void {
    hilog.error(this.domain, this.identifies, `${this.tag}===>${msg}`);
  }

  public warn(msg: string): void {
    hilog.warn(this.domain, this.identifies, `${this.tag}===>${msg}`);
  }

  public fatal(msg: string): void {
    hilog.fatal(this.domain, this.identifies, `${this.tag}===>${msg}`);
  }
}

const logger: Logger = new Logger(0x1111, 'FrameNodeTest', '=-=');

export { logger }