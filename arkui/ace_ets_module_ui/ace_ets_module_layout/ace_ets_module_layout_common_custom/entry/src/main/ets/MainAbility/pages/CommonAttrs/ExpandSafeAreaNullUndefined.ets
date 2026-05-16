/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
struct ExpandSafeAreaNullUndefinedTest {
  @State value1: Array<SafeAreaType> | null | undefined = [SafeAreaType.SYSTEM]
  @State value2: Array<SafeAreaEdge> | null | undefined = [SafeAreaEdge.START, SafeAreaEdge.TOP]

  build() {
    Column() {
      Row(){
        Column(){
          Stack(){
            Stack(){

            }
            .width(30)
            .height(30)
            .backgroundColor('rgb(0, 74, 175)')
          }
          .width(100)
          .height(100)
          .backgroundColor('rgb(39, 135, 217)')
          .align(Alignment.TopStart)

          Text('基准效果').fontColor(Color.White)
        }

        Column(){
          Stack(){
            Stack(){

            }
            .width(30)
            .height(30)
            .backgroundColor('rgb(0, 74, 175)')
          }
          .width(100)
          .height(100)
          .backgroundColor('rgb(39, 135, 217)')
          .align(Alignment.TopStart)
          .expandSafeArea(this.value1, this.value2)  // 设置绘制区域延伸，自身绘制区域上抬，子组件相对屏幕位置不变
          .id('ExpandSafeAreaNullUndefinedTest_stack')

          Text('expandSafeArea').fontColor(Color.White)
        }

        Column(){
          Stack(){
            Stack(){

            }
            .width(30)
            .height(30)
            .backgroundColor('rgb(0, 74, 175)')
          }
          .width(100)
          .height(100)
          .backgroundColor('rgb(39, 135, 217)')
          .align(Alignment.TopStart)
          .ignoreLayoutSafeArea()  // 设置布局区域延伸，自身布局区域上抬，子组件相对容器位置不变

          Text('ignoreLayoutSafeArea').fontColor(Color.White)
        }
      }
      .width('100%')
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.SpaceEvenly)

      Row() {
        Button('value1:null').onClick((event: ClickEvent) => {
          this.value1 = null
        })
          .width('25%')
          .id('ExpandSafeAreaNullUndefinedTest_null_1')
        Button('value1:undefined').onClick((event: ClickEvent) => {
          this.value1 = undefined
        })
          .width('25%')
          .id('ExpandSafeAreaNullUndefinedTest_undefined_1')
        Button('value1:[]').onClick((event: ClickEvent) => {
          this.value1 = []
        })
          .width('25%')
          .id('ExpandSafeAreaNullUndefinedTest_empty_1')
        Button('value1:SYSTEM').onClick((event: ClickEvent) => {
          this.value1 = [SafeAreaType.SYSTEM]
        })
          .width('25%')
          .id('ExpandSafeAreaNullUndefinedTest_valid_1')
      }
      Row() {
        Button('value2:null').onClick((event: ClickEvent) => {
          this.value2 = null
        })
          .width('25%')
          .id('ExpandSafeAreaNullUndefinedTest_null_2')
        Button('value2:undefined').onClick((event: ClickEvent) => {
          this.value2 = undefined
        })
          .width('25%')
          .id('ExpandSafeAreaNullUndefinedTest_undefined_2')
        Button('value2:[]').onClick((event: ClickEvent) => {
          this.value2 = []
        })
          .width('25%')
          .id('ExpandSafeAreaNullUndefinedTest_empty_2')
        Button('value2:SYSTEM').onClick((event: ClickEvent) => {
          this.value2 = [SafeAreaEdge.START, SafeAreaEdge.TOP]
        })
          .width('25%')
          .id('ExpandSafeAreaNullUndefinedTest_valid_2')
      }
    }
  }
}