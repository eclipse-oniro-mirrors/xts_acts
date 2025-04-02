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
class ClassAB {
  public num: number;

  constructor(num: number) {
    this.num = num
  }
}
//@ObjectLink支持数据初始化
@Entry
@Component
struct ViewAS{
  @State class_A: ClassAB = new ClassAB(5);

  build() {
    Column({space:20}) {
      Button("Reset").id("ViewAS_reset")
        .onClick(() => {
          this.class_A = new ClassAB(5)
        })
      Text('@State: ' + this.class_A.num).key("num_state")
        .fontSize(20)
      Button('State + 1').key("adds_state")
        .backgroundColor('#E8A027')
        .onClick(()=>{
          this.class_A.num++;
        })

      Text("ObjectLink: " + this.class_A.num).key("sNum_olk")
        .fontSize(20)
      ViewBs({ class_C: this.class_A })

      Text("son_Prop: " + this.class_A.num).key("sNum_props")
        .fontSize(20)
      son_Props({ numA: this.class_A.num })

      Text("son_Link: " + this.class_A.num).key("sNum_links")
        .fontSize(20)
      son_Links({ numB: $class_A })

    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}


// 构建子组件ViewBStr用于承载@ObjectLink修饰的变量
@Component
struct ViewBs {
  @ObjectLink class_C: ClassAB;
  build() {
    Column(){
      Button('ObjectLink + 1').key(("btn_olk"))
        .backgroundColor('#E8A027')
        .onClick(() => {
          this.class_C.num += 1;
        })
    }
    .margin({top:10})
  }
}

@Component
struct son_Props{
  @Prop numA: number
  build(){
    Column(){
      Button('Prop + 1').key(("btn_prop"))
        .backgroundColor('#E8A027')
        .onClick(() => {
          this.numA += 1;
        })
    }
  }
}

@Component
struct son_Links{
  @Link numB: ClassAB
  build(){
    Column(){
      Button('Link + 1').key(("btn_link"))
        .backgroundColor('#E8A027')
        .onClick(() => {
          this.numB.num += 1;
        })
    }
  }
}