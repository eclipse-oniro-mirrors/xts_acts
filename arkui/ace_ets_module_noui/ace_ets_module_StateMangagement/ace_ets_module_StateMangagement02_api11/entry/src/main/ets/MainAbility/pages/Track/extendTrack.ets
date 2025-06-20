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
class Child1 {
  @Track c1:number=20
  c2:number = 20
}
@Observed
class Parent1 extends Child1 {
  @Track p1:number=30
  p2:number = 30
}
@Observed
class Child2 {
  cj1:number=20
  cj2:number = 20
}
@Observed
class Parent2 extends Child2 {
  pj1:number=30
  pj2:number = 30
}
@Entry
@Component
struct extendTrack {
  @State cc:Child1=new Child1()
  @State pp:Parent1=new Parent1()
  @State ccj:Child2=new Child2()
  @State ppj:Parent2=new Parent2()
  build() {
    Column() {
      Button("Reset").key("extendTrack_reset").height('5%')
        .onClick(() => {
          this.cc.c1=20
          this.pp.p1=30
          this.ccj.cj1=20
          this.ppj.pj1=30
        })
      Text('c1='+`${this.cc.c1}`).height('5%')
        .key('extendTrack_1')
        .fontSize(9)
        .onClick(()=>{
          this.cc.c1= 80
        })
      Text('p1='+`${this.pp.p1}`).height('5%')
        .key('extendTrack_2')
        .fontSize(9)
        .onClick(()=>{
          console.log('this.pp.p1',this.pp.p1)
          this.pp.p1 =80
        })
      Text('cj1='+`${this.ccj.cj1}`).height('5%')
        .key('extendTrack_3')
        .fontSize(9)
        .onClick(()=>{
          console.log('this.ccj.cj1',this.ccj.cj1)
          this.ccj.cj1= 80
        })
      Text('pj1='+`${this.ppj.pj1}`).height('5%')
        .key('extendTrack_4')
        .fontSize(9)
        .onClick(()=>{
          console.log('this.ppj.pj1',this.ppj.pj1)
          this.ppj.pj1 =80
        })
    }
    .width('100%')
    .height('100%')
  }
}