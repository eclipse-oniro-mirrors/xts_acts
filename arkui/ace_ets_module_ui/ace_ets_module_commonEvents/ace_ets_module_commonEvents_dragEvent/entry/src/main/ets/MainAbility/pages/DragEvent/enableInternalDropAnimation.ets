/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct enableInternalDropAnimation {
  @State onDrop00: string = '0';
  @State onDrop01: string = '0';
  @State onDrop10: string = '0';
  @State onDrop11: string = '0';
  @State onDrag0: string = '0';
  @State onDrag1: string = '0';
  @State onDrag2: string = '0';
  @State onDrag3: string = '0';
  @State onDrag4: string = '0';

  build() {
    Row() {
      Scroll() {
        Column({ space: 5 }) {
          Column() {
            Text("OnDrop, useCustomDropAnimation = 0")
              .width('100%')
              .backgroundColor(Color.Pink)
            Row() {
              Column() {
                Text(this.onDrop00).id('onDropText00')
                Column()
                  .id('onDropped00')
                  .width('15%')
                  .height('10%')
                  .backgroundColor(Color.White)
                  .draggable(true)
                  .margin({ bottom: 10 })
                  .dragPreviewOptions({ mode: DragPreviewMode.DISABLE_SCALE })
                  .onDragStart(() => {
                    console.log("Helix_Console: drag start");
                  })
                  .onDragEnter(() => {
                    console.log("Helix_Console: drag enter");
                  })
                  .onDragLeave(() => {
                    console.log("Helix_Console: drag leave");
                  })
                  .onDrop((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("")
                    } catch (e) {
                      this.onDrop00 = String(e.code)
                      console.error("Helix_Console: onDrop. code " + e.code + ". message " + e.message)
                    }
                  })
              }
              .margin({ right: 5 })

              Column() {
                Text(this.onDrop01).id('onDropText01')
                Column()
                  .id('onDropped01')
                  .width('15%')
                  .height('10%')
                  .backgroundColor(Color.Orange)
                  .draggable(true)
                  .margin({ bottom: 10 })
                  .dragPreviewOptions({ mode: DragPreviewMode.DISABLE_SCALE })
                  .onDragStart(() => {
                    console.log("Helix_Console: drag start");
                  })
                  .onDragEnter(() => {
                    console.log("Helix_Console: drag enter");
                  })
                  .onDragLeave(() => {
                    console.log("Helix_Console: drag leave");
                  })
                  .onDrop((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("{\"targetPos\": [8, 8]}")
                    } catch (e) {
                      this.onDrop01 = String(e.code)
                      console.error("Helix_Console: onDrop. code " + e.code + ". message " + e.message)
                    }
                  })
              }
              .margin({ left: 5 })
            }
            .margin({ top: 10 })
            .borderWidth(1)
            .borderColor(Color.Black)
          }
          .borderWidth(3)
          .borderColor(Color.Black)

          Column() {
            Text("OnDrop, useCustomDropAnimation = 1")
              .width('100%')
              .backgroundColor(Color.Pink)
            Row() {
              Column() {
                Text(this.onDrop10).id('onDropText10')
                Column()
                  .id('onDropped10')
                  .width('15%')
                  .height('10%')
                  .backgroundColor(Color.White)
                  .draggable(true)
                  .margin({ bottom: 10 })
                  .dragPreviewOptions({ mode: DragPreviewMode.DISABLE_SCALE })
                  .onDragStart(() => {
                    console.log("Helix_Console: drag start");
                  })
                  .onDragEnter(() => {
                    console.log("Helix_Console: drag enter");
                  })
                  .onDragLeave(() => {
                    console.log("Helix_Console: drag leave");
                  })
                  .onDrop((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("")
                    } catch (e) {
                      this.onDrop10 = String(e.code)
                      console.error("Helix_Console: onDrop. code " + e.code + ". message " + e.message)
                    }
                    event.useCustomDropAnimation = true
                  })
              }
              .margin({ right: 5 })

              Column() {
                Text(this.onDrop11).id('onDropText11')
                Column()
                  .id('onDropped11')
                  .width('15%')
                  .height('10%')
                  .backgroundColor(Color.Orange)
                  .draggable(true)
                  .margin({ bottom: 10 })
                  .dragPreviewOptions({ mode: DragPreviewMode.DISABLE_SCALE })
                  .onDragStart(() => {
                    console.log("Helix_Console: drag start");
                  })
                  .onDragEnter(() => {
                    console.log("Helix_Console: drag enter");
                  })
                  .onDragLeave(() => {
                    console.log("Helix_Console: drag leave");
                  })
                  .onDrop((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("{\"targetPos\": [8, 8]}")
                    } catch (e) {
                      this.onDrop11 = String(e.code)
                      console.error("Helix_Console: onDrop. code " + e.code + ". message " + e.message)
                    }
                    event.useCustomDropAnimation = true
                  })
              }
              .margin({ left: 5 })
            }
            .margin({ top: 10 })
            .borderWidth(1)
            .borderColor(Color.Black)
          }
          .borderWidth(3)
          .borderColor(Color.Black)

          Column() {
            Text("Use in OnDragXXX")
              .width('100%')
              .backgroundColor(Color.Pink)
            Row() {
              Column() {
                Text(this.onDrag0).id('onDragText0')
                Text(this.onDrag1).id('onDragText1')
                Text(this.onDrag2).id('onDragText2')
                Text(this.onDrag3).id('onDragText3')
                Text(this.onDrag4).id('onDragText4')
                Column()
                  .id('onDrag')
                  .width('15%')
                  .height('10%')
                  .backgroundColor(Color.White)
                  .draggable(true)
                  .margin({ bottom: 10 })
                  .dragPreviewOptions({ mode: DragPreviewMode.DISABLE_SCALE })
                  .onDragStart((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("{\"targetPos\": [8, 8]}")
                    } catch (e) {
                      this.onDrag0 = String(e.code)
                      console.error("Helix_Console: onDragStart. code " + e.code + ". message " + e.message)
                    }
                  })
                  .onDragEnter((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("{\"targetPos\": [8, 8]}")
                    } catch (e) {
                      this.onDrag1 = String(e.code)
                      console.error("Helix_Console: onDragEnter. code " + e.code + ". message " + e.message)
                    }
                  })
                  .onDragMove((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("{\"targetPos\": [8, 8]}")
                    } catch (e) {
                      this.onDrag2 = String(e.code)
                      console.error("Helix_Console: onDragMove. code " + e.code + ". message " + e.message)
                    }
                  })
                  .onDragLeave((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("{\"targetPos\": [8, 8]}")
                    } catch (e) {
                      this.onDrag3 = String(e.code)
                      console.error("Helix_Console: onDragLeave. code " + e.code + ". message " + e.message)
                    }
                  })
                  .onDragEnd((event: DragEvent) => {
                    try {
                      event.enableInternalDropAnimation("{\"targetPos\": [8, 8]}")
                    } catch (e) {
                      this.onDrag4 = String(e.code)
                      console.error("Helix_Console: onDragEnd. code " + e.code + ". message " + e.message)
                    }
                  })
                  .onDrop(() => {
                    console.log("Helix_Console: drag drop");
                  })
              }
              .margin({ right: 5 })
            }
            .margin({ top: 10 })
            .borderWidth(1)
            .borderColor(Color.Black)

          }
          .borderWidth(3)
          .borderColor(Color.Black)
        }
        .height('100%')
        .width('100%')
        .backgroundColor(Color.Grey)

      }
    }
    .height('90%')
    .width('100%')
    .align(Alignment.Top)
  }
}