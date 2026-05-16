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

export class DerivedClass extends BaseClass {
  public name: string = 'DerivedClass';
  public derivedValue: string;

  constructor(baseValue: string, derivedValue: string) {
    super(baseValue);
    this.derivedValue = derivedValue;
  }

  public getDerivedValue(): string {
    return this.derivedValue;
  }

  public getFullInfo(): string {
    return `${this.getBaseInfo()}, derived: ${this.derivedValue}`;
  }
}
