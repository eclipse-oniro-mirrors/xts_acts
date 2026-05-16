/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { ProgressButton } from '@ohos.arkui.advanced.ProgressButton';

@Entry
@Component
struct progressButtonTest {
  @State halfProgress: number = 0
  @State smallProgress: number = 0
  @State bigProgress: number = 0
  @State textState1: string = ''
  @State isRunning1: boolean = false
  @State enableState1: boolean = true
  @State progressState: Visibility = Visibility.None
  @State buttonState: Visibility = Visibility.Visible
  @State buttonText: string = '下载'
  @State buttonEnable: boolean = true
  @State isEnd: boolean = false
  build() {
    Column({space: 20}) {
      Text('下载按钮')
      Button(this.buttonText)
        .fontSize($r('sys.float.ohos_id_text_size_button3'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('sys.color.ohos_id_color_emphasize'))
        .padding({left: 8, right: 8})
        .opacity(this.buttonEnable? 1: 0.4)
        .enabled(this.buttonEnable)
        .height(28)
        .borderRadius(14)
        .width(60)
        .backgroundColor($r('sys.color.ohos_id_color_button_normal'))
        .onClick(() => {
          if(!this.isEnd) {
            this.buttonText = '等待中'
            let timer1 = setInterval(() => {
              this.progressState = Visibility.Visible
              this.buttonState = Visibility.None
              clearInterval(timer1)
              this.isRunning1 = true
              let timer = setInterval(() => {
                if (this.isRunning1) {
                  if (this.halfProgress === 100) {
                    this.isEnd = true
                  } else {
                    this.halfProgress++
                    if (this.halfProgress === 100) {
                      this.textState1 = '安装中'
                      this.enableState1 = false
                      this.buttonState = Visibility.Visible
                      this.progressState = Visibility.None
                      this.buttonEnable = false
                      this.buttonText = '安装中'
                      let timer2 = setInterval(() => {
                        this.buttonText = '打开'
                        this.buttonEnable = true
                        this.isEnd = true
                        clearInterval(timer2)
                      }, 2000)
                    }
                    console.info('x progress++ = ' + this.halfProgress)
                  }
                } else {
                  console.info('x isRunning = ' + false)
                  clearInterval(timer)
                }
              }, 100)
            }, 2000)
          }
        }).visibility(this.buttonState)
      ProgressButton({
        progress: this.halfProgress,
        progressButtonWidth: '60',
        content: this.textState1,
        enable: this.enableState1,

        clickCallback: () => {
          if (this.isRunning1 && this.halfProgress < 100) {
            this.textState1 = '继续'
          }
          this.isRunning1 = !this.isRunning1
          let timer = setInterval(() => {

            if (this.isRunning1) {
              if (this.halfProgress === 100) {
              } else {
                this.halfProgress++
                if (this.halfProgress === 100) {
                  this.textState1 = '安装中'
                  this.enableState1 = false
                  this.buttonState = Visibility.Visible
                  this.progressState = Visibility.None
                  this.buttonEnable = false
                  this.buttonText = '安装中'
                  let timer2 = setInterval(() => {
                    this.buttonText = '打开'
                    this.buttonEnable = true
                    this.isEnd = true
                    clearInterval(timer2)
                  },2000)
                }
                console.info('x progress++ = ' + this.halfProgress)
              }
            } else {
              console.info('x isRunning = ' + false)
              clearInterval(timer)
            }
          }, 100)
        }
      }).visibility(this.progressState)
    }.alignItems(HorizontalAlign.Center).width('100%')
  }
}