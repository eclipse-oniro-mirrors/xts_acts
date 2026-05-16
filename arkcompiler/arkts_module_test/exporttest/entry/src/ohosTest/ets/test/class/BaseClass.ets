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
export class BaseClass {
  public name: string = 'BaseClass';
  protected baseValue: string;
  private _id: string;

  constructor(baseValue: string) {
    this.baseValue = baseValue;
    this._id = 'base_' + baseValue;
  }

  public getBaseValue(): string {
    return this.baseValue;
  }

  public getBaseInfo(): string {
    return `BaseClass: ${this.baseValue}, id: ${this._id}`;
  }
}
