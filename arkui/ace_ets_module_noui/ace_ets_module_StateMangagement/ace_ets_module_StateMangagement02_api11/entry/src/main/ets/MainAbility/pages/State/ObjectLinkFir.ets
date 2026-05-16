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

// 引入FirClassA,第一层
@Observed
class FirClassA {
  public b:number

  constructor(b:number) {
    this.b = b;
  }
}

// 构建子组件View用于承载@ObjectLink修饰的变量
@Component
struct ViewFir {
  @ObjectLink classB: FirClassA;
  build() {
    Row() {
      // 将ClassB的成员变量b在UI呈现出来
      Text(`${this.classB.b}`)
    }
    
  }
}

// 使用@State、@Provide能监听到第一层变量的变化
@Entry
@Component
struct ViewAFir {
  // 使用@State、@Provide修饰变量class_A，以监听其变化
  @State class_A: FirClassA = new FirClassA(5);
  @Provide("indexCount") class_B: FirClassA = new FirClassA(5);

  build() {
    Column() {
      Column(){
        Text('@State接收第一层').height('5%')
        Row(){
          // 点击按钮，第一层变量发生变化
          Button('第一层变量+1')
            .key(("btn_state1"))
            .backgroundColor('#E8A027')
            .onClick(() => {
              // class_A的成员变量a加1，class_A发生变化
              this.class_A.b += 1;
            })
            .height('5%')
            .width('50%')
          // 将第一层变量在UI呈现出来
          Text(`${this.class_A.b}`).key(("fir_state"))
            .height('5%')
            .width('50%')
        }
      }

      Column(){
        Text('@Provide接收第一层').height('5%')
        Row(){
          // 点击按钮，第一层变量发生变化
          Button('第一层变量+1')
            .key(("btn_provide1"))
            .backgroundColor('#E8A027')
            .onClick(() => {
              // class_B的成员变量a加1，class_B发生变化
              this.class_B.b += 1;
            })
            .height('5%')
            .width('50%')
          // 将第一层变量在UI呈现出来
          Text(`${this.class_B.b}`).key(("fir_provide"))
            .height('5%')
            .width('50%')
        }

      }
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
