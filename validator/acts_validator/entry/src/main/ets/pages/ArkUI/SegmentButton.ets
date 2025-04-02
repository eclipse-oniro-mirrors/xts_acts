/*
* Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
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

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import Logger from '../model/Logger';
import fs from '@ohos.file.fs';
import FirstDialog from '../model/FirstDialog';
import { BusinessError } from '@ohos.base';
import {
  ItemRestriction,
  SegmentButton,
  SegmentButtonItemTuple,
  SegmentButtonOptions,
  SegmentButtonTextItem,
  SegmentButtonItemOptions
} from '@kit.ArkUI';

const TAG = '[SegmentButtonTest]';

@Entry
@Component
struct SegmentButtonTest {
  @State name: string = 'SegmentButton';
  @State stepTips: string = '操作步骤：1、在系统设置中打开屏幕朗读功能\n' +
    '2、进入页面后分别点击两组分段按钮的选中项和未选中项，确认朗读内容，' + '\n' +
    '点击Button替换第二组分段按钮内容后，再次点击被替换按钮，确认朗读内容' + '\n' +
    '预期结果：朗读内容和对应点击的按钮一致则通过';
  @State isVue: boolean = false;
  @State intervalNum: number = 0;
  @State iconCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标1',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标1',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconItem'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标2',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标2',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconItem'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标3',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标3',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconItem'
      },
      {
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标4',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标4',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconItem'
      }
    ] as SegmentButtonItemTuple,
    multiply: false,
    backgroundBlurStyle: BlurStyle.BACKGROUND_THICK
  })
  @State iconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      {
        text: '图标1',
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标1',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标1',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconTextItem'
      },
      {
        text: '图标2',
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标2',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标2',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconTextItem'
      },
      {
        text: '图标3',
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标3',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标3',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconTextItem'
      },
      {
        text: '图标4',
        icon: $r('sys.media.ohos_ic_public_email'),
        iconAccessibilityText: '未选中图标4',
        selectedIcon: $r('sys.media.ohos_ic_public_clock'),
        selectedIconAccessibilityText: '选中图标4',
        accessibilityLevel: 'yes',
        accessibilityDescription: 'SegmentButtonIconTextItem'
      }
    ] as SegmentButtonItemTuple,
    multiply: true
  })
  @State singleSelectIconCapsuleSelectedIndexes: number[] = [3]
  @State multiplySelectIconTextCapsuleSelectedIndexes: number[] = [1, 2]

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    if (this.isVue == false) {
      Button({ stateEffect: this.isVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }
      .width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .opacity(0.4)
      .onClick(() => {

      })
    } else {
      Button({ stateEffect: this.isVue }) {
        Image($r('app.media.ic_public_pass'))
          .width('20vp')
          .height('20vp')
      }.width('30%')
      .height('30vp')
      .backgroundColor(Color.Grey)
      .onClick(() => {
        router.back({
          url: 'pages/ArkUI/ArkUI_index',
          params: {
            result: 'true ', title: this.name,
          }
        })
        promptAction.showToast({
          message: '通过', duration: 1000
        });
      })
    }
  }

  @Builder
  FailBtn(text: Resource, isFullScreen: boolean) {
    Button() {
      Image($r('app.media.ic_public_fail'))
        .width('20vp')
        .height('20vp')
    }
    .width('30%')
    .height('30vp')
    .backgroundColor(Color.Grey)
    .onClick(() => {
      router.back({
        url: 'pages/ArkUI/ArkUI_index',
        params: {
          result: 'false', title: this.name,
        }
      })
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageShow() {
    this.intervalNum = setInterval(() => {
      this.isVue = true;
    }, 500)
  }

  onPageHide() {
    clearInterval(this.intervalNum)
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum)
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' })
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => {
          router.back({
            url: 'pages/ArkUI/ArkUI_index',
            params: { result: 'None' }
          })
        })

        Text(this.name)
          .fontColor(Color.White)
          .fontSize('18fp')
          .margin({ left: '-20vp' })
        Text('hello')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden)
      }
      .backgroundColor(Color.Black)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {
        Column({ space: 25 }) {
          Column() {
            Text('朗读内容包含:').margin({ left: 12, right: 12 })
            Text('选中按钮朗读内容:未选中 + 未选中图标1/2/3/4 + (按钮文本)+按钮+SegmentButtonIconItem/SegmentButtonIconTextItem/SegmentButtonItemOptions/SegmentButtonIconTextItem2')
              .margin({ left: 12, right: 12 })
            Text('选中按钮朗读内容:已选中 + 选中图标1/2/3/4 + (按钮文本)+按钮+SegmentButtonIconItem/SegmentButtonIconTextItem/SegmentButtonItemOptions/SegmentButtonIconTextItem2')
              .margin({ left: 12, right: 12 })
          }

          SegmentButton({
            options: this.iconCapsuleOptions,
            selectedIndexes: $singleSelectIconCapsuleSelectedIndexes
          })

          SegmentButton({
            options: this.iconTextCapsuleOptions,
            selectedIndexes: $multiplySelectIconTextCapsuleSelectedIndexes
          })
          Button('将按钮2、3替换为splice1、splice2')
            .onClick(() => {
              this.iconTextCapsuleOptions.buttons.splice(1, 2, new SegmentButtonItemOptions({
                text: 'splice1', accessibilityLevel: 'yes', accessibilityDescription: 'SegmentButtonItemOptions '
              }), new SegmentButtonItemOptions({
                text: 'splice2',
                icon: $r('sys.media.ohos_ic_public_email'),
                iconAccessibilityText: '未选中splice2',
                selectedIcon: $r('sys.media.ohos_ic_public_clock'),
                selectedIconAccessibilityText: '选中splice2',
                accessibilityLevel: 'yes',
                accessibilityDescription: 'SegmentButtonIconTextItem2'
              }))
            })
        }.width('90%')
      }
      .height('80%')
      .width('100%')
      .backgroundColor(Color.White)

      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show(
            {
              title: '操作提示',
              message: this.stepTips,
              confirm: {
                value: 'OK',
                action: () => {
                }
              }
            }
          )
        })

        this.FailBtn($r('app.string.btn_fullscreen'), true);
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}
