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
class scoClassA {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

class scoModel {
  public value: string;
  public name: scoClassA;
  constructor(value: string, name: scoClassA) {
    this.value = value;
    this.name = name;
  }
}

@Entry
@Component
struct StateClassObject {
  @State title: scoModel = new scoModel('Hello', new scoClassA('World'));

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(`${ this.title.value}`).fontSize(20).margin(15)
          .id("text_Object")
        Button(`Click to change Object1`)
          .id("state_Object1")
          .onClick(() => {
            // 动态修改Class类型赋值
            // @State变量的更新将触发上面的Text组件内容更新
            this.title = new scoModel('Hi', new scoClassA('ArkUI'));
          })
        Button(`Click to change Object2`)
          .id("state_Object2")
          .onClick(() => {
            // 动态修改Class父组件属性值
            // @State变量的更新将触发上面的Text组件内容更新
            this.title.value = "Hello ArkUI"
        })

        Text(`${ this.title.name.value}`).fontSize(20).margin(5)
          .id("text_Class")
        Button(`Click to change Class`)
          .id("state_Class")
          .onClick(() => {
            // 动态修改Class自组件属性值
            // @State变量的更新将触发该Text的内容更新
            this.title.name = new scoClassA('Harmony');
          })
      }
    }
  }
}