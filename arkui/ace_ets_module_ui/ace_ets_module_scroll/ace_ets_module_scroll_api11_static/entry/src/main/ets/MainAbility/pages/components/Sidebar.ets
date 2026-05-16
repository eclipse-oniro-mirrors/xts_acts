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

import {
  Entry,
  Component,
  Column,
  Flex,
  Visibility,
  Button,
  Text,
  SideBarContainer,
  ClickEvent,
  FontWeight,
  Color,
  RowSplit,
  FlexDirection,
  ItemAlign,
  FlexAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct SideBarContainerTest {
  @State text: String = ''

  onPageShow() {
    console.info('sideBar page show called');
  }

  onBuildDone() {
    console.info('sideBar page build done called');
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      SideBarContainer() {
        Column() {
          Button('One')
            .onClick((e: ClickEvent) => {
              console.info('click one')
              this.text = 'one click'
            })
          Button('Two')
            .onClick((e: ClickEvent) => {
              console.info('click two')
              this.text = 'two click'
            })
          Button('Three')
            .onClick((e: ClickEvent) => {
              console.info('click three')
              this.text = 'three click'
            })
          Button('Four')
            .onClick((e: ClickEvent) => {
              console.info('click four')
              this.text = 'four click'
            })
        }

        RowSplit() {
          Column() {
            Text('Split page one')
          }

          Column() {
            Text('Split page two')
          }
        }
      }
      .showControlButton(true)
      .sideBarWidth('240')
      .minSideBarWidth(210)
      .maxSideBarWidth(260)
      .key('sidebar')
      .onChange((value: boolean) => {
        console.info('status' + value)
      })

      SideBarContainer() {
        Column() {
          Button('One')
            .onClick((e: ClickEvent) => {
              console.info('click one')
              this.text = 'one click'
            })
          Button('Two')
            .onClick((e: ClickEvent) => {
              console.info('click two')
              this.text = 'two click'
            })
          Button('Three')
            .onClick((e: ClickEvent) => {
              console.info('click three')
              this.text = 'three click'
            })
          Button('Four')
            .onClick((e: ClickEvent) => {
              console.info('click four')
              this.text = 'four click'
            })
        }

        RowSplit() {
          Column() {
            Text('Split page one')
          }

          Column() {
            Text('Split page two')
          }
        }
      }
      .showControlButton(true)
      .sideBarWidth('240')
      .minSideBarWidth(210)
      .maxSideBarWidth(260)
      .key('sidebar1')
      .onChange((value: boolean) => {
        console.info('status' + value)
      })
    }
  }
}
