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
import RangeFunc, { RectValue,CustomContainerClick } from '../common/CustomContainerClick';
import FirstDialog from '../model/FirstDialog';
import { MouseEvent } from '@ohos.multimodalInput.mouseEvent';
import inputMonitor from '@ohos.multimodalInput.inputMonitor';
import promptAction from '@ohos.promptAction';

let callback : (mouseEvent: MouseEvent) => void

@Entry
@Component
struct InputMonitor {
  @State FillColor: string = '#FF000000';
  @State X: number = 0;
  @State name: string = 'InputMonitor';
  @State StepTips: string = '操作步骤：请外接鼠标并按顺序点击四个按钮' + '\n' + '预期结果：使用鼠标按顺序点击4个按钮，且按钮都变成绿色，则通过';
  @State Vue: boolean = false;
  @State text: string = '';
  @State btnOne: boolean = false;
  @State btnTwo: boolean = false;
  @State btnThree: boolean = false;
  @State btnFour: boolean = false;
  @State intervalNum: number = 0;

  async aboutToAppear() {
    await FirstDialog.ChooseDialog(this.StepTips, this.name);
  }

  onPageShow() {
    callback = (mouseEvent: MouseEvent) => {
      let btn1: RectValue = RangeFunc.getComponentRect('btn1')
      let btn2: RectValue = RangeFunc.getComponentRect('btn2')
      let btn3: RectValue = RangeFunc.getComponentRect('btn3')
      let btn4: RectValue = RangeFunc.getComponentRect('btn4')
      console.log(`Monitor on success onPageShow x 138 290  y 215 475  x 430 575 y 215 475`);
      console.log(`Monitor on success onPageShow x 138 290  y 770 922  x 430 575 y 770 922`);
      console.log(`Monitor on success onPageShow ${JSON.stringify(mouseEvent.screenX)}`);
      console.log(`Monitor on success onPageShow ${JSON.stringify(mouseEvent.screenY)}`);
      if (mouseEvent.action === 2) {
        if ((btn1.left < mouseEvent.screenX && mouseEvent.screenX < btn1.right) && (btn1.top < mouseEvent.screenY && mouseEvent.screenY < btn1.bottom + 100)) {
          if (!(this.btnFour && this.btnThree && this.btnTwo && this.btnOne)) {
            this.btnOne = true
            promptAction.showToast({
              message: '识别成功 1',
              duration: 1000
            });
          }
        }
        else if ((btn2.left < mouseEvent.screenX && mouseEvent.screenX < btn2.right) && (btn2.top < mouseEvent.screenY && mouseEvent.screenY < btn2.bottom + 100)) {
          if (this.btnOne) {
            this.btnTwo = true
            promptAction.showToast({
              message: '识别成功 2',
              duration: 1000
            });
          }
        }
        else if ((btn3.left < mouseEvent.screenX && mouseEvent.screenX < btn3.right) && (btn3.top < mouseEvent.screenY && mouseEvent.screenY < btn3.bottom + 100)) {
          if (this.btnOne && this.btnTwo) {
            this.btnThree = true
            promptAction.showToast({
              message: '识别成功 3',
              duration: 1000
            });
          }
        }
        else if ((btn4.left < mouseEvent.screenX && mouseEvent.screenX < btn4.right) && (btn4.top < mouseEvent.screenY && mouseEvent.screenY < btn4.bottom + 100)) {
          if (this.btnOne && this.btnTwo && this.btnThree) {
            this.btnFour = true
            promptAction.showToast({
              message: '识别成功 4',
              duration: 1000
            });
          }
        }
        console.log(`Monitor on success this.btnTwo ${JSON.stringify(this.btnTwo)}`);
      }
      this.intervalNum = setInterval(() => {
        console.log(`Monitor on success setInterval btnOne ${JSON.stringify(this.btnOne)}`);
        console.log(`Monitor on success setInterval btnTwo ${JSON.stringify(this.btnTwo)}`);
        console.log(`Monitor on success setInterval btnThree ${JSON.stringify(this.btnThree)}`);
        console.log(`Monitor on success setInterval btnFour ${JSON.stringify(this.btnFour)}`);
        if (this.btnFour && this.btnThree && this.btnTwo && this.btnOne) {
          this.Vue = true
        }
      }, 500)
    }
    inputMonitor.on('mouse', callback);
  }

  onPageHide() {
    console.log(`Monitor off onPageHide`);
    clearInterval(this.intervalNum)
    // 取消监听单个回调函数
    try {
      inputMonitor.off('mouse', callback);
      console.log(`Monitor off success`);
    } catch (error) {
      console.log(`Monitor execute failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
    }
  }

  aboutToDisappear() {
    console.log(`Monitor off aboutToDisappear`);
    clearInterval(this.intervalNum)
    // 取消监听单个回调函数
    try {
      inputMonitor.off('mouse', callback);
      console.log(`Monitor off success`);
    } catch (error) {
      console.log(`Monitor execute failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
    }
  }

  build() {
    Column() {
      CustomContainerClick({
        title: this.name,
        Url: 'pages/MultimodalInput/MultimodalInput_index',
        StepTips: this.StepTips,
        FillColor: $FillColor,
        X: $X,
        name: $name,
        Vue: $Vue,
        btnOne: $btnOne,
        btnTwo: $btnTwo,
        btnThree: $btnThree,
        btnFour: $btnFour,
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