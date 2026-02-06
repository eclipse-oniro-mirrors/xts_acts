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
import { Entry,Color, Component, Column,ColumnOptions,Text,Flex,FlexDirection,FlexWrap,FlexAlign,ItemAlign,FlexOptions,HorizontalAlign,Margin } from '@ohos.arkui.component';
import { State,AppStorage } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct FlexMargin_Start {
  private content: string = "FlexMargin_Start Page";

  onPageShow() {
    console.info('FlexMargin_Start page show called');
  }

  onBuildDone() {
    console.info('FlexMargin_Start page build done called');
  }

  build() {
    Column() {
      Column() {
        Text('FlexTest05').fontSize(9).fontColor(Color.Red).width('90%')
        Flex({
          direction: FlexDirection.Row,
          alignItems: ItemAlign.Start,
          wrap: FlexWrap.NoWrap,
        } as FlexOptions) {
          Text('1').width(150).height(50).backgroundColor(Color.Red).key('textFlexMargin01')
          Text('2').width(150).height(100).backgroundColor(Color.Red).key('textFlexMargin02')
          Text('3').width(150).height(150).backgroundColor(Color.Red).key('textFlexMargin03')
        }
        .key('flexMargin')
        .height(200)
        .width(500)
        .margin(10)
        .backgroundColor(Color.Red)
      }.width('100%').alignItems(HorizontalAlign.Start)
    }.width('100%')
  }
}
