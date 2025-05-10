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

@Entry
@Component
struct TextExample7 {
  @State phoneNumber: string = '15234545343';
  @State url: string = 'www.bilibilibili.com';
  @State email: string = '3145897867@example.com';
  @State address: string = '河南省周口市区鹿邑县';
  @State enableDataDetector: boolean = true;
  @State types: TextDataDetectorType[] = [];
  @State text1: string = '111'

  build() {
      Column() {
        Text(this.text1).fontSize(20).id('dataDetectorConfigText')
        .height('10%')
        Text(
          '电话号码：' + this.phoneNumber + '\n' +
          '链接：' + this.url + '\n' +
          '邮箱：' + this.email + '\n' +
          '地址：' + this.address
        )
          .fontSize(16)
          .copyOption(CopyOptions.InApp)
          .enableDataDetector(this.enableDataDetector)
          .dataDetectorConfig({types : this.types, onDetectResultUpdate: (result: string)=>{
            console.info('识别结果' + JSON.parse(JSON.stringify(result)) )
            let code: number | string = JSON.parse(result).code
            if (code === '0' || code === 0)  {
              this.text1 = '222'
            } else if (code === '801' || code === 801) {
              this.text1 = '222'
            }
          }})
          .textAlign(TextAlign.Center)
          .borderWidth(1)
          .padding(10)
          .width('100%')
          .id('text_attr_test')



      Row(){
        Button('电话号码').onClick(() => {
          this.types = [TextDataDetectorType.PHONE_NUMBER]
        }).id('button.PHONE_NUMBER').width('40%')

        Button('链接').onClick(() => {
          this.types = [TextDataDetectorType.URL]
        }).id('button.URL').width('40%')
      }.height('10%')


      Row(){
        Button('邮箱').onClick(() => {
          this.types = [TextDataDetectorType.EMAIL]
        }).id('button.EMAIL').width('40%')

        Button('地址').onClick(() => {
          this.types = [TextDataDetectorType.ADDRESS]
        }).id('button.ADDRESS').width('40%')
      }.height('10%')

      }
      .width('100%')
  }
}