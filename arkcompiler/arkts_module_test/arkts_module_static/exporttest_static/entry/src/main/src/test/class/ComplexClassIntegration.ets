'use static'
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

export class ComplexClassIntegration extends BaseClass {
  private _privateValue: string;
  private _computedValue: string;
  public derivedValue: string;

  constructor(baseValue: string, derivedValue: string, privateValue: string) {
    super(baseValue);
    this.derivedValue = derivedValue;
    this._privateValue = privateValue;
    this._computedValue = this.computeComplexValue();
  }

  get privateValue(): string {
    return this._privateValue;
  }

  set privateValue(val: string) {
    this._privateValue = val;
    this._computedValue = this.computeComplexValue();
  }

  get computedValue(): string {
    return this._computedValue;
  }

  public computeComplexValue(): string {
    return `${this.baseValue}_${this.derivedValue}_${this._privateValue}`;
  }

  public getFullInfo(): string {
    const baseInfo = super.getBaseInfo();
    return `${baseInfo}, derived: ${this.derivedValue}, private: ${this._privateValue}, computed: ${this._computedValue}`;
  }

  public updateValues(newBase: string, newDerived: string, newPrivate: string): void {
    this.baseValue = newBase;
    this.derivedValue = newDerived;
    this.privateValue = newPrivate;
  }

  public validateThisBinding(): boolean {
    return this.name === 'BaseClass' &&
      this.getBaseValue() === this.baseValue &&
      this.derivedValue === this.derivedValue &&
      this.privateValue === this._privateValue;
  }
}
