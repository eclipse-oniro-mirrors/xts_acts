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
@ObservedV2
class Name {
  @Trace firstName: string = 'Li';
  @Trace lastName: string = 'Hua';
  @Trace testNumber: number = 0;

  @Computed
  get fullName() {
    this.testNumber += 1;
    return this.firstName + ' ' + this.lastName;
  }
}

const name: Name = new Name();

@Entry
@ComponentV2
struct ComputedTrace {
  name1: Name = name;

  build() {
    Column() {
      Text(this.name1.fullName).id('computedTraceText1')
      Text(this.name1.fullName).id('computedTraceText2')
      Button('changed lastName').onClick(() => {
        this.name1.lastName += 'a';
      })
        .id('computedTraceButton')
      Text(`Computed call count ${this.name1.testNumber.toString()}`).id('computedTraceText3')
    }
  }
}