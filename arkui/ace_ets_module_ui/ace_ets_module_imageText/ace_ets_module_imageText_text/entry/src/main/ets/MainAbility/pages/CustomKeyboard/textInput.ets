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

import { ComponentContent } from '@kit.ArkUI';

@Builder
function itemBuilder() {
  Row(){
    Button('delete')
      .id('BtnDelete')
      .width(100)
      .height('5%')

    Button('set')
      .id('BtnSet')
      .width(100)
      .height('5%')
  }
  .backgroundColor(Color.Gray)
  .height(undefined)
  .justifyContent(FlexAlign.SpaceEvenly)
}

@Entry
@Component
struct Page {
  builder: ComponentContent<[]> = new ComponentContent(this.getUIContext(), wrapBuilder(itemBuilder));

  build() {
    Row(){
      Column(){
        Text('TextInput')
          .height('5%')

        TextInput()
          .id('textInput')
          .height('30%')
          .defaultFocus(true)
          .customKeyboard(this.builder)
      }
      .width('100%')
    }
    .height('100%')
  }
}