/**
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

import router from '@ohos.router';
import { CustomContainer } from '../common/CanvasCustomContainer1';
import FirstDialog from '../model/FirstDialog';

@Entry
@Component
struct HoverMove {
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  @State FillColor: string = '#FF000000';
  @State name: string = 'HoverMove';
  @State StepTips: string = '操作步骤：1、连接手写笔，悬停，上下左右移动\n' +
    '预期结果1: XY 查看参数值变化，是否是手写笔位置相对于当前组件左上角的xy轴坐标。\n' +
    '预期结果2: windowX、windowY 查看参数值变化，是否是手写笔位置相对于应用窗口左上角的xy轴坐标。\n' +
    '预期结果3: displayX、displayY 查看参数值变化，是否是手写笔位置相对于应用屏幕左上角的xy轴坐标。\n';
  @State Vue: boolean = false;
  @State hoverValue: string = '';

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Button('HoverMove')
        .defaultFocus(true)
        .onHoverMove((event: HoverEvent) => {
            this.hoverValue = 'onHoverMove:\n' +
            'XY = (' + event.x + ',' + event.y + ')\n' +
            'windowXY = (' + event.windowX + ',' + event.windowY + ')\n' +
            'displayXY = (' + event.displayX + ',' + event.displayY + ')';
        })

      Text(this.hoverValue)
        .width('100%')
        .height(200)
        .backgroundColor(Color.Blue)
        .onClick((event)=>{
          this.Vue = true;
        })
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