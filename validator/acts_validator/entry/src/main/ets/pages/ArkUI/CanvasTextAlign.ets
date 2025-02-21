/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { CustomContainer } from '../common/CanvasCustomContainer1';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State name: string = 'CanvasTextAlign';
  @State StepTips: string = '操作步骤：点击不同的文本对齐方式控件' + '\n' + '预期结果：对齐方式会随点击变化';
  @State Vue: boolean = false;
  @State num1: number = 0;
  @State num2: number = 0;
  @State num3: number = 0;
  @State num4: number = 0;
  @State num5: number = 0;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            Toggle({ type: ToggleType.Button, isOn: false }) {
              Text('start')
                .fontSize(13)
            }.size({ width: '19%', height: '20%' })
            .onClick(() => {
              this.context.clearRect(0, 10, 500, 500);
              this.context.lineWidth = 2;
              this.context.moveTo(250, 10);
              this.context.lineTo(250, 310);
              this.context.stroke();
              this.context.textAlign = 'start';
              this.context.font = '40px sans-serif';
              this.context.fillText('textAlign=start', 250, 160);
              this.num1 = 1;
              if (this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1) {
                this.Vue = true;
              }
            })

            Toggle({ type: ToggleType.Button, isOn: false }) {
              Text('end')
                .fontSize(13)
            }.size({ width: '19%', height: '20%' })
            .onClick(() => {
              this.context.clearRect(0, 10, 500, 500);
              this.context.lineWidth = 2;
              this.context.moveTo(250, 10);
              this.context.lineTo(250, 310);
              this.context.stroke();
              this.context.textAlign = 'end';
              this.context.font = '40px sans-serif';
              this.context.fillText('textAlign=end', 250, 160);
              this.num2 = 1;
              if (this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1) {
                this.Vue = true;
              }
            })

            Toggle({ type: ToggleType.Button, isOn: false }) {
              Text('left')
                .fontSize(13)
            }.size({ width: '19%', height: '20%' })
            .onClick(() => {
              this.context.clearRect(0, 10, 500, 500);
              this.context.lineWidth = 2;
              this.context.moveTo(250, 10);
              this.context.lineTo(250, 310);
              this.context.stroke();
              this.context.textAlign = 'left';
              this.context.font = '40px sans-serif';
              this.context.fillText('textAlign=left', 250, 160);
              this.num3 = 1;
              if (this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1) {
                this.Vue = true;
              }
            })

            Toggle({ type: ToggleType.Button, isOn: false }) {
              Text('center')
                .fontSize(13)
            }.size({ width: '19%', height: '20%' })
            .onClick(() => {
              this.context.clearRect(0, 10, 500, 500);
              this.context.lineWidth = 2;
              this.context.moveTo(250, 10);
              this.context.lineTo(250, 310);
              this.context.stroke();
              this.context.textAlign = 'center';
              this.context.font = '40px sans-serif';
              this.context.fillText('textAlign=center', 250, 160);
              this.num4 = 1;
              if (this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1) {
                this.Vue = true;
              }
            })

            Toggle({ type: ToggleType.Button, isOn: false }) {
              Text('right')
                .fontSize(13)
            }.size({ width: '19%', height: '20%' })
            .onClick(() => {
              this.context.clearRect(0, 10, 500, 500);
              this.context.lineWidth = 2;
              this.context.moveTo(250, 10);
              this.context.lineTo(250, 310);
              this.context.stroke();
              this.context.textAlign = 'right';
              this.context.font = '40px sans-serif';
              this.context.fillText('textAlign=right', 250, 160);
              this.num5 = 1;
              if (this.num1 == 1 && this.num2 == 1 && this.num3 == 1 && this.num4 == 1 && this.num5 == 1) {
                this.Vue = true;
              }
            })
          }
          .width('90%')
          .height('30%')

          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Canvas(this.context)
              .width('100%')
              .height('100%')
              .backgroundColor('#ffffffff')
              .onReady(() => {
                this.context.lineWidth = 2;
                this.context.moveTo(250, 10);
                this.context.lineTo(250, 310);
                this.context.stroke();
              })
          }
          .width('100%')
          .height('70%')
        }
      }
      .scrollBarWidth('6vp')
      .scrollBarColor('#cccccc')
    }
    .width('100%')
    .height('80%')
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/ArkUI/ArkUI_index',
        StepTips: this.StepTips,
        content: this.specificNoParam,
        FillColor: $FillColor,
        name: $name,
        Vue: $Vue,
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
  }

  onBackPress() {
    router.replaceUrl({
      url: 'pages/ArkUI/ArkUI_index',
    })
  }
}