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
class A1 {
  @Track a1:number=20
  constructor(a1:number) {
    this.a1=a1
  }
}
@Observed
class AA1 {
  @Track aa1:number=20
  @Track a2:A1 =new A1(30)
}
@Observed
class B1 {
  b1:number=20
  constructor(b1:number) {
    this.b1=b1
  }
}
@Observed
class BB1 {
   bb1:number=20
   b2:B1 =new B1(30)
}
@Entry
@Component
struct nestTrack {
  @State ta:AA1=new AA1()
  @State tb:BB1=new BB1()
  build() {
      Column() {
        Button("Reset")
          .height('5%')
          .key("nestTrack_reset")
          .onClick(() => {
            this.ta.a2.a1=20
            this.tb.b2.b1=30
          })
        Text('a1='+`${this.ta.a2.a1}`)
          .height('5%')
          .key('nestTrack_1')
          .fontSize(9)
          .onClick(()=>{
            this.ta.a2.a1 = 50
          })
        Text('a1='+`${this.ta.a2.a1}`)
          .height('5%')
          .key('nestTrack_2')
          .fontSize(9)
          .onClick(()=>{
            this.ta.a2 = new A1(50)
          })
        Text('b1='+`${this.tb.b2.b1}`)
          .height('5%')
          .key('nestTrack_3')
          .fontSize(9)
          .onClick(()=>{
            this.tb.b2.b1 = 50
          })
        Text('b1='+`${this.tb.b2.b1}`)
          .height('5%')
          .key('nestTrack_4')
          .fontSize(9)
          .onClick(()=>{
            this.tb.b2 = new B1(50)
          })
      }
      .width('100%')
    .height('100%')
  }
}