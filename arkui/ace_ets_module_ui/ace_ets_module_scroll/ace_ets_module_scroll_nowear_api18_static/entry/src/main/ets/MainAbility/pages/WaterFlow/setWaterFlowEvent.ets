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
import { NodeController, FrameNode, typeNode } from '@ohos.arkui.node';
import {
  Entry,Color,OnScrollFrameBeginHandlerResult,
  Component,
  Scroller,
  ScrollState,
  Column,
  ClickEvent,
  Button,
  FlexDirection,
  WaterFlow,
  LazyForEach,
  ColumnOptions,
  FlowItem,
  Padding,
  Text,
  BarState,
  TextAlign,
  Builder,
  FontWeight,
  UIContext,
  wrapBuilder,
  ScrollResult,
  ScrollSource,
  UIWaterFlowEvent,
  EdgeEffect,NodeContainer
} from '@ohos.arkui.component';

import { State, LocalStorage } from '@ohos.arkui.stateManagement';


let para: Record<string, Any> = { 'WaterFlow_setOnWillScroll': 'start', 'WaterFlow_setOnDidScroll': 'start' };
let storage: LocalStorage = new LocalStorage(para);
let para1: Record<string, Any> = { 'WaterFlow_setOnReachStart': 'start', 'WaterFlow_setOnReachEnd': 'start' };
let storage1: LocalStorage = new LocalStorage(para1);
let para2: Record<string, Any> = { 'WaterFlow_setOnScrollStart': 'start', 'WaterFlow_setOnScrollStop': 'start' };
let storage2: LocalStorage = new LocalStorage(para2);
let para3: Record<string, Any> =
  { 'WaterFlow_setOnScrollFrameBegin': 'start', 'WaterFlow_setOnScrollIndex': 'start' };
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
    let listEvent: UIWaterFlowEvent | undefined = typeNode.getWaterFlowEvent(frameNode);
    listEvent?.setOnWillScroll((scrollOffset: Double, scrollState: ScrollState, scrollSource: ScrollSource)=>{
      storage.set('WaterFlow_setOnWillScroll', 'setOnWillScroll');
      console.log(`WaterFlow:: setOnWillScroll scrollOffset=${scrollOffset}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
    })
    listEvent?.setOnDidScroll((scrollOffset: Double, scrollState: ScrollState)=>{
      storage.set('WaterFlow_setOnDidScroll', 'setOnDidScroll');
      console.log(`WaterFlow:: setOnDidScroll scrollOffset=${scrollOffset}, scrollState=${scrollState}`)
    })
    listEvent?.setOnReachStart(()=>{
      storage1.set('WaterFlow_setOnReachStart', 'setOnReachStart');
      console.log(`WaterFlow:: setOnReachStart`)
    })
    listEvent?.setOnReachEnd(()=>{
      storage1.set('WaterFlow_setOnReachEnd', 'setOnReachEnd');
      console.log(`WaterFlow:: setOnReachEnd`)
    })
    listEvent?.setOnScrollStart(()=>{
      storage2.set('WaterFlow_setOnScrollStart', 'setOnScrollStart');
      console.log(`WaterFlow:: setOnScrollStart`)
    })
    listEvent?.setOnScrollStop(()=>{
      storage2.set('WaterFlow_setOnScrollStop', 'setOnScrollStop');
      console.log(`WaterFlow:: setOnScrollStop`)
    })
    listEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
      storage3.set('WaterFlow_setOnScrollFrameBegin', 'setOnScrollFrameBegin');
      console.log(`WaterFlow:: setOnScrollFrameBegin offset=${offset}, state=${state}`)
      return {offsetRemain: offset};
    })
    listEvent?.setOnScrollIndex((first: Int, last: Int)=>{
      storage3.set('WaterFlow_setOnScrollIndex', 'setOnScrollIndex');
      console.log(`WaterFlow:: setOnScrollIndex start=${first}, end=${last}`)
    })
  }
}

@Entry
@Component
struct setOnWaterFlowIndex04 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: int = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';

  build() {
    Column() {
      Button('add CommonEvent to Text')
        .id('WaterFlow_addCommonEvent_04')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling() !)
        })
      Text(this.text).id('WaterFlow_setOnWill_04')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text = storage.get('WaterFlow_setOnWillScroll') + '_' + storage.get('WaterFlow_setOnDidScroll') + '';
        })
      Text(this.text1).id('WaterFlow_setOnReach_04')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text1 = storage1.get('WaterFlow_setOnReachStart') + '_' + storage1.get('WaterFlow_setOnReachEnd') + '';
        })
      Text(this.text2).id('WaterFlow_setOnScroll_04')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text2 = storage2.get('WaterFlow_setOnScrollStart') + '_' + storage2.get('WaterFlow_setOnScrollStop');
        })
      Text(this.text3).id('WaterFlow_setOnScrollIndex_04')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text3 = storage3.get('WaterFlow_setOnScrollFrameBegin') + '_' + storage3.get('WaterFlow_setOnScrollIndex');
        })
      WaterFlow() {
        FlowItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        FlowItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        FlowItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
      }
      .height('50%')
      .id('key_WaterFlow_set')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOff: Double, scrollState: ScrollState, scrollSource: ScrollSource): ScrollResult  => {
        console.log(`WaterFlow:: onWillScroll 1 scrollOff=${scrollOff}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((scrollOff: Double, scrollState: ScrollState): void => {
        console.log(`WaterFlow:: onDidScroll 1  scrollOff=${scrollOff}, scrollState=${scrollState}`)
      })
      .onReachStart((): void => {
        console.log(`WaterFlow:: onReachStart 1 `)
      })
      .onReachEnd((): void => {
        console.log(`WaterFlow:: onReachEnd 1 `)
      })
      .onScrollStart((): void => {
        console.log(`WaterFlow:: onScrollStart 1 `)
      })
      .onScrollStop(() => {
        console.log(`WaterFlow:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((off: Double, state: ScrollState): OnScrollFrameBeginHandlerResult => {
        console.log(`WaterFlow:: onScrollFrameBegin 1 off=${off}, state=${state}`)
       return {offsetRemain: off};
      })
      .onScrollIndex((first: int, last: int): void => {
        console.log(`WaterFlow:: onScrollIndex 1 start=${first}, end=${last}`)
      })
      NodeContainer(this.myNodeController)
    }.width('100%')
  }
}