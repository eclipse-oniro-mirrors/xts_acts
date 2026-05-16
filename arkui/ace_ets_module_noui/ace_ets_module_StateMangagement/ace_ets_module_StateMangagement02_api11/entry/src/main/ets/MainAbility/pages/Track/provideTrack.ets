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
class pro_con{
  @Track memberA:number=20
  @Track memberB:string='MemberB'
}
@Observed
class pro_Parent extends pro_con {
  @Track memberC:number=30
}
@Component
struct proConTrack {
  @Consume procon :pro_Parent
  build() {
    Column() {
      Text('@Consume').fontSize(9).height('5%')
      Text('memberA='+`${this.procon.memberA}`).height('5%')
        .key('Track_consume')
        .fontSize(9)
      Text('memberC='+`${this.procon.memberC}`).height('5%')
        .key('Track_consume1')
        .fontSize(9)
      Button('change').height('5%')
        .key('change_consume')
        .onClick(()=>{
        this.procon.memberA+=1
        this.procon.memberC+=1
      })
    }
    .height('20%')
  }
}
@Entry
@Component
struct proCon {
  @Provide procon:pro_Parent=new pro_Parent()
  build() {
    Column() {
      Button("Reset").key("provideTrack_reset").height('5%')
        .onClick(() => {
          this.procon.memberA=20
          this.procon.memberC=30
        })
      Column() {
        Text('@Provide').fontSize(9).height('5%')
        Text('memberA=' + `${this.procon.memberA}`).height('5%')
          .key('Track_provide')
          .fontSize(9)
        Text('memberC=' + `${this.procon.memberC}`).height('5%')
          .key('Track_provide1')
          .fontSize(9)
        Button('change').height('5%')
          .key('change_provide')
          .onClick(() => {
          this.procon.memberA += 1
          this.procon.memberC += 1
        })
      }.border({width:2,color:Color.Red})
      proConTrack().border({width:2,color:Color.Orange})
    }
    .width('100%')
    .height('100%')
  }
}
