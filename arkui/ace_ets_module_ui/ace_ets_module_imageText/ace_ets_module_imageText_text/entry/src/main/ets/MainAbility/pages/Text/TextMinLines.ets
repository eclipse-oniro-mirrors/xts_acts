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

@Entry
@Component
struct textMinLinesTest {
  @State minLines: number | null | undefined = 1
  @State text: string = '你好,我是XTS测试文本,测试接口Text.minLines'

  build() {
    Column({ space: 10 }) {
      Column({ space: 5 }) {
        Text('minLines参数设置: ' + this.minLines).margin({ top: 20 })
        Row({ space: 10 }) {
          Button('1').onClick((event: ClickEvent) => {
            this.minLines = 1
          }).layoutWeight(1).id('Button1')
          Button('0').onClick((event: ClickEvent) => {
            this.minLines = 0
          }).layoutWeight(1).id('Button2')
          Button('10').onClick((event: ClickEvent) => {
            this.minLines = 10
          }).layoutWeight(1).id('Button3')
          Button('5.5').onClick((event: ClickEvent) => {
            this.minLines = 5.5
          }).layoutWeight(1).id('Button4')
        }.width('90%')

        Row({ space: 10 }) {
          Button('-2').onClick((event: ClickEvent) => {
            this.minLines = -2
          }).layoutWeight(1).id('Button5')
          Button('-0.5').onClick((event: ClickEvent) => {
            this.minLines = -0.5
          }).layoutWeight(1).id('Button6')
          Button('null').onClick((event: ClickEvent) => {
            this.minLines = null
          }).layoutWeight(1).id('Button7')
          Button('undefined').onClick((event: ClickEvent) => {
            this.minLines = undefined
          }).layoutWeight(1).id('Button8')
        }.width('90%')
        Column({ space: 10 }) {
          Text(this.text)
            .backgroundColor(Color.Pink)
            .minLines(this.minLines)
            .id('text1')
        }
      }
      .width('98%').margin({ top: 50 })
    }
  }
}