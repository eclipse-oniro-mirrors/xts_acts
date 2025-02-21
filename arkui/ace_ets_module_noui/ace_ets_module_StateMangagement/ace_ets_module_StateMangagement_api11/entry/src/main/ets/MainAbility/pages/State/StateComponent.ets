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

class sComModel {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}

@Entry
@Component
struct StateComponent {
  build() {
    Column() {
      // 此处指定的参数都将在初始渲染时覆盖本地定义的默认值，并不是所有的参数都需要从父组件初始化
      sComponent({ count: 1, increaseBy: 2 })
      sComponent({ title: new sComModel('Hello, World 2'), count: 7 })
    }
  }
}

@Component
struct sComponent {
  @State title: sComModel = new sComModel('Hello World');
  @State count: number = 0;
  private increaseBy: number = 1;

  build() {
    Column() {
      Text(`${this.title.value}`).margin(10)
        .id("text_component" + this.count)
      Button(`Click to change title`).margin(10)
        .id("change_component" + this.count)
        .onClick(() => {
          // @State变量的更新将触发上面的Text组件内容更新
          this.title.value = this.title.value === "Hello ArkUI" ? "Hello World" : "Hello ArkUI";
        })

      Button(`Click to increase count=${this.count}`).margin(10)
        .id("increase_component" + this.count)
        .onClick(() => {
          // @State变量的更新将触发该Button组件的内容更新
          this.count += this.increaseBy;
        })
    }
  }
}