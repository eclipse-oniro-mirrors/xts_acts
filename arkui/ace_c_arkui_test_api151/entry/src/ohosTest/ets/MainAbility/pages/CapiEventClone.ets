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


import nativeNode from "libnativeNode.so";
import {UIContext} from '@ohos.arkui.UIContext';
@Entry
@Component
struct Xcomponent {
  @Builder DraggingBuilder() {
    Column() {
      Text("hello")
    }
  }

  @State value: number = 100
  @State width1: string = '100%'
  aboutToAppear(): void {
    this.getUIContext().getFocusController().activate(true)
  }
  aboutToDisappear(): void {
    this.getUIContext().getFocusController().activate(false)
  }

  build() {
    Column() {

      Column() {

        XComponent({
          id: 'xcomponentId',
          type: "node",
          libraryname: 'nativeNode'
        }).backgroundColor(Color.White)
          .onAppear(() => {
            console.log("onAppear");
            // let context = getContext();
            nativeNode.createNativeNode("xcomponentId");
          }).width(`${this.width1}`)
          .id("xcomponent")
          .onFocus(()=> {
            console.log("onFocus");
          })
          .onClick(()=> {
            console.log("onClick");
          })
          .onTouch(()=> {
            console.log("onTouch");
          })
          .onBlur(()=> {
            console.log("onBlur");
          })
          .onKeyEvent(()=> {
            console.log("onKeyEvent");
          })
          .onHover(()=> {
            console.log("onHover");
          })
          .onMouse(()=> {
            console.log("onMouse");
          })
          .onAreaChange(()=> {
            console.log("onAreaChange");
          })
          .onVisibleAreaChange([0.0, 1.0],()=> {
            console.log("onVisibleAreaChange");
          })
          .focusable(true)
        // .defaultFocus(true)

      }
      .focusable(true)
      .margin({
        top: 27,
        left: 12,
        right: 12
      })
      .height(`${this.value}%`)
      .width('100%')
      .focusable(true)
      .onAppear(() => {

      })
    }
    .focusable(true)
    .width('100%')
    .height('100%')
  }
}