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
import { CustomContainer } from '../common/CanvasCustomContainer2';
import FirstDialog from '../model/FirstDialog';
import brightness from '@ohos.brightness';

@Entry
@Component
struct Brightness {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'Brightness';
  @State StepTips: string = '操作步骤：拖动滑块向右移动' + '\n' + '预期结果：亮度值随着拖拽距离而改变，并显示亮度值';
  @State Vue: boolean = false;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
            Row() {
              Slider({
                value: this.X,
                min: 0,
                max: 255,
                style: SliderStyle.OutSet,
              })
                .trackColor('#4DCB26')
                .selectedColor('#00A7FA')
                .trackThickness('8vp')
                .blockBorderColor('#07B9A2')
                .blockBorderWidth('1vp')
                .onChange((value: number, mode: SliderChangeMode) => {
                  this.X = value
                  console.info('set brightness value ' + value);
                  try {
                    brightness.setValue(value);
                  } catch (err) {
                    console.error('set brightness failed, err: ' + err);
                  }
                  if (value > 50) {
                    this.Vue = true
                  }
                })
            }
          }
          .width('70%')
          .height('70%')

          Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
            Text('亮度值: ' + this.X)
          }
          .width('100%')
          .height('30%')
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
        Url: 'pages/Screen/Screen_index',
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
      url: 'pages/Screen/Screen_index',
    })
  }
}