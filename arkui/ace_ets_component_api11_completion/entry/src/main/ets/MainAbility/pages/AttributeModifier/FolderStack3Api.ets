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
@Entry
@Component
struct FolderStack3Api {
  @State len_wid: number = 480;
  @State w: string = "40%";
  @State text:string = "start";
  build() {
    Column() {
      FolderStack({ upperItems: ["upperitemsId"] }) {
        Column() {
          Text(this.text).key('FolderStack3ApiTestText')
            .height("100%")
            .width("100%")
            .textAlign(TextAlign.Center).fontSize(25)
        }
        .backgroundColor(Color.Pink)
        .width("100%")
        .height("100%")
        .id("upperitemsId")

        Column() {
          Text("vedioTitle")
            .width("100%")
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Red)
            .fontSize(25)
            .key('FolderStack3ApiText01')
        }
        .width("100%")
        .height("100%")
        .justifyContent(FlexAlign.Start)

        Column() {
          Text("vedie bar ")
            .width("100%")
            .height(50)
            .textAlign(TextAlign.Center)
            .backgroundColor(Color.Red)
            .fontSize(25)
        }
        .width("100%")
        .height("100%")
        .justifyContent(FlexAlign.End)
      }
      .backgroundColor(Color.Yellow)
      .enableAnimation(true)
      .autoHalfFold(true)
      .key('FolderStack3ApiTestFolderStack')
      .onFolderStateChange(() => {
        this.text = 'fdsfsafasdfasdfsfds'
      })
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