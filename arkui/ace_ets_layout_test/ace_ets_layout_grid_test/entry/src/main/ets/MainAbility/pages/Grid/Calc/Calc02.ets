/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
struct Calc02 {
  build() {
    Column({space: 10}){
      Column() {
        Row().key('calc02key01').backgroundColor(Color.Grey).width(300).height('calc(45% + 45%)')
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
      Column() {
        Text('faskfhsajkfhjkas').key('calc02key02')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(20% * 2)')
          .height(60)
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
      Column() {
        Text('faskfhsajkfhjkas').key('calc02key03')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(40% - 20vp)')
          .height(60)
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
      Column() {
        Text('faskfhsajkfhjkas').key('calc02key04')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(40% + 20vp)')
          .height(60)
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
      Column() {
        Text('faskfhsajkfhjkas').key('calc02key05')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(40%)')
          .height(60)
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
      Column() {
        Text('faskfhsajkfhjkas').key('calc02key06')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(abc)')
          .height(60)
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
      Column() {
        Text('faskfhsajkfhjkas').key('calc02key07')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc((40%*2 + 20vp*2)/2 - 50vp)')
          .height(60)
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
      Column() {
        Text('faskfhsajkfhjkas').key('calc02key08')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(2E2vp)')
          .height(60)
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
      Column() {
        Text('faskfhsajkfhjkas').key('calc02key09')
          .fontSize(15)
          .backgroundColor(Color.Grey)
          .width('calc(60%/2)')
          .height(60)
      }.width(300).height(60).alignItems(HorizontalAlign.Start).backgroundColor(Color.Pink)
    }.margin({top:30,left:10})
  }
}