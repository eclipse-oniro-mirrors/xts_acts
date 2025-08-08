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

// 001 静态逻辑表达式
@Entry
@Component
struct IfElse001 {
  private value0: number = 10;
  private value: number = 100;

  build() {
    Column() {
      Column() {
        Text('使用if进行条件判断，渲染内容为基本组件，判断条件为逻辑表达式是否小于20')
          .height('3%')
          .fontSize(9)
          .fontColor(Color.Gray)
        Row() {
          if (this.value0 < 20) {
            Text(`value: ${this.value0}, value小于20`)
              .height('3%')
              .fontSize(9)
              .id('if_else_001_01')
          }
        }
      }
      .width('100%')
      .border({ width: 1 })

      Column() {
        Text('使用if/else进行条件判断，渲染内容为基本组件，判断条件为逻辑表达式')
          .height('3%')
          .fontSize(9)
          .fontColor(Color.Gray)
        Row() {
          if (this.value < 20) {
            Text(`value: ${this.value}, value小于20`)
              .height('3%')
              .fontSize(9)
          } else {
            Text(`value: ${this.value}, value大于20`)
              .height('3%')
              .fontSize(9)
              .id('if_else_001_02')
          }
        }
      }
      .width('100%')
      .border({ width: 1 })

      Column() {
        Text('使用if/elseif/else进行条件判断，渲染内容为基本组件，判断条件为逻辑表达式')
          .height('3%')
          .fontSize(9)
          .fontColor(Color.Gray)
        Row() {
          if (this.value < 20) {
            Text(`value: ${this.value}, value小于20`)
              .height('3%')
              .fontSize(9)
          } else if (this.value < 1000) {
            Text(`value: ${this.value}, value大于20，小于1000`)
              .height('3%')
              .fontSize(9)
              .id('if_else_001_03')
          } else {
            Text(`value: ${this.value}, else分支`)
              .height('3%')
              .fontSize(9)
          }
        }
      }
      .width('100%')
      .border({ width: 1 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}