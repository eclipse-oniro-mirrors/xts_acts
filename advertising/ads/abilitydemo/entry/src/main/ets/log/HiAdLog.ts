/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';

class Logger {
  private tag: number;
  private pre: string;
  private format: string = "%{public}s, %{public}s";

  constructor() {
    this.pre = '[Sample_Advertising]';
    this.tag = 0xFF00;
  }

  d(...args: any[]) {
    hilog.debug(this.tag, this.pre, this.format, args);
  }

  i(...args: any[]) {
    hilog.info(this.tag, this.pre, this.format, args);
  }

  w(...args: any[]) {
    hilog.warn(this.tag, this.pre, this.format, args);
  }

  e(...args: any[]) {
    hilog.error(this.tag, this.pre, this.format, args);
  }
}

export default new Logger()