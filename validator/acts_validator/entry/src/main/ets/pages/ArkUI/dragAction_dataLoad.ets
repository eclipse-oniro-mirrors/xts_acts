/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { unifiedDataChannel, uniformTypeDescriptor } from '@kit.ArkData';
import { dragController } from '@kit.ArkUI';

const TAG = '[dragAction_dataLoad]';

@Entry
@Component
struct ImageExample {
  @State name: string = 'dragAction_dataLoad';
  @State stepTips: string = '操作步骤:\n' + '1.长按button浮起拖拽\n' + 
  '2.观察角标数量\n' +
  '预期结果：\n' + '1.图片可以正常浮起拖动\n' +
  '2.角标数与本接口内部传的recordCount参数相同，此用例设置的100，所以应显示100的角标\n'
  @State isOk: boolean = false;
  @State intervalNum: number = 0;
  @State uri: string = '';
  @State blockArr: string[] = [];
  uiContext = this.getUIContext();
  udKey: string = '';
  @Builder DraggingBuilder() {
    Column() {
      Text('DraggingBuilder')
        .fontColor(Color.White)
        .fontSize(12)
    }
    .width(100)
    .height(100)
    .backgroundColor(Color.Blue)
  }

  @Builder
  PassBtn(text: Resource, isFullScreen: boolean) {
    Button({ stateEffect: this.isOk }) {
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
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceAround }) {
        Button('touch to execute drag')
          .margin(10)
          .onTouch((event?:TouchEvent) => {
            if(event){
              if (event.type == TouchType.Down) {
                let text = new unifiedDataChannel.PlainText()
                text.textContent = 'drag text'
                text.abstract = 'abstract'
                let unifiedData = new unifiedDataChannel.UnifiedData(text)

                let loadHandler: unifiedDataChannel.DataLoadHandler = () => {
                  return unifiedData;
                }

                let dragInfo: dragController.DragInfo = {
                  pointerId: 0,
                  data: unifiedData,
                  extraParams: '',

                  dataLoadParams:{
                    loadHandler: loadHandler,
                    dataLoadInfo: { types: new Set(['test']), recordCount: 100 }
                  }
                }
                class Tmp{
                  private event:DragEvent|undefined = undefined
                  private extraParams:string = ''
                }
                let eve:Tmp = new Tmp()
                this.getUIContext().getDragController().executeDrag(()=>{this.DraggingBuilder()},
                                                                    dragInfo, (err, eve) => {
                  if(eve.event){
                    if (eve.event.getResult() == DragResult.DRAG_SUCCESSFUL) {
                    } else if (eve.event.getResult() == DragResult.DRAG_FAILED) {
                    }
                  }
                })
              }
            }
          })
      }
      .margin({ bottom: 20 })
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