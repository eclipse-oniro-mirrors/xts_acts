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
struct DragInteractionOptions1 {
  @State numbers: number[] = [0, 1, 2, 3, 4 , 5, 6, 7, 8]
  @State flag: string = "Init"
  @State dragPreviewOptions1: DragPreviewOptions = {
    mode: DragPreviewMode.ENABLE_DEFAULT_SHADOW,
    numberBadge: true
  }
  @State dragPreviewOptions2: DragPreviewOptions = {
    mode: DragPreviewMode.ENABLE_DEFAULT_RADIUS,
  }
  @State DragInteractionOptions1: DragInteractionOptions = {
    isMultiSelectionEnabled: true,
    defaultAnimationBeforeLifting: true
  }
  build() {
    Column({ space: 5}) {
      Button(this.flag).id("dragPreviewOptions_button")
        .onClick(()=>{
          this.dragPreviewOptions1 = this.dragPreviewOptions2
        })
      Grid() {
        ForEach(this.numbers, (item: number) => {
          GridItem() {
            Column()
              .backgroundColor(Color.Red)
              .width('100%')
              .height('100%')
          }
          .id("DragInteractionOptionsGridItem" + item)
          .width(90)
          .height(90)
          .selectable(true)
          .selected(true)
          .dragPreviewOptions(this.dragPreviewOptions1, this.DragInteractionOptions1)
          .onDragStart(()=>{
            this.flag = "drag succ"
          })
    }, (item: string) => item)
      }
      .columnsTemplate('1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .height(300)
    }
    .width('100%')
  }
}