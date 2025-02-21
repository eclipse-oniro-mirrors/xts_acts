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
struct SheetTransitionExample {
  @State isShow1: boolean = false;
  @State isShow2: boolean = false;
  @State isShow3: boolean = false;
  @State isShow4: boolean = false;
  @State isShow5: boolean = false;

  @Builder
  myBuilder() {
    Column() {
      Button("content1")
        .margin(10)
        .fontSize(20)

      Button("content2")
        .margin(10)
        .fontSize(20)
    }
    .width('100%')
  }

  build() {
    Column() {
      Button('init').margin(20).key("blurStyle_init")
      Button("BlurStyle 1")
        .key("blurStyle_1")
        .onClick(() => {
          this.isShow1 = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow1, this.myBuilder(), {
          height: 300,
          backgroundColor: Color.Gray,
          blurStyle: BlurStyle.COMPONENT_ULTRA_THIN,
          showClose: true,
          title: { title: "title", subtitle: "subtitle" },
          shouldDismiss: ((sheetDismiss: SheetDismiss) => {
            console.log("bind sheet shouldDismiss")
            sheetDismiss.dismiss()
          })
        })

      Button("BlurStyle 2")
        .key("blurStyle_2")
        .onClick(() => {
          this.isShow2 = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow2, this.myBuilder(), {
          height: 300,
          backgroundColor: Color.Gray,
          blurStyle: BlurStyle.COMPONENT_THIN,
          showClose: true,
          title: { title: "title", subtitle: "subtitle" },
          shouldDismiss: ((sheetDismiss: SheetDismiss) => {
            console.log("bind sheet shouldDismiss")
            sheetDismiss.dismiss()
          })
        })

      Button("BlurStyle 3")
        .key("blurStyle_3")
        .onClick(() => {
          this.isShow3 = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow3, this.myBuilder(), {
          height: 300,
          backgroundColor: Color.Gray,
          blurStyle: BlurStyle.COMPONENT_REGULAR,
          showClose: true,
          title: { title: "title", subtitle: "subtitle" },
          shouldDismiss: ((sheetDismiss: SheetDismiss) => {
            console.log("bind sheet shouldDismiss")
            sheetDismiss.dismiss()
          })
        })

      Button("BlurStyle 4")
        .key("blurStyle_4")
        .onClick(() => {
          this.isShow4 = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow4, this.myBuilder(), {
          height: 300,
          backgroundColor: Color.Gray,
          blurStyle: BlurStyle.COMPONENT_THICK,
          showClose: true,
          title: { title: "title", subtitle: "subtitle" },
          shouldDismiss: ((sheetDismiss: SheetDismiss) => {
            console.log("bind sheet shouldDismiss")
            sheetDismiss.dismiss()
          })
        })

      Button("BlurStyle 5")
        .key("blurStyle_5")
        .onClick(() => {
          this.isShow5 = true
        })
        .fontSize(20)
        .margin(10)
        .bindSheet($$this.isShow5, this.myBuilder(), {
          height: 300,
          backgroundColor: Color.Gray,
          blurStyle: BlurStyle.COMPONENT_ULTRA_THICK,
          showClose: true,
          title: { title: "title", subtitle: "subtitle" },
          shouldDismiss: ((sheetDismiss: SheetDismiss) => {
            console.log("bind sheet shouldDismiss")
            sheetDismiss.dismiss()
          })
        })

    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
  }
}
