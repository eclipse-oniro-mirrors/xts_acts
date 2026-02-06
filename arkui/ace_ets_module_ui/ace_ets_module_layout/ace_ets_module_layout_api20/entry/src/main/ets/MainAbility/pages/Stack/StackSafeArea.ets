/*
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

import { LengthMetrics } from '@kit.ArkUI'

@Entry
@Component
struct StackSafeArea {

  @State layoutSafeAreaType :LayoutSafeAreaType[]|null|undefined= []
  @State layoutSafeAreaEdge :LayoutSafeAreaEdge[]|null|undefined= []
  @State str : string = ''

  build() {
    Column({space:2}){
      Stack(){
        Stack(){
        }
        .id('StackSafeArea1')
        .width(LayoutPolicy.matchParent)
        .height(LayoutPolicy.matchParent)
        .backgroundColor(Color.Orange)
        .ignoreLayoutSafeArea(this.layoutSafeAreaType,this.layoutSafeAreaEdge)
      }
      .id('StackSafeArea2')
      .width(100)
      .height(80)
      .backgroundColor(Color.Pink)
      .align(Alignment.TopStart)
      .safeAreaPadding(LengthMetrics.vp(25))

      Row(){
        Button('SYSTEM')
          .id('SystemButton1')
          .onClick(() => {
            this.layoutSafeAreaType = [LayoutSafeAreaType.SYSTEM]
            this.str = this.layoutSafeAreaType.toString()
          }).width(55).height(25)
        
        Button('NULL1')
          .id('NullButton1')
          .onClick(() => {
            this.layoutSafeAreaType = null
            this.str = this.layoutSafeAreaType+''
          }).width(55).height(25)
      }
      Row(){
        Button('UNDEFINED1')
          .id('UndefinedButton1')
          .onClick(() => {
            this.layoutSafeAreaType = undefined
            this.str = this.layoutSafeAreaType+''
          }).width(55).height(25)
        Button('TOP')
          .id('TopButton1')
          .onClick(() => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.TOP]
            this.str = this.layoutSafeAreaEdge.toString()
          }).width(55).height(25)
        Button('BOTTOM')
          .id('BottomButton1')
          .onClick(() => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.BOTTOM]
            this.str = this.layoutSafeAreaEdge.toString()
          }).width(55).height(25)
        Button('START')
          .id('StartButton1')
          .onClick(() => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.START]
            this.str = this.layoutSafeAreaEdge.toString()
          }).width(55).height(25)
      }
      Row(){
        Button('END')
          .id('EndButton1')
          .onClick(() => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.END]
            this.str = this.layoutSafeAreaEdge.toString()
          }).width(55).height(25)
        Button('VERTICAL')
          .id('VerticalButton1')
          .onClick(() => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.VERTICAL]
            this.str = this.layoutSafeAreaEdge.toString()
          }).width(55).height(25)
        Button('HORIZONTAL')
          .id('HorizontalButton1')
          .onClick(() => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.HORIZONTAL]
            this.str = this.layoutSafeAreaEdge.toString()
          }).width(55).height(25)
        Button('ALL2')
          .id('AllButton2')
          .onClick(() => {
            this.layoutSafeAreaEdge = [LayoutSafeAreaEdge.ALL]
            this.str = this.layoutSafeAreaEdge.toString()
          }).width(55).height(25)
      }
      Row(){
        Button('NULL2')
          .id('NullButton2')
          .onClick(() => {
            this.layoutSafeAreaEdge = null
            this.str = this.layoutSafeAreaEdge+''
          }).width(55).height(25)
        Button('UNDEFINED2')
          .id('UndefinedButton2')
          .onClick(() => {
            this.layoutSafeAreaEdge = undefined
            this.str = this.layoutSafeAreaEdge+''
          }).width(55).height(25)
        Text(this.str)
          .id('GetSafeAreaNumber1')
          .width(75)
          .height(25)
        //0 1 2 null undefined 0 1 2 3 4 5 6 null undefined
      }


    }
    .width('100%')
    .height('100%')
    .padding(5)
  }
}