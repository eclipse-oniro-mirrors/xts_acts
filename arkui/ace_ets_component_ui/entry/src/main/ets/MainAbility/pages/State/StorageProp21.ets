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
enum KFCProp21{D = 1,H,Y}
Environment.envProps([
  { key: 'stringCode', defaultValue: 'en'},
  { key: 'numberCode', defaultValue: 2},
  { key: 'booleanCode', defaultValue: true},
  { key: 'enumCode', defaultValue: KFCProp21.D},
])


@Entry
@Component
struct StorageProp21 {
  @StorageProp('stringCode') stringCode: string = 'ab';
  @StorageProp('numberCode') numberCode: number = 1;
  @StorageProp('booleanCode') booleanCode: boolean = false;
  @StorageProp('enumCode') enumCode: KFCProp21 = KFCProp21.H;


  build() {
    Column({ space: 20 }) {
      Button(`button1: ${this.stringCode}`).margin(10).width("100%")
        .key("button1")
        .onClick(() => {
          this.stringCode = 'cd';
        })

      Button(`button2: ${this.numberCode}`).margin(10).width("100%")
        .key("button2")
        .onClick(() => {
          this.numberCode = 3
        })

      Button(`button3: ${this.booleanCode}`).margin(10).width("100%")
        .key("button3")
        .onClick(() => {
          this.booleanCode = false
        })

      Button(`button4: ${this.enumCode}`).margin(10).width("100%")
        .key("button4")
        .onClick(() => {
          this.enumCode = KFCProp21.Y
        })

    }
  }
}