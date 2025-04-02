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

import router from '@ohos.router';
import autoFillManager from '@ohos.app.ability.autoFillManager';

@Entry
@Component
struct textInputAutoFill {
  @State inputTxt: string = '';

  build() {
    Column() {
      Row() {
        Text('street')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人街道地址', text: this.inputTxt})
          .contentType(ContentType.FULL_STREET_ADDRESS)
          .key('password3')
          .id('password3')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }

      Row() {
        Text('house')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人房号', text: this.inputTxt})
          .contentType(ContentType.HOUSE_NUMBER)
          .key('password4')
          .id('password4')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }

      Row() {
        Text('district')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人地区地址', text: this.inputTxt})
          .contentType(ContentType.DISTRICT_ADDRESS)
          .key('password5')
          .id('password5')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('city')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人城市地址', text: this.inputTxt})
          .contentType(ContentType.CITY_ADDRESS)
          .key('password6')
          .id('password6')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('province')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人省份地址', text: this.inputTxt})
          .contentType(ContentType.PROVINCE_ADDRESS)
          .key('password7')
          .id('password7')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('country')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人国家地址', text: this.inputTxt})
          .contentType(ContentType.COUNTRY_ADDRESS)
          .key('password8')
          .id('password8')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('email')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人邮箱地址', text: this.inputTxt})
          .contentType(ContentType.EMAIL_ADDRESS)
          .key('password15')
          .id('password15')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('full name')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人姓名', text: this.inputTxt})
          .contentType(ContentType.PERSON_FULL_NAME)
          .key('password9')
          .id('password9')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 5 })

      Row() {
        Text('lastname')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人姓', text: this.inputTxt})
          .contentType(ContentType.PERSON_LAST_NAME)
          .key('password10')
          .id('password10')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 5 })

      Row() {
        Text('firstname')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人名', text: this.inputTxt})
          .contentType(ContentType.PERSON_FIRST_NAME)
          .key('password11')
          .id('password11')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 5 })

      Row() {
        Text('phone')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人电话', text: this.inputTxt})
          .contentType(ContentType.PHONE_NUMBER)
          .key('password12')
          .id('password12')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 5 })

      Row() {
        Text('phone country')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人国际区号', text: this.inputTxt})
          .contentType(ContentType.PHONE_COUNTRY_CODE)
          .key('password13')
          .id('password13')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('full phone')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人完整电话', text: this.inputTxt})
          .contentType(ContentType.FULL_PHONE_NUMBER)
          .key('password14')
          .id('password14')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('card')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人银行卡号', text: this.inputTxt})
          .contentType(ContentType.BANK_CARD_NUMBER)
          .key('password16')
          .id('password16')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('id')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: '请填写收货人身份证号', text: this.inputTxt})
          .contentType(ContentType.ID_CARD_NUMBER)
          .key('password17')
          .id('password17')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })

      Row() {
        Text('undefined')
          .margin(10)
          .fontSize(18)
          .width('22%')
          .margin({ left: 50 })

        TextInput({ placeholder: 'Auto fill test contentType undefined', text: this.inputTxt})
          .contentType(undefined)
          .key('password18')
          .id('password18')
          .width('60%')
          .borderWidth({top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(16)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }
      .margin({ top: 10 })
    }
  }
}