'use static';
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
import window from '@ohos.window';
import {
  Entry, Component,
  Column, ColumnOptions, Row, RowOptions,
  Text, Button, FontWeight, ClickEvent, Margin, 
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TestPage {
  uiContext:UIContext = this.getUIContext();
  @State windowName :string = ""
  aboutToAppear() {
    this.windowName = this.getUIContext().getWindowName()!;
    console.error('WindowName ' + this.windowName);
    const currWindow = window.findWindow(this.windowName);
    console.log('++++++++currWindow',currWindow)
    const windowProperties = currWindow.getWindowProperties();
    console.error(`Window width ${windowProperties.windowRect.width}, height ${windowProperties.windowRect.height}`);
  }

  build() {
    Row() {
      Column() {
        Text("cacheDir="+this.uiContext?.getHostContext()!.cacheDir).fontSize(25)
        Text("bundleCodeDir="+this.uiContext?.getHostContext()!.bundleCodeDir).fontSize(25)
        Text("object = "+this.uiContext?.getHostContext()).fontSize(25).key("getHostContext")
        Text(this.windowName).fontSize(25).key("getWindowName")
      }
      .width('100%')
    }
    .height('100%')
  }
}