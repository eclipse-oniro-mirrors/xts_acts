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
let nextId:number=0
@ObservedV2
class Person4{
  @Trace age:number = 0

  constructor(age:number) {
    this.age=age
  }
}
@ObservedV2
class Info2{
  id:number=0
  @Trace personList:Person4[]=[]

  constructor() {
    this.id = nextId++
    this.personList=[new Person4(0),new Person4(1)]
  }
}
@Entry
@Component
struct ObjectArray{
  info : Info2  = new Info2()
  build() {
    Column() {
      Text(`length:${this.info.personList.length}`)
        .id('ObjectArray_1A')
        .fontSize(40)
        Divider()
      if(this.info.personList.length>=2){
        Text(`${this.info.personList[0].age}`)
          .fontSize(40)
          .onClick(()=>{
            this.info.personList[0].age++
          })
        Text(`${this.info.personList[1].age}`)
          .fontSize(40)
          .onClick(()=>{
            this.info.personList[1].age++
          })
        Divider()
        ForEach(this.info.personList,(item:Person4,index:number)=>{
          Text(`${index} ${item.age}`).fontSize(40)
        })
      }
    }
    .width('100%')
    .margin({top:20})
  }
}