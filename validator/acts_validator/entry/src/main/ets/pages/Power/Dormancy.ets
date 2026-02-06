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
import power from '@ohos.power';

@Entry
@Component
struct Dormancy {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'Dormancy';
  @State StepTips: string = '操作步骤：点击测试页面内熄屏按钮,观察设备是否熄屏' + '\n' + '预期结果：点击测试页面熄屏按钮，屏幕能正常熄屏，熄屏后唤醒设备，pass按钮亮起';
  @State Vue: boolean = false;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Row() {
            Button('熄屏')
              .fontSize(28)
              .onClick(() => {
                console.info('power onClick');
                try {
                  let isActive = power.isActive();
                  console.info('power is active: ' + isActive);
                  try {
                    power.suspend();
                    this.Vue = true
                  } catch (err) {
                    console.error('suspend failed, err: ' + err);
                  }
                } catch (err) {
                  console.error('check active status failed, err: ' + err);
                }
              })
          }
          .justifyContent(FlexAlign.Center)
          .width('100%')
          .height('100%')
        }
      }
      .scrollBarWidth('6vp')
      .scrollBarColor('#cccccc')
    }
    .width('100%')
    .height('65%')
    .backgroundColor(Color.Black)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/Power/Power_index',
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
      url: 'pages/Power/Power_index',
    })
  }
}