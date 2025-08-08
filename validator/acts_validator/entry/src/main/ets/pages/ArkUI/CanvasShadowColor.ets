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
import { CustomContainer } from '../common/CanvasCustomContainer2';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct SetCircle {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'CanvasShadowColor';
  @State StepTips: string = '操作步骤：点击不同的颜色控件' + '\n' + '预期结果：阴影会随点击变化';
  @State Vue: boolean = false;
  @State num1: number = 0;
  @State num2: number = 0;
  @State num3: number = 0;

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
              Text('Blue')
                .fontSize(10).fontColor(Color.Black)
            }.size({ width: '25%' })
            .onClick(() => {
              this.context.clearRect(0, 0, 400, 300);
              this.context.shadowBlur = 30;
              this.context.shadowColor = 'rgb(0,0,255)';
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(50, 50, 100, 50);
              this.num1 = 1;
              if (this.num1 == 1 && this.num3 == 1 && this.num2 == 1) {
                this.Vue = true;
              }
            })

            Toggle({ type: ToggleType.Button, isOn: false }) {
              Text('Yellow')
                .fontSize(10).fontColor(Color.Black)
            }.size({ width: '25%' })
            .onClick(() => {
              this.context.clearRect(0, 0, 400, 300);
              this.context.shadowBlur = 30;
              this.context.shadowColor = '#fffffc3c';
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(50, 50, 100, 50);
              this.num2 = 1;
              if (this.num1 == 1 && this.num3 == 1 && this.num2 == 1) {
                this.Vue = true;
              }
            })

            Toggle({ type: ToggleType.Button, isOn: false }) {
              Text('Green')
                .fontSize(10).fontColor(Color.Black)
            }.size({ width: '25%' })
            .onClick(() => {
              this.context.clearRect(0, 0, 400, 300);
              this.context.shadowBlur = 30;
              this.context.shadowColor = '#ff19fa00';
              this.context.fillStyle = 'rgb(255,0,0)';
              this.context.fillRect(50, 50, 100, 50);
              this.num3 = 1;
              if (this.num1 == 1 && this.num3 == 1 && this.num2 == 1) {
                this.Vue = true;
              }
            })
          }
          .width('70%')
          .height('30%')

          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Canvas(this.context)
              .width('100%')
              .height('100%')
              .backgroundColor('#ffffffff')
              .onReady(() => {
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(50, 50, 100, 50);
              })
          }
          .width('100%')
          .height('60%')
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
        X: $X,
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