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
AppStorage.setOrCreate('Prop1', 47);


@Component
struct ChildLink2 {
  @Link counterVal: number;

  build() {
    Column() {
      Text(`ChildLink: ${this.counterVal}`).fontSize(18).margin(5)
        .key("ChildLink" + this.counterVal)
        .onClick(() => {
          this.counterVal += 2
        })
    }.width('100%')
  }
}

@Component
struct PropLink2 {
  @Link numberl: number;

  build() {
    Column() {
      Text(`PropLink:${this.numberl}`).width("100%")
        .key("PropLink" + this.numberl)
        .onClick(() => {
          this.numberl += 1
        })
      ChildLink2({counterVal: this.numberl})
    }.margin(5)
  }
}

@Entry
@Component
struct CombinationState2 {
  @State fatherState: number = 1;
  @StorageLink('Prop1') son1: number = 5;
  @State fathState: number = 7;

  build() {
    Row() {
      Column({ space: 20 }) {
        Text('@Link可使用父组件中被@State装饰的变量初始化')
        PropLink2({numberl: this.fatherState})

        Text('@Link可使用父组件中被@StorageLink装饰的变量初始化')
        PropLink2({numberl: this.son1})

        Text('@Link可使用父组件中被@Link装饰的变量初始化')
        PropLink2({numberl: $fathState})
      }
    }
  }
}