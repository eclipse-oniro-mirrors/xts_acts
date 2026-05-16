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
import events_emitter from '@ohos.events.emitter';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import hilog from '@ohos.hilog';
import { Entry, Component, Column, Flex, Row, Image, FlexDirection, $r, ItemAlign, BadgeParamWithNumber, BadgeParamWithString, FlexAlign, Text, FontWeight, Badge, BadgePosition, Button, ClickEvent, Color, TextAlign, Margin} from '@ohos.arkui.component'
import { State,  AppStorage } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct badgeTest {

  aboutToAppear(){
    let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
    let abilityDelegatorArguments = abilityDelegatorRegistry.getArguments()
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
    hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
  }

  build() {
    Row() {
      Column() {
            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red ,fontWeight: 0}
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(Color.White)
            }
            .width(100).height(50)
            .key("ArkUX_Stage_Badge_FontWeight_0100")

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 400 }
            } as BadgeParamWithNumber) {
              Text("test")
                .width(100).height(50)
            }
            .key("ArkUX_Stage_Badge_FontWeight_0200")
            .width(100).height(50)

            Badge({
              value: 'new',
              style: { badgeSize: 6, badgeColor: '#FA2A2D', fontWeight: 100 }
            } as BadgeParamWithString) {
              Image($r("app.media.app_icon"))
                .width(24)
                .height(24)
            }
            .key("ArkUX_Stage_Badge_FontWeight_0300")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: "800" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_0400")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 200 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_0500")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 900 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_0600")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       fontWeight: FontWeight.Bolder}
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(100).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_0700")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 1000 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_0800")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_0900")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: undefined}
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_1000")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: -1 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_1100")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: "" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_1200")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: "adf@$5" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_1300")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 500 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_1400")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: undefined }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_1500")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, fontWeight: 600 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_FontWeight_1600")
            .width(100).height(50)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red ,borderColor: Color.White }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0100").height(20)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: '#fffd0000' }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0200").height(20)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: 'rgb(138,43,226)' }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0300").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderColor: Color.Pink }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0400").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: $r("app.color.badge_BorderColor") }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0500").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderColor: "" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0600").height(20)
            .backgroundColor($r("sys.color.ohos_id_color_badge_red"))
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0700").height(20)
            .backgroundColor($r("sys.color.ohos_id_color_badge_red"))
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderColor: undefined }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0800").height(20)
            .backgroundColor($r("sys.color.ohos_id_color_badge_red"))
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: Color.Pink}
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_0900").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: undefined }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .backgroundColor($r("sys.color.ohos_id_color_badge_red"))
            .key("ArkUX_Stage_Badge_BorderColor_1000").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: 'bgr(138,43,226)' }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .backgroundColor($r("sys.color.ohos_id_color_badge_red"))
            .key("ArkUX_Stage_Badge_BorderColor_1100").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderColor: Color.White }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderColor_1200")
            .height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: 5 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0100").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: "5px" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0200").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderWidth: $r("app.string.badge_Size_test") }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0300").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: "" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0400").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0500").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: undefined }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0600").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderWidth: "7fp" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0700").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red,
                       borderWidth: undefined }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0800").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: "asdf%^7" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_0900").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red, borderWidth: "5lpx" }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_1000")
            .height(20)
            .width(7)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red , borderWidth: 0 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_1100").height(20)
            .margin({
              top: 10
            } as Margin)

            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red ,
                       borderWidth: 5 ,borderColor: "#FFFD0000", fontWeight: 600 }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_1200").height(20)
            .margin({
              top: 10
            } as Margin)
            Badge({
              count: 1,
              maxCount: 99,
              position: BadgePosition.RightTop,
              style: { color: Color.White, fontSize: 16, badgeSize: 20, badgeColor: Color.Red }
            } as BadgeParamWithNumber) {
              Button("test")
                .onClick((event: ClickEvent) => {
                })
                .width(200).height(50).backgroundColor(Color.White)
            }
            .key("ArkUX_Stage_Badge_BorderWidth_1300").height(20)
            .backgroundColor($r("sys.color.ohos_id_color_badge_red"))
            .margin({
              top: 10
            } as Margin)
      }
      .width('100%')
    }
    .height('100%')
  }
}
