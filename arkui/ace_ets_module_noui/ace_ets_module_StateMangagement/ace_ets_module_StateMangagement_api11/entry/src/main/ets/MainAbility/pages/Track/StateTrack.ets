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
class Member1 {
  @Track memberA:number=20
  @Track memberB:string='MemberB'
}
@Observed
class Member2 extends Member1 {
  @Track memberC:number=30
}
@Component
struct propChild {
  @Prop prop:Member2
  build() {
    Column() {
      Text('@Prop').fontSize(30)
      Text('memberA='+`${this.prop.memberA}`)
        .key('Track_prop')
        .fontSize(30)
      Text('memberC='+`${this.prop.memberC}`)
        .key('Track_prop1')
        .fontSize(30)
    }
    .height('20%')
  }
}
@Component
struct objectLinkChild {
  @ObjectLink objectlink :Member2
  build() {
    Column() {
      Text('@ObjectLink').fontSize(30)
      Text('memberA='+`${this.objectlink.memberA}`)
        .key('Track_objectlink')
        .fontSize(30)
      Text('memberC='+`${this.objectlink.memberC}`)
        .key('Track_objectlink1')
        .fontSize(30)
    }
    .height('20%')
  }
}
@Component
struct linkChild {
  @Link link:Member2
  build() {
    Column() {
      Text('@Link').fontSize(30)
      Text('memberA='+`${this.link.memberA}`)
        .key('Track_link')
        .fontSize(30)
      Text('memberC='+`${this.link.memberC}`)
        .key('Track_link1')
        .fontSize(30)
    }
    .height('20%')
  }
}
@Entry
@Component
struct stateTrack {
  @State me:Member2=new Member2()
  build() {
    Column({space:5}) {
      Button("Reset").key("StateTrack_reset")
        .onClick(() => {
          this.me.memberA=20
          this.me.memberA=30
        })
      Column(){
        Text('@State').fontSize(30)
        Text('memberA='+`${this.me.memberA}`)
          .key('Track_state')
          .fontSize(30)
        Text('memberC='+`${this.me.memberC}`)
          .key('Track_state1')
          .fontSize(30)
      }
      .border({width:2,color:Color.Yellow})
      .height('20%')
      Column(){
        propChild({prop:this.me})
      }
      .border({width:2,color:Color.Red})
      Column(){
        objectLinkChild({objectlink:this.me})
      }
      .border({width:2,color:Color.Green})
      Column(){
        linkChild({link:$me})
      }
      .border({width:2,color:Color.Orange})
      Button('改变memberA')
        .key('change_stateA')
        .onClick(()=>{
        this.me.memberA+=1
      })
      Button('改变memberC')
        .key('change_stateB')
        .onClick(()=>{
        this.me.memberC+=1
      })
    }
    .width('100%')
    .height('100%')
  }
}
