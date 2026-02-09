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
import events_emitter from '@ohos.events.emitter';
import { Entry, Component, Column, Flex, FlexDirection, FlexOptions, BadgeParamWithNumber, BadgeParamWithString, ItemAlign,ResourceStr,
  FlexAlign, Text, FontWeight, Badge, BadgePosition, Button, ClickEvent, Color, ResourceColor,Resource,TextAlign, Margin} from '@ohos.arkui.component'
import { State, StoragePropRef, AppStorage } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Badge3Example {
  @State counts: int = 1;
  @StoragePropRef('message') message: string = 'new';
  @StoragePropRef('fontSizeValue') fontSizeValue: undefined|number|string|Resource = 20 as number;
  @StoragePropRef('colorValue') colorValue: ResourceColor | undefined = Color.Red;

  build() {
    Flex({ justifyContent: FlexAlign.SpaceAround } as FlexOptions) {
      Badge({
        count: this.counts,
        maxCount: 99,
        style: { color: this.colorValue, fontSize: this.fontSizeValue, badgeSize: 50, badgeColor: Color.Red }
      } as BadgeParamWithNumber) {
        Button('message')
          .onClick((e: ClickEvent) => {
            this.counts++
          })
          .width(200)
          .height(100)
          .backgroundColor(Color.White)
          .fontSize(20)
      }.width(100).height(50).key('badge')

      Badge({
        value: this.message,
        style: { color: this.colorValue, fontSize: 9, badgeSize: 20, badgeColor: Color.Red }
      } as BadgeParamWithString) {
        Text('message')
          .width(80)
          .height(50)
          .fontSize(16)
          .lineHeight(37)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.White)
      }.width(80).height(50).key('badge2')

      Badge({
        value: '',
        position: 1 as BadgePosition,
        style: { badgeSize: 6, badgeColor: Color.Red }
      } as BadgeParamWithString) {
        Text('message')
          .width(90)
          .height(50)
          .fontSize(16)
          .lineHeight(37)
          .borderRadius(10)
          .textAlign(TextAlign.Center)
          .backgroundColor(Color.White)
      }.width(90).height(50)

    }.width('100%').margin({ top: 5 } as Margin)
  }
}