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

// 父组件arrViewB中的类对象ClassA与子组件ViewA保持数据同步时，可以使用@ObjectLink和@Observed，绑定该数据对象的父组件和其他子组件同步更新
let nextID: number = 0
@Observed
class ClassA {
  public num: number
  public id: number

  constructor(num: number) {
    this.num = num
    this.id = nextID++
  }
}

@Component
struct arrViewA {
  @ObjectLink data: ClassA

  build() {
    Row() {
      Text("viewA: "+`${this.data.num}`)

    }
  }
}

@Entry
@Component
struct arrViewB {
  @State arrA: ClassA[] = [new ClassA(5), new ClassA(6)]

  build() {
    Column() {
      Button("Reset").id("arrViewB_reset")
        .height('5%')
        .onClick(() => {
          nextID = 0
          this.arrA = [new ClassA(5), new ClassA(6)]
        })
      Text('hello: ' + JSON.stringify(this.arrA)).fontSize(9)
        .key("view_arrObl").height('5%')
      Button(`ViewB: change`).fontSize(9)
        .height('5%')
        .key("change_ArrObl")
        .onClick(() => {
          // 改变某一个Array值
          this.arrA[0] = new ClassA(8)
        })

      Button(`ViewB: push`).fontSize(9)
        .height('5%')
        .key("add_ArrObl")
        .onClick(() => {
          this.arrA.push(new ClassA(7))
        })

      Button(`ViewB: shift`).fontSize(9)
        .height('5%')
        .key("delete_Arr1")
        .onClick(() => {
          this.arrA.shift()
        })

      Button(`ViewB: pop`).fontSize(9)
        .height('5%')
        .key("delete_Arr2")
        .onClick(() => {
          this.arrA.pop()
        })

      Button(`ViewB: reset array`)
        .height('5%')
        .key("reset_ArrObl")
        
        .onClick(() => {
          this.arrA = [new ClassA(5), new ClassA(6)]
        })
    }.width('100%')
  }
}