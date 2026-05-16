/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

@Entry
@Component
struct transform3DDemo {
  @State name: string = 'menuColorMode';
  @State stepTips: string = '操作步骤:\n' + '1.点击FOLLOW_SYSTEM和LIGHT按钮,点击下方Menu,观察弹出菜单颜色\n' +
    '2.点击FOLLOW_SYSTEM和DARK按钮,点击下方Menu,观察弹出菜单颜色\n' +
    '3.点击FOLLOW_TARGET和LIGHT按钮,点击下方Menu,观察弹出菜单颜色\n' +
    '4.点击FOLLOW_TARGET和DARK按钮,点击下方Menu,观察弹出菜单颜色\n' +
    '预期结果：\n' + '1.弹出菜单为浅色背景\n' + '2.弹出菜单为浅色背景\n' +
    '3.弹出菜单为浅色背景\n' + '4.弹出菜单为深色背景\n'

  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State colorMode: AnchoredColorMode | undefined | null = AnchoredColorMode.FOLLOW_SYSTEM
  @State themeColorMode: ThemeColorMode | undefined | null = ThemeColorMode.SYSTEM

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
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
      });
      promptAction.showToast({
        message: '失败', duration: 1000
      });
    })
  }

  aboutToAppear() {
    FirstDialog.ChooseDialog(this.stepTips, this.name);
  }

  onPageHide() {
    clearInterval(this.intervalNum);
  }

  aboutToDisappear() {
    clearInterval(this.intervalNum);
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
          });
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
        Scroll() {
          Column({ space: 5 }) {
            Text('\n\n控制bindMenu组件是否跟随局部深浅色')
            Row() {
              Text('colorMode：' + this.colorMode)
              Text('themeColorMode：' + this.themeColorMode)
            }
            Row(){
              Button('FOLLOW_SYSTEM').layoutWeight(1).onClick(()=>{
                this.colorMode = AnchoredColorMode.FOLLOW_SYSTEM
              }).layoutWeight(1)
              Button('FOLLOW_TARGET').layoutWeight(1).onClick(()=>{
                this.colorMode = AnchoredColorMode.FOLLOW_TARGET
              }).layoutWeight(1)
            }
            Row(){
              Button('LIGHT').layoutWeight(1).onClick(()=>{
                this.themeColorMode = ThemeColorMode.LIGHT
              }).layoutWeight(1)
              Button('DARK').layoutWeight(1).onClick(()=>{
                this.themeColorMode = ThemeColorMode.DARK
              }).layoutWeight(1)
            }
            WithTheme({ colorMode: this.themeColorMode}) {
              Button('Click Here to Show Menu')
                .bindMenu([
                  {
                    value: 'Menu1',
                    action: () => {
                      console.info('handle Menu1 select');
                    }
                  },
                  {
                    value: 'Menu2',
                    action: () => {
                      console.info('handle Menu2 select');
                    }
                  },
                ], {
                  colorMode: this.colorMode,
                })
            }
          }.width('100%')
        }
      }.height('80%')
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

    }.width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}