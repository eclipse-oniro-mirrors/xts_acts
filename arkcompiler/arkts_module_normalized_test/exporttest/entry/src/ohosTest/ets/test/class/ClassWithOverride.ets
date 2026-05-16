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

export class ClassWithOverride extends BaseClass {
  public name: string = 'ClassWithOverride';
  public overrideValue: string;

  constructor(baseValue: string, overrideValue: string) {
    super(baseValue);
    this.overrideValue = overrideValue;
  }

  public getBaseInfo(): string {
    const baseInfo = super.getBaseInfo();
    return `[OVERRIDE] ${baseInfo}, override: ${this.overrideValue}`;
  }

  public getOverrideValue(): string {
    return this.overrideValue;
  }
}
