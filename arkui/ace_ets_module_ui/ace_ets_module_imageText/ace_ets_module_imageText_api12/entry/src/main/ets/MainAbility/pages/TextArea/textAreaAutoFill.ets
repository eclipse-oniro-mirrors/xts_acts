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
struct textAreaAutoFill {
  @State areaTxt: string = '';

  build() {
    Column() {
      Row() {
        Text('street')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })
        TextArea({ placeholder: '请填写收货人街道地址', text: this.areaTxt })
          .contentType(ContentType.FULL_STREET_ADDRESS)
          .key('textArea3')
          .id('textArea3')
          .width('60%')
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('house')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人房号', text: this.areaTxt })
          .contentType(ContentType.HOUSE_NUMBER)
          .key('textArea4')
          .id('textArea4')
          .width('60%')
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('district')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人地区地址', text: this.areaTxt })
          .contentType(ContentType.DISTRICT_ADDRESS)
          .key('textArea5')
          .id('textArea5')
          .width('60%')
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('city')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人城市地址', text: this.areaTxt })
          .contentType(ContentType.CITY_ADDRESS)
          .key('textArea6')
          .id('textArea6')
          .width('60%')
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('province')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人省份地址', text: this.areaTxt })
          .contentType(ContentType.PROVINCE_ADDRESS)
          .key('textArea7')
          .id('textArea7')
          .width('60%')
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('country')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人国家地址', text: this.areaTxt })
          .contentType(ContentType.COUNTRY_ADDRESS)
          .key('textArea8')
          .id('textArea8')
          .width('60%')
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('full name')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人姓名', text: this.areaTxt })
          .contentType(ContentType.PERSON_FULL_NAME)
          .key('textArea9')
          .id('textArea9')
          .width('60%')
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('lastname')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人姓', text: this.areaTxt })
          .contentType(ContentType.PERSON_LAST_NAME)
          .key('textArea10')
          .id('textArea10')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('firstname')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人名', text: this.areaTxt })
          .contentType(ContentType.PERSON_FIRST_NAME)
          .key('textArea11')
          .id('textArea11')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('phone')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人电话', text: this.areaTxt })
          .contentType(ContentType.PHONE_NUMBER)
          .key('textArea12')
          .id('textArea12')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('country id')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人国际区号', text: this.areaTxt })
          .contentType(ContentType.PHONE_COUNTRY_CODE)
          .key('textArea13')
          .id('textArea13')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('full phone')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人完整电话', text: this.areaTxt })
          .contentType(ContentType.FULL_PHONE_NUMBER)
          .key('textArea14')
          .id('textArea14')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('email')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人邮箱地址', text: this.areaTxt })
          .contentType(ContentType.EMAIL_ADDRESS)
          .key('textArea15')
          .id('textArea15')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('card')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人银行卡号', text: this.areaTxt })
          .contentType(ContentType.BANK_CARD_NUMBER)
          .key('textArea16')
          .id('textArea16')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('id')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写收货人身份证号', text: this.areaTxt })
          .contentType(ContentType.ID_CARD_NUMBER)
          .key('textArea17')
          .id('textArea17')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('nick name')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写昵称', text: this.areaTxt })
          .contentType(ContentType.NICKNAME)
          .key('textArea23')
          .id('textArea23')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('detail info')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写无街道地址', text: this.areaTxt })
          .contentType(ContentType.DETAIL_INFO_WITHOUT_STREET)
          .key('textArea24')
          .id('textArea24')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('address')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: '请填写标准地址', text: this.areaTxt })
          .contentType(ContentType.FORMAT_ADDRESS)
          .key('textArea25')
          .id('textArea25')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')

      Row() {
        Text('undefined')
          .fontSize(10)
          .width('22%')
          .margin({ left: 50 })

        TextArea({ placeholder: 'Auto fill test contentType undefined', text: this.areaTxt })
          .contentType(undefined)
          .key('textArea18')
          .id('textArea18')
          .width('60%')
          .borderWidth({ top: 0, bottom: 0, left: 0, right: 0 })
          .fontWeight(FontWeight.Bold)
          .placeholderColor('#fff5eeee')
          .backgroundColor('#ffffffff')
          .fontSize(10)
          .borderStyle(BorderStyle.Solid)
          .enableAutoFill(true)
      }.height('5%')
    }.height('100%')
  }
}