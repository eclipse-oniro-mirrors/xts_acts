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
@Component
struct PropSetChild {
  @Prop message: Set<number> = new Set([1, 2 ,3 ])

  build() {
    Column() {
      ForEach(Array.from(this.message.entries()), (item: [number, string]) => {
        Text(`${item[0]}`).fontSize(20).id("propSet_value_" + item[0])
        Divider()
      })
      Button('init set').id("propSet_init")
        .onClick(() =>{
          this.message = new Set([1, 2 ,3 ])
      }).margin(10)

      Button('set new one').id("propSet_set")
        .onClick(() =>{
          this.message.add(5)
      }).margin(10)

      Button('clear').id("propSet_clear")
        .onClick(() =>{
          this.message.clear()
          if (Array.from(this.message.entries())){
            this.message.add(0)
          }
      }).margin(10)

      Button('delete the first one').id("propSet_delete")
        .onClick(() =>{
          this.message.delete(0)
      })
    }
    .width('100%')
  }
}



@Entry
@Component
struct PropSetSample11 {
  @State message: Set<number> = new Set([1, 2 ,3 ])

  build() {
    Row() {
      Column() {
        PropSetChild({message:this.message})
      }
      .width('100%')
    }
    .height('100%')
  }
}