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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct badgeStyle {
  @State context: string = '99999'
  @State outBorderColor: ResourceColor | undefined | null = undefined
  @State outBorderWidth: LengthMetrics | undefined | null = undefined
  @State enableAutoAvoidance: boolean | undefined | null = false

  build() {
    Scroll(){
      Column() {
        Badge({
          value: this.context,
          style: {
            badgeSize: 30,
            fontSize: 15,
            outerBorderColor: this.outBorderColor,
            outerBorderWidth: this.outBorderWidth,
            enableAutoAvoidance: this.enableAutoAvoidance
          }
        }) {
          Image($r('app.media.icon'))
            .width(50)
            .height(50)
        }.id('badgeStyle')
        Text('设置角标文本延伸显示是否避让').height('5%')
        Row({ space: 10 }){
          Button('true').onClick(() => {
            this.enableAutoAvoidance = true;
          }).layoutWeight(1).id('Badge1Style')
          Button('false').onClick(() => {
            this.enableAutoAvoidance = false;
          }).layoutWeight(1).id('Badge2Style')
          Button('undefined').onClick(() => {
            this.enableAutoAvoidance = undefined;
          }).layoutWeight(1).id('Badge3Style')
          Button('null').onClick(() => {
            this.enableAutoAvoidance = null;
          }).layoutWeight(1).id('Badge4Style')
        }.height('5%')

        Text('设置角标文本外描边颜色').height('5%')
        Row({ space: 10 }){
          Button('Color.Black').onClick(() => {
            this.outBorderColor = Color.Black;
          }).layoutWeight(1).id('Badge5Style')
          Button('0x4DFFFFFF').onClick(() => {
            this.outBorderColor = 0x4DFFFFFF;
          }).layoutWeight(1).id('Badge6Style')
          Button('#FF11A5E0').onClick(() => {
            this.outBorderColor = '#FF11A5E0';
          }).layoutWeight(1).id('Badge7Style')
          Button('资源').onClick(() => {
            this.outBorderColor = $r('app.color.RED');
          }).layoutWeight(1).id('Badge8Style')
        }.height('5%')
        Row({ space: 10 }){
          Button('空字符串').onClick(() => {
            this.outBorderColor = '';
          }).layoutWeight(1).id('Badge9Style')
          Button('异常字符串').onClick(() => {
            this.outBorderColor = '00000000';
          }).layoutWeight(1).id('Badge10Style')
          Button('undefined').onClick(() => {
            this.outBorderColor = undefined;
          }).layoutWeight(1).id('Badge11Style')
          Button('null').onClick(() => {
            this.outBorderColor = null;
          }).layoutWeight(1).id('Badge12Style')
        }.height('5%')

        Text('设置角标文本外描边宽度').height('5%')
        Row({ space: 10 }){
          Button('0').onClick(() => {
            this.outBorderWidth = LengthMetrics.vp(0);
          }).layoutWeight(1).id('Badge13Style')
          Button('资源').onClick(() => {
            this.outBorderWidth = LengthMetrics.resource($r('app.float.borderWidth'));
          }).layoutWeight(1).id('Badge14Style')
          Button('10fp').onClick(() => {
            this.outBorderWidth = LengthMetrics.fp(10);
          }).layoutWeight(1).id('Badge15Style')
          Button('2.5vp').onClick(() => {
            this.outBorderWidth = LengthMetrics.vp(2.5);
          }).layoutWeight(1).id('Badge16Style')
          Button('20px').onClick(() => {
            this.outBorderWidth = LengthMetrics.px(20);
          }).layoutWeight(1).id('Badge17Style')
        }.height('5%')
        Row({ space: 10 }){
          Button('-2vp').onClick(() => {
            this.outBorderWidth = LengthMetrics.vp(-2);
          }).layoutWeight(1).id('Badge18Style')
          Button('80%').onClick(() => {
            this.outBorderWidth = LengthMetrics.percent(0.8);
          }).layoutWeight(1).id('Badge19Style')
          Button('undefined').onClick(() => {
            this.outBorderWidth = undefined;
          }).layoutWeight(1).id('Badge20Style')
          Button('null').onClick(() => {
            this.outBorderWidth = null;
          }).layoutWeight(1).id('Badge21Style')
        }.height('5%')

      }
    }.height('100%')
  }
}