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
  Column,
  Component,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  Button,
  FontWeight,
  Row,
  ClickEvent,
  Margin,
  ButtonType,
  SideBarContainer,
  SideBarContainerType,
  ForEach,
  Color,
  ColumnOptions,
  Resource,
  ButtonStyle,
  TextOverflow,
  TextAlign,
  Alignment,
  RowSplit,
  $r,
  Color
} from '@ohos.arkui.component'
import { State,AppStorage } from '@ohos.arkui.stateManagement'
import { MessageManager, Callback, Message } from '../../common/MessageManager';
import Log from '../../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct SidebarIcons {
  @State arr: Array<number> = new Array<number>(1, 2)

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear SidebarIcons start`);
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear SidebarIcons end`);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("sidebar-Icons")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(Color.Red)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("iconsText")

      SideBarContainer(SideBarContainerType.Embed) {
        Column() {
          ForEach(this.arr, (item: number, index: int) => {
            Column({ space: 5 } as ColumnOptions) {
              Text("Index0" + item)
                .fontSize(20)
            }
          }, (item: number) => item!.toString())
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .backgroundColor('#19000000')

        RowSplit() {
          Column() {
            Text('Split page').fontSize(30)
          }
        }.width('100%')
      }
      .key("SideBarContainer")
      .sideBarWidth(240)
      .minSideBarWidth(210)
      .maxSideBarWidth(260)
      .controlButton({
        icons: {
          shown: $r("app.media.icon"),
          hidden: $r("app.media.icon")
        }
      })
    }
    .width("100%")
    .height("100%")
  }
}

