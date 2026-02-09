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
import { FrameNode, NodeController, typeNode } from '@ohos.arkui.node';
import {
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  EdgeEffect,
  Entry,
  List,
  ListItem,
  NodeContainer,
  OnScrollFrameBeginHandlerResult,
  ScrollResult,
  ScrollSource,
  ScrollState,
  Text,
  UIListEvent,
  VisibleListContentInfo
} from '@ohos.arkui.component';
import { State, LocalStorage } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

let para: Record<string, string> = { 'List_setOnWillScroll': 'start', 'List_setOnDidScroll': 'start' };
let storage: LocalStorage = new LocalStorage(para);
let para1: Record<string, string> = { 'List_setOnReachStart': 'start', 'List_setOnReachEnd': 'start' };
let storage1: LocalStorage = new LocalStorage(para1);
let para2: Record<string, string> = { 'List_setOnScrollStart': 'start', 'List_setOnScrollStop': 'start' };
let storage2: LocalStorage = new LocalStorage(para2);
let para3: Record<string, string> = { 'List_setOnScrollFrameBegin': 'start', 'List_setOnScrollIndex': 'start' };
let storage3: LocalStorage = new LocalStorage(para3);
let para4: Record<string, string> = { 'List_setOnVisibleContentChange': 'start' };
let storage4: LocalStorage = new LocalStorage(para4);

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
    let listEvent: UIListEvent | undefined = typeNode.getListEvent(frameNode);
    listEvent?.setOnWillScroll((scrollOffset: Double, scrollState: ScrollState, scrollSource: ScrollSource)=>{
      storage.set('List_setOnWillScroll', 'setOnWillScroll');
      console.log(`List:: setOnWillScroll scrollOffset=${scrollOffset}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
    })
    listEvent?.setOnDidScroll((scrollOffset: Double, scrollState: ScrollState)=>{
      storage.set('List_setOnDidScroll', 'setOnDidScroll');
      console.log(`List:: setOnDidScroll scrollOffset=${scrollOffset}, scrollState=${scrollState}`)
    })
    listEvent?.setOnReachStart(()=>{
      storage1.set('List_setOnReachStart', 'setOnReachStart');
      console.log(`List:: setOnReachStart`)
    })
    listEvent?.setOnReachEnd(()=>{
      storage1.set('List_setOnReachEnd', 'setOnReachEnd');
      console.log(`List:: setOnReachEnd`)
    })
    listEvent?.setOnScrollStart(()=>{
      storage2.set('List_setOnScrollStart', 'setOnScrollStart');
      console.log(`List:: setOnScrollStart`)
    })
    listEvent?.setOnScrollStop(()=>{
      storage2.set('List_setOnScrollStop', 'setOnScrollStop');
      console.log(`List:: setOnScrollStop`)
    })
    listEvent?.setOnScrollFrameBegin((offset: Double, state: ScrollState) => {
      storage3.set('List_setOnScrollFrameBegin', 'setOnScrollFrameBegin');
      console.log(`List:: setOnScrollFrameBegin offset=${offset}, state=${state}`)
       return {offsetRemain: offset};
    })
    listEvent?.setOnScrollIndex((start: Int, end: Int, center: Int)=>{
      storage3.set('List_setOnScrollIndex', 'setOnScrollIndex');
      console.log(`List:: setOnScrollIndex start=${start}, end=${end}, center=${center}`)
    })
    listEvent?.setOnScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo)=>{
      storage4.set('List_setOnVisibleContentChange', 'setOnScrollVisibleContentChange');
      console.log(`List:: setOnScrollVisibleContentChange start=${JSON.stringify(start)}, end=${JSON.stringify(end)}`)
    })
  }

  resetEvent(frameNode: FrameNode) {
    let listEvent: UIListEvent | undefined = typeNode.getListEvent(frameNode);
    listEvent?.setOnWillScroll(undefined)
    listEvent?.setOnDidScroll(undefined)
    listEvent?.setOnReachStart(undefined)
    listEvent?.setOnReachEnd(undefined)
    listEvent?.setOnScrollStart(undefined)
    listEvent?.setOnScrollStop(undefined)
    listEvent?.setOnScrollFrameBegin(undefined)
    listEvent?.setOnScrollIndex(undefined)
    listEvent?.setOnScrollVisibleContentChange(undefined)
  }
}

@Entry
@Component
struct setOnListIndex02 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: int = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';
  @State text4: string = 'start';

  build() {
    Column() {
      Button('reset CommonEvent to List')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myNodeController!.resetEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling() !)
        })
      Button('add CommonEvent to List')
        .id('List_addCommonEvent_02')
        .height('5%')
        .onClick((e: ClickEvent) => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling()!)
        })
      Text(this.text)
        .id('List_setOnWill_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text = storage.get<string>('List_setOnWillScroll') as string + '_' + storage.get<string>('List_setOnDidScroll') as string + '';
        })
      Text(this.text1)
        .id('List_setOnReach_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text1 = storage1.get<string>('List_setOnReachStart') as string + '_' + storage1.get<string>('List_setOnReachEnd') as string + '';
        })
      Text(this.text2)
        .id('List_setOnScroll_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text2 = storage2.get<string>('List_setOnScrollStart') as string + '_' + storage2.get<string>('List_setOnScrollStop') as string;
        })
      Text(this.text3)
        .id('List_setOnScrollIndex_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text3 = storage3.get<string>('List_setOnScrollFrameBegin') as string + '_' + storage3.get<string>('List_setOnScrollIndex') as string;
        })
      Text(this.text4)
        .id('Scroll_VisibleChange_02')
        .height('5%')
        .fontWeight(700)
        .fontColor(Color.Green)
        .onClick((e: ClickEvent) => {
          this.text4 = storage4.get<string>('List_setOnVisibleContentChange') as string
        })
      List() {
        ListItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        ListItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        ListItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
      }
      .height('50%')
      .id('key_listItem_set')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOff: Double, scrollState: ScrollState, scrollSource: ScrollSource): ScrollResult => {
        console.log(`List:: onWillScroll 1 scrollOff=${scrollOff}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((scrollOff: Double, scrollState: ScrollState) => {
        console.log(`List:: onDidScroll 1  scrollOff=${scrollOff}, scrollState=${scrollState}`)
      })
      .onReachStart(() => {
        console.log(`List:: onReachStart 1 `)
      })
      .onReachEnd(() => {
        console.log(`List:: onReachEnd 1 `)
      })
      .onScrollStart(() => {
        console.log(`List:: onScrollStart 1 `)
      })
      .onScrollStop(() => {
        console.log(`List:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((off: Double, state: ScrollState): OnScrollFrameBeginHandlerResult => {
        console.log(`List:: onScrollFrameBegin 1 off=${off}, state=${state}`)
        return { offsetRemain: 0 } as OnScrollFrameBeginHandlerResult;
      })
      .onScrollIndex((start: int, end: int, center: int) => {
        console.log(`List:: onScrollIndex 1 start=${start}, end=${end}, center=${center}`)
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        console.log(`List:: onScrollVisibleContentChange 1 start=${start}, end=${end}`)
      })

      NodeContainer(this.myNodeController)
    }.width('100%')
  }
}