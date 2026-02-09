'use static';
/**
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
import { Entry, Text, Column, Component, Search, SearchController, ClickEvent, Margin, Callback, TextAlign, Button, EditableTextOnChangeCallback} from '@ohos.arkui.component'
import { State, AppStorage } from '@ohos.arkui.stateManagement'
import { UIContext, Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct searchTest {
  @State text: string = ''
  @State text1: string = ''
  @State text2: string = ''
  @State text3: string = ''
  controller: SearchController = new SearchController()


  build() {
    Column() {
      Search({ value: this.text2, controller: this.controller })
        .key('searchTest1')
        .width(150)
        .onChange((value: string) => {
          this.text2 = value
        } as EditableTextOnChangeCallback)
        .onEditChange((e:boolean) => {
          console.log("============================== onEditChange " + string(e));

          this.text = string(e)
          if (e) {
            this.text3 += 1
          }
        } as Callback<boolean>).height('10%')
      Search()
        .width(150)
        .key('searchTest2')
        .onEditChange((e:boolean) => {

          this.text1 = string(e)
          console.log("============================== onEditChange2 " + this.text1);
        } as Callback<boolean>).height('10%')
      Text(this.text).key('searchTestText1').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
      Text(this.text1).key('searchTestText2').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
      Text(this.text3).key('searchTestText3').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')
      Button('stop')
        .key('searchTestBt')
        .onClick((event: ClickEvent) => {
          console.log("===========================Button('stop') ")
          this.controller.stopEditing()


        }).height('5%')
      Button('text')
        .key('searchTestBt2')
        .onClick((event: ClickEvent) => {
          this.text2 = 'Search SearchSearchSearch SearchSearchSearch'
        })
        .height('5%')
    }.margin({
      left:30,
      top:50
    } as Margin).height('100%')
  }
}