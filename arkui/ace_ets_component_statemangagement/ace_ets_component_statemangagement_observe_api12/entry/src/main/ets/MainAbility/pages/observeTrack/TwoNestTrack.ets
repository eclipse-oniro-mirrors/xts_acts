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
@ObservedV2
class Pencil{
  @Trace length:number = 18
}
class Bag{
  width:number=50
  height:number=60
  pencil:Pencil=new Pencil()
}
class Son7{
  age:number=5
  bag:Bag=new Bag()
}
@Entry
@Component
struct TwoNestTrack{
  son : Son7  = new Son7()
  renderTimes:number=0
  isRender(id:number):number{
    this.renderTimes++
    return 40
  }
  build() {
    Column() {
      Text(`length:${this.son.bag.pencil.length}`)
        .id('TwoNestTrack_1A')
        .fontSize(this.isRender(1))
      Button('change length')
        .id('TwoNestTrack_2A')
        .onClick(()=>{
          this.son.bag.pencil.length+=1
        })
      Button('assign Son').onClick(()=>{
        this.son=new Son7()
      })
    }
    .width('100%')
    .margin({top:20})
  }
}