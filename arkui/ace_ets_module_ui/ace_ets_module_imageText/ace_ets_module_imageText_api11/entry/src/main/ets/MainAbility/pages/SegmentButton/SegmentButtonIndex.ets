/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import hilog from '@ohos.hilog';
// import testsuite from '../../test/List.test'
import { SegmentButton, SegmentButtonOptions, SegmentButtonItemOptions} from '@ohos.arkui.advanced.SegmentButton'

@Entry
@Component
struct Index {
  @State singleTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '单选文字1' }, { text: '单选文字2' }, { text: '单选文字3' }, { text: '单选文字4' }, {
      text: '单选文字5'
    }],
    fontColor: Color.White,
    selectedFontColor: Color.White,
    fontSize: '20vp',
    selectedFontSize: '20vp',
    fontWeight: FontWeight.Normal,
    selectedFontWeight: FontWeight.Bolder,
    backgroundColor: Color.Grey,
    selectedBackgroundColor: Color.Blue,
    textPadding: '2vp',
  })
  @State singleIconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '单选图标文字1', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') },
      { text: '单选图标文字2', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') },
      { text: '单选图标文字3', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') }
    ],
    multiply: false
  })
  @State multipleTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '多选文字1' }, { text: '多选文字2' }, { text: '多选文字3' }, { text: '多选文字4' }],
    multiply: true
  })
  @State multipleIconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '多选图标文字1', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') },
      { text: '多选图标文字2', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') },
      { text: '多选图标文字3', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') },
      { text: '多选图标文字4', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') },
      { text: '多选图标文字5', icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') }
    ],
    multiply: true
  })
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [{ text: '页签1' }, { text: '页签2' }, { text: '页签3' }]
  })
  @State singleIconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') },
      { icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') },
      { icon: $r('app.media.app_icon'), selectedIcon: $r('sys.media.ohos_app_icon') }
    ],
    multiply: false,
    imageSize: { width: '40vp', height: '40vp' },
    buttonPadding: '2vp'
  })
  @State selectedIndexes1: number[] = [0]
  @State selectedIndexes2: number[] = [0]
  @State selectedIndexes3: number[] = [0]
  @State selectedIndexes4: number[] = [0]
  @State selectedIndexes5: number[] = [0]
  @State selectedIndexes6: number[] = [0]

  build() {
    Row() {
      Column({ space: 20 }) {
        SegmentButton({ options: this.singleTextCapsuleOptions, selectedIndexes: $selectedIndexes1 })
        SegmentButton({ options: this.singleIconTextCapsuleOptions, selectedIndexes: $selectedIndexes2 })
        SegmentButton({ options: this.multipleTextCapsuleOptions, selectedIndexes: $selectedIndexes3 })
        SegmentButton({ options: this.multipleIconTextCapsuleOptions, selectedIndexes: $selectedIndexes4 })
        SegmentButton({ options: this.tabOptions, selectedIndexes: $selectedIndexes5 })
        SegmentButton({ options: this.singleIconCapsuleOptions, selectedIndexes: $selectedIndexes6 })
        Button('pop item').onClick(() => {
          this.singleTextCapsuleOptions.buttons.pop()
        })
        Button('shift item').onClick(() => {
          this.singleTextCapsuleOptions.buttons.shift()
        })
        Button('push item').onClick(() => {
          this.singleTextCapsuleOptions.buttons.push({ text: 'push button' })
        })
        Button('unshift item').onClick(() => {
          this.multipleTextCapsuleOptions.buttons.unshift({ text: 'unshift button' })
        })
        Button('splice item').onClick(() => {
          this.tabOptions.buttons.splice(0, 1, new SegmentButtonItemOptions({ text: 'splice button' }))
        })
        .onAppear(() => {
          let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
          let abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
          hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.INFO);
          hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
          // Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        })
      }
      .width('90%')
    }
    .height('100%')
    .position({ x: 10 })

  }
}