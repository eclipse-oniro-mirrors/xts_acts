/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct DragInteraction {
  @State DragInteractionOptions1: DragInteractionOptions = {
    isLiftingDisabled: false
  }
  @State PreviewConfiguration1: PreviewConfiguration = {
    onlyForLifting: false,
    delayCreating: true
  }
  @State flag: string = 'Init'

  build() {
    Row() {
      Column() {
        Button('TestButton').id('TestButton')
        Text(this.flag)
          .id('Text1')
          .fontSize(15)
          .height(25)
          .margin({ top: 10 })
        Text('Test 4 Text')
          .id('Text2')
          .fontSize(50)
          .width('100%')
          .draggable(true)
          .margin({ top: 15 })
          .dragPreviewOptions({}, this.DragInteractionOptions1)
          .dragPreview('builder', this.PreviewConfiguration1)
          .onDragStart(() => {
            this.flag = 'suc'
          })
      }.width('45%')
    }
    .height('100%')
  }
}