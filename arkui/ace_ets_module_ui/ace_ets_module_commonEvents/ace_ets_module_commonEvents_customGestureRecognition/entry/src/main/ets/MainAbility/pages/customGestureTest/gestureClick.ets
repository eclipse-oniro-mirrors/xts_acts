/*
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
struct gestureDefine1 {
  @State message1: string = ''
  @State message2: string = ''

  build() {
    Column({space:20}) {
      Text(this.message1+'--'+this.message2)
        .fontSize(18)
        .margin(10)
        .id('gesture_click_text')
      Button("button")
        .id("gesture_click_button")
        .width(100)
        .height(80)
        .onClick((event)=>{
          if(event){
            this.message1 = '点击事件成功响应'
          }
        })
        .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent) => {
          if (gestureInfo.type == GestureControl.GestureType.CLICK) {
            this.message2 = 'GestureType为CLICK'
          }else{
            return GestureJudgeResult.REJECT;
          }
          return GestureJudgeResult.CONTINUE;
        })
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}