'use static';
/**
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
import { Entry, Component, Column,Button,ColumnOptions,Color,Text,Flex,Direction,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct JustifyContentFlex {
  @State justifyContent: FlexAlign = FlexAlign.Center

  build() {
    Flex({ justifyContent: this.justifyContent } as FlexOptions) {
      Text('1')
        .width('20%')
        .height(50)
        .backgroundColor(Color.Red)
      Text('2')
        .width('20%')
        .height(50)
        .backgroundColor(Color.Red)
      Text('3')
        .width('20%')
        .height(50)
        .backgroundColor(Color.Red)
    }.key("justifyContent")
    .width('90%')
    .padding(10)
    .backgroundColor(Color.Red)
  }
}