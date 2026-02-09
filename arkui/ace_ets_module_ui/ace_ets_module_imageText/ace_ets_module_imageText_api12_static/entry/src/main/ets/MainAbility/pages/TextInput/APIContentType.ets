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
  Entry, Component, Column, Text,  ClickEvent, ContentType, InputType,
  Button, TextInput , Margin, CaretOffset, TextInputController
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import Utils from '../../common/Utils'
@Entry
@Component
struct APIContentType {
  @State text: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 } as CaretOffset
  @State passwordState: boolean = false
  controller: TextInputController = new TextInputController()

  build() {
    Column() {
      Text(this.text).key('APIContentTypeText').margin({top:20} as Margin).fontSize(10)
      TextInput({ placeholder: 'input your password...' }).key('APIContentTypeTextInput')
        .width('95%')
        .height('10%')
        .type(InputType.Password)
        .maxLength(9)
        .showPasswordIcon(true)
        .showPassword(this.passwordState)
        .contentType(ContentType.PASSWORD)
        .onSecurityStateChange(((isShowPassword: boolean):void => {
          // 更新密码显示状态
          console.info('isShowPassword',isShowPassword)
          this.passwordState = isShowPassword
        }))
      Button('get').key('APIContentTypeButton')
        .onClick((e:ClickEvent) => {
          let strJson = inspector.getInspectorByKey('APIContentTypeTextInput');
          this.text = JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType') + ''
        }).height('5%')

      TextInput({ placeholder: 'input your password...' }).key('ContentType_23')
        .width('95%')
        .height('10%')
        .type(InputType.Password)
        .maxLength(9)
        .showPasswordIcon(true)
        .showPassword(this.passwordState)
        .contentType(ContentType.NICKNAME)
        .onSecurityStateChange(((isShowPassword: boolean):void => {
          // 更新密码显示状态
          console.info('isShowPassword',isShowPassword)
          this.passwordState = isShowPassword
        }))
      Button('get_ContentType_23').key('TypeButton_23')
        .onClick((e:ClickEvent) => {
          let strJson = inspector.getInspectorByKey('ContentType_23');
          this.text = JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType') + ''
        }).height('5%')
      TextInput({ placeholder: 'input your password...' }).key('ContentType_24')
        .width('95%')
        .height('10%')
        .type(InputType.Password)
        .maxLength(9)
        .showPasswordIcon(true)
        .showPassword(this.passwordState)
        .contentType(ContentType.DETAIL_INFO_WITHOUT_STREET)
        .onSecurityStateChange(((isShowPassword: boolean):void => {
          // 更新密码显示状态
          console.info('isShowPassword',isShowPassword)
          this.passwordState = isShowPassword
        }))
      Button('get_ContentType_23').key('TypeButton_24')
        .onClick((e:ClickEvent) => {
          let strJson = inspector.getInspectorByKey('ContentType_24');
          this.text = JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType') + ''
        }).height('5%')
      TextInput({ placeholder: 'input your password...' }).key('ContentType_25')
        .width('95%')
        .height('10%')
        .type(InputType.Password)
        .maxLength(9)
        .showPasswordIcon(true)
        .showPassword(this.passwordState)
        .contentType(ContentType.FORMAT_ADDRESS)
        .onSecurityStateChange(((isShowPassword: boolean):void => {
          // 更新密码显示状态
          console.info('isShowPassword',isShowPassword)
          this.passwordState = isShowPassword
        }))
      Button('get_ContentType_23').key('TypeButton_25')
        .onClick((e:ClickEvent) => {
          let strJson = inspector.getInspectorByKey('ContentType_25');
          this.text = JSON.parseJsonElement(strJson).getElement('$attrs').getString('contentType') + ''
        }).height('5%')
    }.width('100%').height('100%')
  }
}