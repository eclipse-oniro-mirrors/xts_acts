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

@Observed
class SecClassB {
  public b: number;

  constructor(b: number) {
    this.b = b;
  }
}

class SecClassA {
  // ClassA成员变量a的类型为ClassB，从而形成嵌套结构，ClassB的成员变量b为第二层变量
  public a:SecClassB

  constructor(a:SecClassB) {
    this.a = a;
  }
}
// 构建子组件ViewSec用于承载@ObjectLink修饰的变量
@Component
struct ViewSec {
  @ObjectLink class_C: SecClassB;
  build() {
    Row() {
      Text(`${this.class_C.b}`)
    }
    .margin({top:100})
  }
}

// 使用@State、@Provide不能监听到第二层变量的变化
@Entry
@Component
struct ViewASec {
  // 使用@State修饰变量class_A
  @State class_A: SecClassA = new SecClassA(new SecClassB(5));
  @Provide("indexCount") class_B: SecClassA = new SecClassA(new SecClassB(5));

  build() {
    Column({space:20}) {
      Column(){
        Text('@State不能接收第二层属性值')
        Row(){
          // 点击按钮，第二层变量发生变化
          Button('第二层变量+1')
            .key(("btn_state2"))
            .margin({top:10,right:20})
            .backgroundColor('#E8A027')
            .onClick(() => {
              // 第二层变量变化，嵌套类ClassB的成员变量b加1
              this.class_A.a.b += 1;
            })
          // 将第二层变量在UI呈现出来
          Text(`${this.class_A.a.b}`).key(("sec_state"))
        }
      }.margin(50)

      Column(){
        Text('@Provide不能接收第二层属性值')
        Row(){
          // 点击按钮，第二层变量发生变化
          Button('第二层变量+1')
            .key(("btn_provide2"))
            .margin({top:10,right:20})
            .backgroundColor('#E8A027')
            .onClick(() => {
              // 第二层变量变化，嵌套类ClassB的成员变量b加1
              this.class_B.a.b += 1;
            })
          // 将第二层变量在UI呈现出来
          Text(`${this.class_B.a.b}`).key(("sec_provide"))
        }
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
