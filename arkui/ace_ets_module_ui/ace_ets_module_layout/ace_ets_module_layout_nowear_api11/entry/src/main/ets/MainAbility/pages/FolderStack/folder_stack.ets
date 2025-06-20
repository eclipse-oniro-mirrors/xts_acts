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
struct IndexFold {
  @State len_wid: number = 480
  @State w: string = "40%"
  @State text1:string = ""
  @State text2:string = ""
  @State text3:string = ""
  @State text4:string = ""

  build() {
    Column() {
      Text(this.text1).key("flod_tx1")
      Text(this.text2).key("flod_tx2")
      Text(this.text3).key("flod_tx3")
      Text(this.text4).key("flod_tx4")
      FolderStack({ upperItems: ["upperitemsId"] }) {
        Column() {
          Text("vedio zone").height("100%").width("100%").textAlign(TextAlign.Center).fontSize(25)
        }.backgroundColor(Color.Pink).width("100%").height("100%").id("upperitemsId")

        Column() {
          Text("vedio title")
            .width("100%")
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Red)
            .fontSize(25)
        }.width("100%").height("100%").justifyContent(FlexAlign.Start)

        Column() {
          Text("vedie bar ")
            .width("100%")
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Red)
            .fontSize(25)
        }.width("100%").height("100%").justifyContent(FlexAlign.End)
      }
      .backgroundColor(Color.Yellow)
      .enableAnimation(true)
      .autoHalfFold(true)

      .onFolderStateChange((msg) => {
        if (msg.foldStatus === FoldStatus.FOLD_STATUS_EXPANDED) {
          this.text1 = "EXPANDED"
          console.info("The device is currently in the expanded state")
        } else if (msg.foldStatus === FoldStatus.FOLD_STATUS_HALF_FOLDED) {
          this.text2 = "HALF_FOLDED"
          console.info("The device is currently in the half folded state")
        } else if (msg.foldStatus == FoldStatus.FOLD_STATUS_UNKNOWN){
          this.text3 = "UNKNOWN"
          console.info("The device is currently in the unknown folded state")
        } else if (msg.foldStatus == FoldStatus.FOLD_STATUS_FOLDED) {
          this.text4 = "STATUS_FOLDED"
          console.info("The device is currently in FOLD_STATUS_FOLDED state")
        }
      })
      // folderStack如果不撑满页面全屏，作为普通Stack使用
      .alignContent(Alignment.Bottom)
      .height("100%")
      .width("100%")
      .borderWidth(1)
      .backgroundColor(Color.Yellow)

    }
    .height("100%")
    .width("100%")
    .borderWidth(1)
    .backgroundColor(Color.Pink)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])

  }
}