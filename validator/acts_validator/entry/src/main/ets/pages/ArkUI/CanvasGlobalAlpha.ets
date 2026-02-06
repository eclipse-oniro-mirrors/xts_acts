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
  @State X: number = 5;
  @State name: string = 'CanvasGlobalAlpha';
  @State StepTips: string = '操作步骤：拖动滑块向右移动' + '\n' + '预期结果：透明度随着拖拽距离而改变，并显示透明度';
  @State Vue: boolean = false;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            Row() {
              Slider({
                value: this.X,
                min: 0,
                max: 100,
                style: SliderStyle.OutSet,
              })
                .trackColor('#4DCB26')
                .selectedColor('#00A7FA')
                .trackThickness('8vp')
                .blockBorderColor('#07B9A2')
                .blockBorderWidth('1vp')
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.X = value;
                  this.context.clearRect(100, 100, 250, 200);
                  this.context.globalAlpha = (this.X) * 0.01;
                  this.context.fillStyle = 'rgb(255,0,0)';
                  this.context.fillRect(150, 150, 50, 50);
                  this.context.globalAlpha = (this.X) * 0.01;
                  this.context.fillStyle = 'rgb(0,0,255)';
                  this.context.fillRect(200, 200, 50, 50);
                  if (value >= 100) {
                    this.Vue = true;
                  }
                })
            }
          }.width('70%').height('25%')

          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Text('透明度: ' + (this.X) * 0.01)
          }
          .width('100%')
          .height('20%')

          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Canvas(this.context)
              .width('100%')
              .height('100%')
              .backgroundColor('#ffffffff')
              .onReady(() => {
                this.context.globalAlpha = 0.05;
                this.context.fillStyle = 'rgb(255,0,0)';
                this.context.fillRect(150, 150, 50, 50);
                this.context.globalAlpha = 0.05;
                this.context.fillStyle = 'rgb(0,0,255)';
                this.context.fillRect(200, 200, 50, 50);
              })
          }
          .width('100%')
          .height('55%')
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
      }).margin({ bottom: '20vp' })
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