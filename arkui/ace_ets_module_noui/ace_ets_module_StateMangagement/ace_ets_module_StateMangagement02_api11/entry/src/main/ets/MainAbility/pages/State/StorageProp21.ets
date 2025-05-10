/**
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
AppStorage.clear()
enum KFC21{D = 1,H,Y}
Environment.envProps([
  { key: 'stringCode', defaultValue: 'en'},
  { key: 'numberCode', defaultValue: 2},
  { key: 'booleanCode', defaultValue: true},
  { key: 'enumCode', defaultValue: KFC21.D},
])


@Entry
@Component
struct StorageProp21 {
  @StorageProp('stringCode') stringCode: string = 'ab';
  @StorageProp('numberCode') numberCode: number = 1;
  @StorageProp('booleanCode') booleanCode: boolean = false;
  @StorageProp('enumCode') enumCode: KFC21 = KFC21.H;


  build() {
    Column() {
      Button(`button1: ${this.stringCode}`).width("100%").height('5%')
        .key("button1")
        .onClick(() => {
          this.stringCode = 'cd';
        })

      Button(`button2: ${this.numberCode}`).width("100%").height('5%')
        .key("button2")
        .onClick(() => {
          this.numberCode = 3
        })

      Button(`button3: ${this.booleanCode}`).width("100%").height('5%')
        .key("button3")
        .onClick(() => {
          this.booleanCode = false
        })

      Button(`button4: ${this.enumCode}`).width("100%").height('5%')
        .key("button4")
        .onClick(() => {
          this.enumCode = KFC21.Y
        })

    }
  }
}