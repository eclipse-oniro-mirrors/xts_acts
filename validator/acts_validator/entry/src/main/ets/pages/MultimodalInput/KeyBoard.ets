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

@Entry
@Component
struct KeyEvent {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'KeyBoard';
  @State StepTips: string = '操作步骤：请通过外接键盘或者软键盘，在输入框中输入上面的字母' + '\n' + '预期结果：在输入框中能输入pass则通过';
  @State Vue: boolean = false;
  @State text: string = '';

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  @Builder
  specificNoParam() {
    Column() {
      Scroll() {
        Column() {
          Column() {
            Text('请在下面通过外接/系统软键盘输入：pass')
              .fontSize(24)
            TextInput({ text: this.text, placeholder: '请输入' })
              .placeholderColor(Color.Grey)
              .placeholderFont({ size: 14, weight: 400 })
              .caretColor(Color.Blue)
              .width(400)
              .height(40)
              .margin(20)
              .fontSize(14)
              .fontColor(Color.Black)
              .inputFilter('[a-z]', (e) => {
                console.log(JSON.stringify(e));
              })
              .onChange((value: string) => {
                this.text = value
                if (this.text === 'pass') {
                  this.Vue = true
                } else {
                  this.Vue = false
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
    .height('80%')
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      CustomContainer({
        title: this.name,
        Url: 'pages/MultimodalInput/MultimodalInput_index',
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
      url: 'pages/MultimodalInput/MultimodalInput_index',
    })
  }
}
