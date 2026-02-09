'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  Alignment,
  BorderStyle,
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  Component,
  EdgeEffect,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FlowItem,
  FontWeight,
  Image,
  ImageFit,
  ItemAlign,
  LazyForEach,
  Margin,
  NodeContainer,
  OffsetResult,
  OnScrollFrameBeginHandlerResult,
  Scroll,
  Scroller,
  ScrollSource,
  ScrollState,
  Search,
  Stack,
  Text,
  TextAlign,
  WaterFlow,
  UIScrollEvent
} from '@ohos.arkui.component'
import { LocalStorage, State } from '@ohos.arkui.stateManagement'
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import { UIContext } from '@ohos.arkui.UIContext'

let para: Record<string, string> = { 'Scroll_setOnWillScroll': 'start', 'Scroll_setOnDidScroll': 'start' };
let storage: LocalStorage = new LocalStorage(para);
let para1: Record<string, string> = { 'Scroll_setOnReachStart': 'start', 'Scroll_setOnReachEnd': 'start' };
let storage1: LocalStorage = new LocalStorage(para1);
let para2: Record<string, string> = { 'Scroll_setOnScrollStart': 'start', 'Scroll_setOnScrollStop': 'start' };
let storage2: LocalStorage = new LocalStorage(para2);
let para3: Record<string, string> = { 'Scroll_setOnScrollFrameBegin': 'start' };
let storage3: LocalStorage = new LocalStorage(para3);

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode?.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    let listEvent: UIScrollEvent | undefined = typeNode.getScrollEvent(frameNode);
    listEvent?.setOnWillScroll((scrollOffx: Double, scrollOffy: Double,
      scrollState: ScrollState, scrollSource: ScrollSource)=>{
      storage.set('Scroll_setOnWillScroll', 'setOnWillScroll');
      console.log(`Scroll:: onWillScroll scrollOffx=${scrollOffx}, scrollOffy=${scrollOffy},
      scrollState=${scrollState}, scrollSource=${scrollSource}`)
    })
    listEvent?.setOnDidScroll((xOffset: Double, yOffset: Double, scrollState: ScrollState)=>{
      storage.set('Scroll_setOnDidScroll', 'setOnDidScroll');
      console.log(`Scroll:: setOnDidScroll xOffset=${xOffset}, yOffset=${yOffset}, scrollState=${scrollState}`)
    })
    listEvent?.setOnReachStart(()=>{
      storage1.set('Scroll_setOnReachStart', 'setOnReachStart');
      console.log(`Scroll:: setOnReachStart`)
    })
    listEvent?.setOnReachEnd(()=>{
      storage1.set('Scroll_setOnReachEnd', 'setOnReachEnd');
      console.log(`Scroll:: setOnReachEnd`)
    })
    listEvent?.setOnScrollStart(()=>{
      storage2.set('Scroll_setOnScrollStart', 'setOnScrollStart');
      console.log(`Scroll:: setOnScrollStart`)
    })
    listEvent?.setOnScrollStop(()=>{
      storage2.set('Scroll_setOnScrollStop', 'setOnScrollStop');
      console.log(`Scroll:: setOnScrollStop`)
    })
    listEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
      storage3.set('Scroll_setOnScrollFrameBegin', 'setOnScrollFrameBegin');
      console.log(`Scroll:: setOnScrollFrameBegin offset=${offset}, state=${state}`)
      return {offsetRemain: offset};
    })
  }
}

@Entry
@Component
struct setOnScrollIndex03 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: int = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';

  build() {
    Column() {
      Button('add CommonEvent to Text')
        .id('Scroll_addCommonEvent_03')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling()!)
        })
      Text(this.text)
        .id('Scroll_setOnWill_03')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text = storage.get<string>('Scroll_setOnWillScroll') as string + '_' + storage.get<string>('Scroll_setOnDidScroll') as string + '';
        })
      Text(this.text1)
        .id('Scroll_setOnReach_03')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text1 = storage1.get<string>('Scroll_setOnReachStart') as string + '_' + storage1.get<string>('Scroll_setOnReachEnd') as string + '';
        })
      Text(this.text2)
        .id('Scroll_setOnScroll_03')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text2 = storage2.get<string>('Scroll_setOnScrollStart') as string + '_' + storage2.get<string>('Scroll_setOnScrollStop') as string;
        })
      Text(this.text3)
        .id('Scroll_setOnFrameBegin_03')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text3 = storage3.get<string>('Scroll_setOnScrollFrameBegin') as string
        })
      Scroll() {
        Column() {
          Column()
            .borderWidth(2)
            .width('100%')
            .height('50%')
          Column()
            .borderWidth(2)
            .width('100%')
            .height('50%')
          Column()
            .borderWidth(2)
            .width('100%')
            .height('50%')
        }
      }
      .height('50%')
      .id('key_ScrollItem_set')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOffx: Double, scrollOffy: Double, scrollState: ScrollState,
        scrollSource: ScrollSource): undefined | OffsetResult => {
        console.log(`Scroll:: onWillScroll 1 scrollOffx=${scrollOffx}, scrollOffy=${scrollOffy}scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((xOffset: Double, yOffset: Double, scrollState: ScrollState): void => {
        console.log(`Scroll:: onDidScroll 1  xOffset=${xOffset},yOffset=${yOffset}, scrollState=${scrollState}`)
      })
      .onReachStart(() => {
        console.log(`Scroll:: onReachStart 1 `)
      })
      .onReachEnd(() => {
        console.log(`Scroll:: onReachEnd 1 `)
      })
      .onScrollStart(() => {
        console.log(`Scroll:: onScrollStart 1 `)
      })
      .onScrollStop(() => {
        console.log(`Scroll:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((offset: Double, state: ScrollState): OnScrollFrameBeginHandlerResult => {
        console.log(`Scroll:: onScrollFrameBegin 1 offset=${offset}, state=${state}`)
        return { offsetRemain: offset };
      })

      NodeContainer(this.myNodeController)
    }.width('100%')
  }
}