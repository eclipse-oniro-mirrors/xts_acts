'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { State } from '@ohos.arkui.stateManagement'
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  Margin,
  Stack,
  Color,
  FlexAlign,
  ShadowOptions,
  Alignment
} from '@ohos.arkui.component'

@Entry
@Component
struct UseShadowBatchingPage {
  @State isShow: boolean | undefined = true;

  build() {
    Column() {
      Column(undefined) {
        Stack(undefined) {
        }
        .width('90%')
        .height(50)
        .margin({ top: 5 } as Margin)
        .backgroundColor('#FFE4C4')
        .shadow({
          radius: 120,
          color: Color.Green,
          offsetX: 0,
          offsetY: 0
        } as ShadowOptions)
        .align(Alignment.TopStart)
        .shadow({
          radius: 120,
          color: Color.Green,
          offsetX: 0,
          offsetY: 0
        } as ShadowOptions)

        Stack(undefined) {

        }
        .width('90%')
        .height(50)
        .margin({ top: 5 } as Margin)
        .backgroundColor('#FFE4C4')
        .align(Alignment.TopStart)
        .shadow({
          radius: 120,
          color: Color.Red,
          offsetX: 0,
          offsetY: 0
        } as ShadowOptions)
        .width('90%')
        .backgroundColor(Color.White)

        Column(undefined) {
        }
        .justifyContent(FlexAlign.Center)
        .width(150)
        .height(150)
        .borderRadius(10)
        .backgroundColor('#f56c6c')
        .shadow({
          radius: 300,
          color: Color.Yellow,
          offsetX: 0,
          offsetY: 0
        } as ShadowOptions)

        Column(undefined) {
        }
        .justifyContent(FlexAlign.Center)
        .width(150)
        .height(150)
        .backgroundColor('#67C23A')
        .borderRadius(10)
        .translate({ y: -50 })
        .shadow({
          radius: 220,
          color: Color.Blue,
          offsetX: 0,
          offsetY: 0
        } as ShadowOptions)
      }
      .useShadowBatching(this.isShow ? true : undefined)
      .id('useShadowBatchingTest')

      Button('useShadowBatching: ')
        .id('useShadowBatching')
        .onClick((e: ClickEvent) => {
          this.isShow = !this.isShow;
        })
    }.width(300)
    .height(300)
  }
}