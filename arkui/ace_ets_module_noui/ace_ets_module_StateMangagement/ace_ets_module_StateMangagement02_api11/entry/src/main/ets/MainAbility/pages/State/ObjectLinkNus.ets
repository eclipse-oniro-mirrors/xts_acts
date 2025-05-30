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
class StrClassA {
  public name: string;
  public num: number;
  public flag: Boolean;
  public color: Color;

  constructor(name: string,num: number= 0, flag: Boolean = true, color: Color = Color.Blue) {
    this.name = name;
    this.num = num
    this.flag = flag
    this.color = color
  }
}
// 构建子组件ViewB用于承载@ObjectLink修饰的变量
//@ObjectLink支持多数据类型
@Component
struct ViewBOlk {
  @ObjectLink class_B: StrClassA;
  build() {
    Row() {
      // 将ClassB的成员变量a在UI呈现出来
      Text(`${this.class_B.name}`).height('5%').width('25%')
      Text(`${this.class_B.num}`).height('5%').width('25%')
      Text(`${this.class_B.flag}`).height('5%').width('25%')
      Text(`${this.class_B.color}`).height('5%').width('25%')
    }
  }
}

@Entry
@Component
struct ViewANus {
  // 使用@State修饰变量class_A
  @State class_A: StrClassA = new StrClassA("hello");

  build() {
    Column() {
      Text(`${this.class_A.name}`).key(("str_obl")).height('5%')
      Button('@ObjectLink 支持 string 类型')
        .height('5%')
        .key(("strBtn_obl"))
        .onClick(() => {
          this.class_A.name = "harmony";
        })

      Text(`${this.class_A.num}`).key(("num_obl")).height('5%')
      Button('@ObjectLink 支持 number 类型')
        .height('5%')
        .key(("numBtn_obl"))
        .onClick(() => {
          this.class_A.num = 3;
        })

      Text(`${this.class_A.flag}`).key(("bon_obl")).height('5%')
      Button('@ObjectLink 支持 Boolean 类型')
        .height('5%')
        .key(("bonBtn_obl"))
        .onClick(() => {
          this.class_A.flag = !this.class_A.flag
        })

      Text(`${this.class_A.color}`).key(("cor_obl")).height('5%')
      Button('@ObjectLink 支持 enum 类型')
        .height('5%')
        .key(("corBtn_obl"))
        .onClick(() => {
          this.class_A.color = Color.Red
        })

    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
