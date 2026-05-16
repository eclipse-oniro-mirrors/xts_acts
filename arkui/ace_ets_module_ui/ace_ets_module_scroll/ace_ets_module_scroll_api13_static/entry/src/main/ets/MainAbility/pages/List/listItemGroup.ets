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
import {UIContext} from '@ohos.arkui.UIContext';
import { NodeController,  ComponentContent } from '@ohos.arkui.node';
import common from '@ohos.app.ability.common';
import { Entry, Column, Component, Flex, ClickEvent, Scroller, Color,ResourceColor, OnScrollFrameBeginHandlerResult, Row,
  Image, TextAlign, Scroll, ScrollState, ForEach, EdgeEffect, FontWeight, Margin, Length, LocalizedMargin, FontStyle, Builder,
  Text, Button, List, ListItem, ListItemGroup, BarState, Padding, TextDecorationType, wrapBuilder} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

class Params {
  public text: string = ""
  public fontColor: ResourceColor = Color.Red
  public fontSize: string | number = 16
  public fontWeight: Int|FontWeight|String|undefined = FontWeight.Normal
  public margin: Margin | Length | LocalizedMargin = 10
  public fontStyle: FontStyle | undefined = FontStyle.Normal
  public type: number

  constructor(text: string, fontColor: ResourceColor, fontSize: string | number,
    fontWeight: Int|FontWeight|String|undefined, margin: Margin | Length | LocalizedMargin,
    fontStyle: FontStyle | undefined , type: number){
    this.text = text;
    this.fontColor = fontColor;
    this.fontSize = fontSize;
    this.fontWeight = fontWeight;
    this.margin = margin;
    this.fontStyle = fontStyle || FontStyle.Normal;
    this.type = type;
  }
}

@Builder
function buildTest(params: Params){
  Column(undefined) {
    Text(params.text)
      .key('buildTest' + params.type)
      .id('buildTest' + params.type)
      .fontColor(params.fontColor)
      .fontSize(params.fontSize)
      .fontWeight(params.fontWeight)
      .margin(params.margin)
      .fontStyle(params.fontStyle)
      .decoration({ type: TextDecorationType.None, color: '#4B0082' })
  }
}

@Entry
@Component
struct Index {
  aboutToAppear(){
    console.info('start run testcase!!!!')
    console.info('start run testcase!!!')
  }

  private timeTable: TimeTable[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    } as TimeTable,
  ]

  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  @State context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext
  @State isDark: boolean = false;
  uicontext: UIContext = this.getUIContext()
  headerNode1: ComponentContent<Params> =
    new ComponentContent<Params>(this.uicontext, wrapBuilder(buildTest), new Params(
      "message1", Color.Green, 5, FontWeight.Bold, 10, FontStyle.Normal,1));
  footerNode1: ComponentContent<Params> =
    new ComponentContent<Params>(this.uicontext, wrapBuilder(buildTest),
      new Params("message2", Color.Red, 16, FontWeight.Bold, 10, FontStyle.Normal,2));
  headerNode2: ComponentContent<Params> =
    new ComponentContent<Params>(this.uicontext, wrapBuilder(buildTest), new Params(
      "123456789", Color.Green, 5, FontWeight.Bold, 10, FontStyle.Normal,3));
  footerNode2: ComponentContent<Params> =
    new ComponentContent<Params>(this.uicontext, wrapBuilder(buildTest),
      new Params("99999999", Color.Red, 16, FontWeight.Bold, 10, FontStyle.Normal,4));
  build() {
    Scroll() {
      Row(undefined) {
        Column(undefined) {
          List({ space: 5 }) {
            ForEach(this.timeTable, (item: TimeTable) => {
              ListItemGroup(
                {
                headerComponent: this.headerNode1,
                footerComponent: this.footerNode1
              }
              ) {
                ForEach(item.projects, (project: string) => {
                  ListItem() {
                    Text(project)
                      .width("100%")
                      .height(100)
                      .fontSize(20)
                      .textAlign(TextAlign.Center)
                      .backgroundColor('0xFFFFFF')
                  }
                }, (item: string) => item)
              }
              .divider({ strokeWidth: 1, color: Color.Blue })
            })
          }
          .scrollBar(BarState.Off)
          .width('100%')
          .height('50%')
          .backgroundColor(0xDCDCDC)
          .padding({ top: 5 } as Padding)

          List({ space: 5 }) {
            ForEach(this.timeTable, (item: TimeTable) => {
              ListItemGroup({
                headerComponent: this.headerNode2,
                footerComponent: this.footerNode2
              }) {
                ForEach(item.projects, (project: string) => {
                  ListItem() {
                    Text(project)
                      .width("100%")
                      .height(100)
                      .fontSize(20)
                      .textAlign(TextAlign.Center)
                      .backgroundColor('0xFFFFFF')
                  }
                }, (item: string) => item)
              }
              .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
            })
          }
          .scrollBar(BarState.Off)
          .width('100%')
          .height('50%')
          .backgroundColor(0xDCDCDC)
          .padding({ top: 5 } as Padding)
        }
      }
    }
  }
}
interface TimeTable {
  title: string;
  projects: string[];
}

