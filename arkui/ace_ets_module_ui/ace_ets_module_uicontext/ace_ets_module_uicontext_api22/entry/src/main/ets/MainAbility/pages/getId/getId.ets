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

@Entry
@Component
struct getIdIdex {
  @State
  myCount : number = 100
  @State getUIContextId:number =0

  build() {
    Column(){
      Image($r('app.media.icon'))
        .width(400)
        .height(200)
        .id('id')
        .margin(20)

      Text('' + this.getUIContextId)
        .fontSize(20)
        .id('testID')
    }
    .id('getId')
    .width('100%')
    .height('100%')
    .onClick(()=>{
      console.log('单实例 getId :', JSON.stringify(this.getUIContext().getId()))
      this.getUIContextId=this.getUIContext().getId()
    })
  }
}