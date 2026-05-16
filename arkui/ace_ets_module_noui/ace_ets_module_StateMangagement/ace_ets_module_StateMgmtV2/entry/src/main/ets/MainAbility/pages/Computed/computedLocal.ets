/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
@Entry
@ComponentV2
struct ComputedLocal {
  @Local firstName: string = 'Li';
  @Local lastName: string = 'Hua';
  @Local computedLocalText: number = 0;
  age: number = 20; // cannot trigger Computed

  @Computed
  get fullName() {
    console.info('---------Computed----------');
    this.computedLocalText += 1;
    return this.firstName + ' ' + this.lastName + this.age;
  }

  build() {
    Column() {
      Text(this.lastName + ' ' + this.firstName).id('computedLocalText1')
      Text(this.lastName + ' ' + this.firstName).id('computedLocalText2')
      Divider()
      Text(this.fullName).id('computedLocalText3')
      Text(this.fullName).id('computedLocalText4')
      Text(`Computed count: ${this.computedLocalText}`).id('computedLocalText5')
      Button('changed lastName').onClick(() => {
        this.lastName += 'a';
      }).id('computedLocalButton1')

      Button('changed age').onClick(() => {
        this.age++; // cannot trigger Computed
      }).id('computedLocalButton2')
    }
  }
}