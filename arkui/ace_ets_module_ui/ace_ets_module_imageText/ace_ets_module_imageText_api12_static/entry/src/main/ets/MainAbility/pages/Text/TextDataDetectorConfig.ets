'use static';
/*
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
import {
  Entry, Component, TextDataDetectorType, Color, CopyOptions,
  Column, ColumnOptions, TextAlign, Text, TextDecorationType, DecorationStyleInterface
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
@Entry
@Component
struct TextDataDetectorConfig1 {
  @State phoneNumber: string = '(86) (755) ********';
  @State url: string = 'www.********.com';
  @State email: string = '2495218076@qq.com';
  @State address: string = 'XX省XX市XX区XXXX';
  @State datetime: string = 'XX年XX月XX日XXXX';
  @State enableDataDetector: boolean = true;
  @State types: TextDataDetectorType[] = [TextDataDetectorType.PHONE_NUMBER, TextDataDetectorType.EMAIL];

  build() {
    Column({space:10} as ColumnOptions){

      Text('TextDataDetectorConfig').fontSize(9).fontColor(0xCCCCCC).margin(15).width('90%')
      Text(
        '电话号码：' + this.phoneNumber + '\n' +
          '链接：' + this.url + '\n' +
          '邮箱：' + this.email + '\n' +
          '地址：' + this.address + '\n' +
          '时间：' + this.datetime
      )
        .fontSize(16)
        .copyOption(CopyOptions.InApp)
        .enableDataDetector(true)
        .dataDetectorConfig({
          types : this.types,
          onDetectResultUpdate: (result: string)=>{},
          color: Color.Blue,
          decoration: {
            type: TextDecorationType.Underline,
            color: Color.Red
          } as DecorationStyleInterface
        })
        .textAlign(TextAlign.Center)
        .borderWidth(1)
        .padding(10)
        .width('100%')
        .id('text_dataDetectorConfig')

    }

  }
}

