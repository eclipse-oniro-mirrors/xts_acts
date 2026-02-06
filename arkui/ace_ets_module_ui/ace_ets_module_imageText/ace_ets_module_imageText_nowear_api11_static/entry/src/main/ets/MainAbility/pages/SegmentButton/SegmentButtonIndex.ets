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
  ColumnOptions,
  CopyOptions,
  Text,
  Row,
  Button,
  TextSelectableMode,Color,FontWeight,$r,Margin,Padding
} from '@ohos.arkui.component'
import {
  State,
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import { ClickEvent, Position } from '@ohos.arkui.component';
import  AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '../../../../../hypium/hypium';
import hilog from '@ohos.hilog';
import testsuite from '../../../../src/test/List.test'
import { SegmentButton, SegmentButtonOptions, SegmentButtonItemOptions,SegmentButtonIconTextItem,SegmentButtonIconItem,SegmentButtonTextItem} from '@ohos.arkui.advanced.SegmentButton';

@Entry
@Component
struct Index {
  @State singleTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '单选文字1' } as SegmentButtonTextItem,
      { text: '单选文字2' } as SegmentButtonTextItem,
      { text: '单选文字3' } as SegmentButtonTextItem,
      { text: '单选文字4' } as SegmentButtonTextItem,
      { text: '单选文字5' } as SegmentButtonTextItem
    ],
    fontColor: Color.White,
    selectedFontColor: Color.White,
    fontSize: '8vp',
    selectedFontSize: '8vp',
    fontWeight: FontWeight.Normal,
    selectedFontWeight: FontWeight.Bolder,
    backgroundColor: Color.Grey,
    selectedBackgroundColor: Color.Blue,
    textPadding: {top:'2vp',right:'2vp',bottom:'2vp',left:'2vp'} as Padding,
  })
  @State singleIconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '单选图标文字1', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconTextItem,
      { text: '单选图标文字2', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconTextItem,
      { text: '单选图标文字3', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconTextItem
    ],
    imageSize: { width: '10vp', height: '10vp' },
    selectedFontSize: '8vp',
    fontSize: '8vp',
    multiply: false
  })
  @State multipleTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '多选文字1' } as SegmentButtonTextItem,
      { text: '多选文字2' } as SegmentButtonTextItem,
      { text: '多选文字3' } as SegmentButtonTextItem,
      { text: '多选文字4' } as SegmentButtonTextItem
    ],
    fontSize: '8vp',
    multiply: true
  })
  @State multipleIconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '多选图标文字1', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconTextItem,
      { text: '多选图标文字2', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconTextItem,
      { text: '多选图标文字3', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconTextItem,
      { text: '多选图标文字4', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconTextItem,
      { text: '多选图标文字5', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconTextItem
    ],
    imageSize: { width: '10vp', height: '10vp' },
    fontSize: '8vp',
    selectedFontSize: '8vp',
    multiply: true
  })
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '页签1' } as SegmentButtonTextItem,
      { text: '页签2' } as SegmentButtonTextItem,
      { text: '页签3' } as SegmentButtonTextItem
    ]
  })
  @State singleIconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconItem,
      { icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconItem,
      { icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') } as SegmentButtonIconItem
    ],
    multiply: false,
    imageSize: { width: '10vp', height: '10vp' },
    fontSize: '8vp',
    buttonPadding: {top:'2vp',right:'2vp',bottom:'2vp',left:'2vp'} as Padding
  })
  @State selectedIndexes1: Array<int> = [0];
  @State selectedIndexes2: Array<int> = [0];
  @State selectedIndexes3: Array<int> = [0];
  @State selectedIndexes4: Array<int> = [0];
  @State selectedIndexes5: Array<int> = [0];
  @State selectedIndexes6: Array<int> = [0];

  build() {
    Row() {
      Column({ space: 10 } as ColumnOptions) {
        SegmentButton({ options: this.singleTextCapsuleOptions, selectedIndexes: this.selectedIndexes1 }).height('8%')
        SegmentButton({ options: this.singleIconTextCapsuleOptions, selectedIndexes: this.selectedIndexes2 }).height('8%')
        SegmentButton({ options: this.multipleTextCapsuleOptions, selectedIndexes: this.selectedIndexes3 }).height('8%')
        SegmentButton({ options: this.multipleIconTextCapsuleOptions, selectedIndexes: this.selectedIndexes4 }).height('8%')
        SegmentButton({ options: this.tabOptions, selectedIndexes: this.selectedIndexes5 }).height('8%')
        SegmentButton({ options: this.singleIconCapsuleOptions, selectedIndexes: this.selectedIndexes6 }).height('8%')
        Button('pop item').onClick((e:ClickEvent) => {
          this.singleTextCapsuleOptions.buttons.pop()
        }).height('5%')
        Button('shift item').onClick((e:ClickEvent) => {
          this.singleTextCapsuleOptions.buttons.shift()
        }).height('5%')
        Button('push item').onClick((e:ClickEvent) => {
          this.singleTextCapsuleOptions.buttons.push({ text: 'push button' })
        }).height('5%')
        Button('unshift item').onClick((e:ClickEvent) => {
          this.multipleTextCapsuleOptions.buttons.unshift({ text: 'unshift button' })
        }).height('5%')
        Button('splice item').onClick((e:ClickEvent) => {
          this.tabOptions.buttons.splice(0, 1, new SegmentButtonItemOptions({ text: 'splice button' }))
        }).height('5%')
        .onAppear(() => {
        })
      }
      .width('90%')
      .height('100%')
    }
    .height('80%')
    .margin({top: '10%', bottom: '10%'} as Margin)
    .position({ x: 10 } as Position)
  }
}