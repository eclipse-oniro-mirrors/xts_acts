/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct AllowDropNullAndUndefined {
  @State dropText: string = 'No Drop';

  build() {
    Column() {
      Text('allowDrop Null Undefined Test')
        .width('100%')
        .height('10%')

      Text(this.dropText)
        .id('dropText')
        .width('100%')
        .height('10%')

      Text('Drag Source')
        .id('dragSource')
        .width('100%')
        .height('20%')
        .backgroundColor(Color.Green)
        .draggable(true)
        .onDragStart(() => {
        })

      Text('Test allowDrop null')
        .id('targetNull')
        .width('100%')
        .height('15%')
        .backgroundColor(Color.Blue)
        .allowDrop(null)
        .onDrop((event: DragEvent) => {
          this.dropText = 'Drop Triggered';
        })

      Text('Test allowDrop undefined')
        .id('targetUndefined')
        .width('100%')
        .height('15%')
        .backgroundColor(Color.Red)
        .allowDrop(undefined)
        .onDrop((event: DragEvent) => {
          this.dropText = 'Drop Triggered';
        })

      Text('Test allowDrop empty array')
        .id('targetEmptyArray')
        .width('100%')
        .height('15%')
        .backgroundColor(Color.Yellow)
        .allowDrop([])
        .onDrop((event: DragEvent) => {
          this.dropText = 'Drop Triggered';
        })
    }
    .width('100%')
    .height('100%')
  }
}
