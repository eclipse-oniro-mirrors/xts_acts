/**
 Copyright (c) 2026 Huawei Device Co., Ltd.
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 http://www.apache.org/licenses/LICENSE-2.0
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import nativeDragDrop from 'libnativeDragDrop.so';
import FirstDialog from '../model/FirstDialog';

const TAG = '[CapiDragDrop]';
let params = LocalStorage.getShared();

@Entry(params)
@Component
struct CapiDragDrop {
  @Builder
  DraggingBuilder() {
    Column() {
      Text('hello')
    }
  }

  @State value: number = 40
  @State width1: string = '100%'
  @State fillColor: string = '#FF000000';
  @State name: string = 'CapiDragDrop';
  @State stepTips: string = '拖拽操作不支持手表设备:\n' +'操作步骤:\n' + '1.长按文字从左侧拖拽到右侧落入区域\n' +
  '2.观察动效\n' +'3.点击复位按钮,点击动效关闭按钮\n' +'4.重新将左侧文字拖拽到右侧落入区域\n' +'5.观察动效\n' +
  '预期结果：\n' + '1.动效开启时动效为收缩淡出动效\n' +
  '2.动效关闭时无动效\n'
  @State capiDragDropVue: boolean = false;
  @State active: boolean = false;
  @State intervalNum: number = 0;
  @State yesEnable: boolean = false
  @State color: Color = Color.Blue;
  @State text1: string = ''
  @State text2: string = ''
  @State text: string = ''

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.capiDragDropVue }) {
      Image($r('app.media.ic_public_pass'))
        .width('20vp')
        .height('20vp')
    }
    .margin({ bottom: '20vp' })
    .width('30%')
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
    .margin({ bottom: '20vp' })
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
      if (this.text1 === '0' && this.text2 === '0') {
        this.capiDragDropVue = true;
      }
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

      Column({ space: 12 }) {
        // 业务代码
        Column() {
          XComponent({
            id: 'draganddrop',
            type: 'node',
            libraryname: 'nativeDragDrop'
          })
            .onAppear(() => {
              nativeDragDrop.nativeDragDrop('draganddrop', this.getUIContext());
              this.text1 = '0';
              this.text2 = '0';
            })
            .width(`${this.width1}`)
            .height(700)
            .backgroundColor('#FFFAFA')
        }
      }.height('80%')
      .width('100%')
      .backgroundColor('#FFFAFA')



      Row() {
        this.PassBtn($r('app.string.btn_fullscreen'), true);
        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .margin({ bottom: '20vp' })
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