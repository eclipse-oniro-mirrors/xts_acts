/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { AVCastPicker, AVCastPickerState, AVCastPickerStyle, AVCastPickerColorMode } from '@kit.AVSessionKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  
  @State pickerImage: ResourceStr = $r('app.media.icon');

  @State colorMode: AVCastPickerColorMode = AVCastPickerColorMode.AUTO
  
  @State sessionType: string = 'audio'

  aboutToAppear() {
    hilog.info(0x0000, 'CastDemo', 'Cast page initialized');
  }

  private handleStateChange(state: AVCastPickerState) {
    switch(state) {
      case AVCastPickerState.STATE_APPEARING:
        console.log('The picker starts showing.');
        break;
      case AVCastPickerState.STATE_DISAPPEARING:
        console.log('The picker finishes presenting.');
        break;
    }
  }

  @Builder
  CustomDevicePicker(): void {
    Image(this.pickerImage)
      .width('100%')
      .height('100%')
      .fillColor(Color.Black)
  }

  build() {
    Column({ space: 20 }) {
      Text(this.message)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')

      AVCastPicker({
        normalColor: '#A0A0A0',          
        activeColor: '#007AFF',          
        pickerStyle: AVCastPickerStyle.STYLE_PANEL,  
        colorMode: this.colorMode,       
        sessionType: this.sessionType,   
        customPicker: () => this.CustomDevicePicker(), 
        onStateChange: this.handleStateChange 
      })
      .width(80)
      .height(80)
      .borderRadius(20)
      .backgroundColor(Color.White)

      Row({ space: 15 }) {
        Button('Toggle Color Mode')
          .onClick(() => {
            this.colorMode = this.colorMode === AVCastPickerColorMode.AUTO ? 
                           AVCastPickerColorMode.DARK : 
                           AVCastPickerColorMode.AUTO;
          })

        Button('Toggle Session Type')
          .onClick(() => {
            this.sessionType = this.sessionType === 'audio' ? 'video' : 'audio';
          })
      }
      .margin({ top: 30 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}