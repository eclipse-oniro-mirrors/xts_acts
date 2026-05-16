'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {
  Entry,
  Component,
  FlexDirection,
  Flex,
  ItemAlign,
  FlexAlign,
  TextArea,
  Alignment,
  TextAlign
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct TextAreaOnCut {
  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear TextAreaOnCut start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear TextAreaOnCut end`)
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      TextArea({ placeholder: "textArea-OnCut" })
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)//input输入框中的文字被剪切时触发
        .onCut(() :void=> {
          console.log('onCut method is triggered');
        })
        .key("onCutText")

      TextArea({ placeholder: "textArea-OnPaste" })
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)//input输入框中的粘贴文字时触发
        .onPaste(() :void=> {
          console.log("onPaste method is  triggered")
        })
        .key("onPasteText")

      TextArea({ placeholder: "textArea-CopyOption" })
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)/**copyOption(value: boolean | CopyOption):
         * 设置复制选项时调用
         * InApp = 0,Share in app.
         * LocalDevice = 1,Share in local device.
         * CrossDevice = 2,Share cross device.
         */
        .copyOption(undefined)
        .key("textAreaCopyOptionText")

    }.width("100%").height("100%")
  }
}

