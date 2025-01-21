/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
struct textObscured {
  private scroller: Scroller = new Scroller()
  @State message: string = 'Hello World'


  build() {
     Column() {
           Stack({ alignContent: Alignment.End }) {
             Scroll(this.scroller) {
               Flex({ direction: FlexDirection.Column }) {

                 Row() {
                   Text(this.message)
                     .fontSize(30)
                     .fontColor("#FF0000FF")
                     .obscured([ObscuredReasons.PLACEHOLDER])
                     .textAlign(TextAlign.Start)
                     .baselineOffset(30)
                     .key('ArkUX_Redacted_Text_0090')
                 }.margin({bottom: 50})

                 Row() {
                   Text(this.message)
                     .fontSize(10)
                     .fontColor("#FF0000FE")
                     .obscured(null)
                     .textAlign(null)
                     .baselineOffset(null)
                     .key('ArkUX_Redacted_Text_0100')
                 }.margin({bottom: 50})

                 Row() {
                   Text(this.message)
                     .fontSize(100)
                     .fontColor("#FF0000FD")
                     .obscured([ObscuredReasons.PLACEHOLDER])
                     .textAlign(TextAlign.End)
                     .baselineOffset(100)
                     .key('ArkUX_Redacted_Text_0110')
                 }.margin({bottom: 50})

                 Row() {
                   Text(this.message)
                     .fontSize(1000)
                     .fontColor("#FF0000FC")
                     .obscured([ObscuredReasons.PLACEHOLDER])
                     .textAlign(TextAlign.Center)
                     .baselineOffset(1000)
                     .key('ArkUX_Redacted_Text_0120')
                 }.margin({bottom: 50})

                 Row() {
                   Text(this.message)
                     .fontSize(1)
                     .fontColor("#FF0000FB")
                     .obscured([ObscuredReasons.PLACEHOLDER])
                     .textAlign(TextAlign.Start)
                     .baselineOffset(1)
                     .key('ArkUX_Redacted_Text_0130')
                 }.margin({bottom: 50})




               }.margin({ left: 52 })
             }
             .scrollBar(BarState.Off)
             .scrollable(ScrollDirection.Vertical)
             ScrollBar({ scroller: this.scroller, direction: ScrollBarDirection.Vertical,state: BarState.Auto }) {
               Text()
                 .width(30)
                 .height(100)
                 .borderRadius(10)
                 .backgroundColor('#C0C0C0')
             }.width(30).backgroundColor('#ededed')
           }
         }
   }
}
