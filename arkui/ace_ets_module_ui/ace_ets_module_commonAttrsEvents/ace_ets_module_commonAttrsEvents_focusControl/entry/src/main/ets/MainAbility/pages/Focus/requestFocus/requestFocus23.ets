/*
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
@Entry
@Component
struct requestFocus23 {
  private controller: TabsController = new TabsController()
  @State currentIndex: number = 0
  @State text1:string = ''
  @State text2:string = 'TextInput'
  build() {
    Column() {
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex, controller: this.controller }) {
        TabContent() {
          Column(){
            Text('' + this.text1).id('requestFocus23_text1')
            Button('Focus-textInput1').onClick(() => {
              try{
                this.getUIContext().getFocusController().requestFocus('requestFocus23_textInput1')
              }catch (error){
                this.text1 = '' + error.code
              }
            }).id('requestFocus23_btn1')
          }
        }.tabBar('页签一')

        TabContent() {
          TextInput({text:this.text2})
            .id('requestFocus23_textInput1')
            .onFocus(() => {
              this.text2 = 'TextInput_1'
            })
            .onBlur(() => {
              this.text2 = 'TextInput'
            })
        }.tabBar('页签二')

      }
      .vertical(false)
      .barMode(BarMode.Fixed)
      .barWidth(360)
      .barHeight(56)
      .animationDuration(400)
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .width(360)
      .height(296)
      .margin({ top: 52 })
      .backgroundColor('#F1F3F5')
    }.width('100%')
  }
}