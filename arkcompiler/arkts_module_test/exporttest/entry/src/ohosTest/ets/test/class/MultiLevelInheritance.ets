/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { BaseClass } from './BaseClass';

export class Level2Class extends BaseClass {
  public level2Value: string;

  constructor(baseValue: string, level2Value: string) {
    super(baseValue);
    this.level2Value = level2Value;
  }

  public getLevel2Info(): string {
    return `${this.getBaseInfo()}, level2: ${this.level2Value}`;
  }
}

export class Level3Class extends Level2Class {
  public level3Value: string;

  constructor(baseValue: string, level2Value: string, level3Value: string) {
    super(baseValue, level2Value);
    this.level3Value = level3Value;
  }

  public getLevel3Info(): string {
    return `${this.getLevel2Info()}, level3: ${this.level3Value}`;
  }
}
