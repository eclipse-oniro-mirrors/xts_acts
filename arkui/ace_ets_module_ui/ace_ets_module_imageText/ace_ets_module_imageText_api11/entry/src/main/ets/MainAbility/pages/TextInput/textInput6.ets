/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct TextInputOnEditChange {
  @State num: number = 0

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear TextInputOnEditChange start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear TextInputOnEditChange end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      TextInput({ placeholder: "textInput-OnEditChange" })
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .onEditChange(() => {
          console.log(`Input state changed ${this.num++}`)
        })
        .key("onEditChangeText")

      TextInput({ placeholder: "textInput-OnCut" })
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)//input输入框中的文字被剪切时触发
        .onCut(() => {
          console.log("onCut method is triggered")
        })
        .key("onCutText")

      TextInput({ placeholder: "textInput-OnPaste" })
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)//input输入框中的粘贴文字时触发
        .onPaste(() => {
          console.log("onPaste method is triggered")
        })
        .key("onPasteText")

      TextInput({ placeholder: "textInput-CopyOption" })
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)//设置复制选项时调用
        .copyOption(0)
        .key("textInputCopyOptionText")

      TextInput({ placeholder: "textInput-ShowPasswordIcon" })
        .type(InputType.Password)
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)//设置密码显示/隐藏图标时调用
        .showPasswordIcon(true)
        .key("showPasswordIconText")

    }.width("100%").height("100%")
  }
}

