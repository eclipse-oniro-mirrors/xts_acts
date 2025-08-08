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
export class ObservedObject {
  @Trace name1: string;
  @Trace age1: string;

  constructor(name: string, age: string) {
    this.name1 = name;
    this.age1 = age;
  }
}

@Entry
@ComponentV2
struct Page12 {
  @Local firstName: string = 'hello'
  @Local lastName: string = 'world'
  @Local info: ObservedObject = new ObservedObject('Tom', '25')
  count: number = 0
  age: number = 20 // only age changed，will not recalculate

  @Computed
  get fullName() {
    console.info('======comuted----------')
    return this.firstName + ' ' + this.lastName + ' ' + this.age
  }

  @Computed
  get TraceName() {
    console.info('======TraceName----------')
    return this.info.name1 + ' ' + this.info.age1
  }

  @Monitor('fullName')
  onFullNameMonitor(mon: IMonitor) {
    console.log('fullname changed from ' + mon.value()?.before + ' to ' + mon.value()?.now)
  }

  rerenderText(): number {
    console.info(`---- count: ${this.count++}`);
    return 9;
  }

  build() {
    Column() {
      Text(this.lastName + ': ' + this.fullName)
        .fontSize(this.rerenderText())
        .id('computedText')
        .height('3%')
      Text(this.fullName + ' 222')
        .id('computedText1')
        .height('3%')
        .fontSize(9)
      Button('Local')
        .id('computedButton1')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.lastName += '0'
          this.lastName += '1'
        })
      Button('未被local和Trace ')
        .id('computedButton2')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.age++
        })
      Text(this.info.name1)
        .id('computedText2')
        .height('3%')
        .fontSize(9)
      Text(this.info.age1 + '')
        .id('computedText3')
        .height('3%')
        .fontSize(9)
      Button('Trace')
        .id('computedButton3')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          this.info.name1 += '1'
          this.info.age1 += 0
        })
      Button('MoreChange')
        .id('computedButton4')
        .height('3%')
        .fontSize(9)
        .onClick(() => {
          for (let i = 0; i < 1000; i++) {
            if (i = 999) {
              this.lastName = 'world'
            } else {
              this.lastName = 'aaa'
            }
          }
        })
    }
  }
}