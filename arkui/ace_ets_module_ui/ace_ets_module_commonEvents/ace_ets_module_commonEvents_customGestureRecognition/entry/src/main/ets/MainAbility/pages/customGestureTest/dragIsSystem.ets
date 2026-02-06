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
struct gestureDefine3 {
  @State isSystemGesture: boolean = false

  build() {
    Column({space:20}) {
      Text("isSystem is" + " " + this.isSystemGesture)
        .fontSize(18)
        .margin(10)
        .id('dragIsSystemBtn2')
      Button("button")
        .id('dragIsSystemBtn1')
        .width(100)
        .height(80)
        .onDragStart(() => {
        })
        .onGestureJudgeBegin((gestureInfo: GestureInfo, event: BaseGestureEvent) => {
          this.isSystemGesture = gestureInfo.isSystemGesture
          return GestureJudgeResult.CONTINUE;
        })
    }.height('100%').width('100%').justifyContent(FlexAlign.Center)
  }
}