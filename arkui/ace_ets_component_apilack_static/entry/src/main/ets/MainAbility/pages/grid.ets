'use static';
/*
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
  EdgeEffect,
  ColumnOptions,
  Flex,
  Text,
  Column,
  Grid,
  ForEach,
  GridItem,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Alignment,
  TextAlign,
  TextOverflow
} from '@ohos.arkui.component';
import { State, StorageLink, AppStorage } from '@ohos.arkui.stateManagement';

import events_emitter from '@ohos.events.emitter'
import Log from '../common/Log';

const TAG = 'ets_apiLack_add';

@Entry
@Component
struct GridMaxCount {
  @State Number1: String[] = ['5', '6', '7', '8', '9']
  @State edgeEffect: EdgeEffect = EdgeEffect.None;
  @StorageLink('alwaysEnabled') alwaysEnabled: boolean = true

  aboutToAppear() {
    Log.showInfo(TAG, `aboutToAppear GridMaxCount start`)
  }

  aboutToDisappear() {
    Log.showInfo(TAG, `aboutToDisAppear GridMaxCount end`)
  }

  onPageShow() {
    console.info('list page show called');
    AppStorage.setOrCreate<boolean>('alwaysEnabled', true);
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {

      Text("grid-MaxCount")
        .width(100)
        .height(70)
        .fontSize(20)
        .opacity(1)
        .align(Alignment.TopStart)
        .fontColor(0xCCCCCC)
        .lineHeight(25)
        .border({ width: 1 })
        .padding(10)
        .textAlign(TextAlign.Center)
        .textOverflow({ overflow: TextOverflow.None })
        .key("maxCountText")


      Column({ space: 5 } as ColumnOptions) {
        Grid() {
          ForEach(this.Number1, (day: string) => {
            ForEach(this.Number1, (day: string) => {
              GridItem() {
                Text(day)
                  .fontSize(16)
                  .backgroundColor(0xF9CF93)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
            }, (day: string) => day)
          }, (day: string) => day)
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
        .columnsGap(10)
        .rowsGap(10)
        .width('90%')
        .backgroundColor(0xFAEEE0)
        .height(300)
        .maxCount(5)
        .edgeEffect(this.edgeEffect, { alwaysEnabled: this.alwaysEnabled })
        .key("maxCountTest")

      }
    }.width("100%").height("100%")
  }
}


