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

let para: Record<string, string> = { 'Grid_setOnWillScroll': 'start', 'Grid_setOnDidScroll': 'start' };
let storage: LocalStorage = new LocalStorage(para);
let para1: Record<string, string> = { 'Grid_setOnReachStart': 'start', 'Grid_setOnReachEnd': 'start' };
let storage1: LocalStorage = new LocalStorage(para1);
let para2: Record<string, string> = { 'Grid_setOnScrollStart': 'start', 'Grid_setOnScrollStop': 'start' };
let storage2: LocalStorage = new LocalStorage(para2);
let para3: Record<string, string> = { 'Grid_setOnScrollFrameBegin': 'start', 'Grid_setOnScrollIndex': 'start' };
let storage3: LocalStorage = new LocalStorage(para3);

class MyNodeController extends NodeController {
  public rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    let listEvent: UIGridEvent | undefined = typeNode.getEvent(frameNode, 'Grid');
    listEvent?.setOnWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource)=>{
      storage.set('Grid_setOnWillScroll', 'setOnWillScroll');
      console.log(`Grid:: setOnWillScroll scrollOffset=${scrollOffset}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
    })
    listEvent?.setOnDidScroll((scrollOffset: number, scrollState: ScrollState)=>{
      storage.set('Grid_setOnDidScroll', 'setOnDidScroll');
      console.log(`Grid:: setOnDidScroll scrollOffset=${scrollOffset}, scrollState=${scrollState}`)
    })
    listEvent?.setOnReachStart(()=>{
      storage1.set('Grid_setOnReachStart', 'setOnReachStart');
      console.log(`Grid:: setOnReachStart`)
    })
    listEvent?.setOnReachEnd(()=>{
      storage1.set('Grid_setOnReachEnd', 'setOnReachEnd');
      console.log(`Grid:: setOnReachEnd`)
    })
    listEvent?.setOnScrollStart(()=>{
      storage2.set('Grid_setOnScrollStart', 'setOnScrollStart');
      console.log(`Grid:: setOnScrollStart`)
    })
    listEvent?.setOnScrollStop(()=>{
      storage2.set('Grid_setOnScrollStop', 'setOnScrollStop');
      console.log(`Grid:: setOnScrollStop`)
    })
    listEvent?.setOnScrollFrameBegin((offset: number, state: ScrollState) => {
      storage3.set('Grid_setOnScrollFrameBegin', 'setOnScrollFrameBegin');
      console.log(`Grid:: setOnScrollFrameBegin offset=${offset}, state=${state}`)
      return undefined;
    })
    listEvent?.setOnScrollIndex((first: number, last: number)=>{
      storage3.set('Grid_setOnScrollIndex', 'setOnScrollIndex');
      console.log(`Grid:: setOnScrollIndex start=${first}, end=${last}`)
    })
  }
}

@Entry
@Component
struct setOnGridIndex01 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: number = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';

  build() {
    Column() {
      Button('add CommonEvent to Text')
        .id('Grid_addCommonEvent_01')
        .height('5%')
        .onClick(() => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling() !)
        })
      Text(this.text).id('Grid_setOnWill_01')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text = storage.get('Grid_setOnWillScroll') as string + '_' + storage.get('Grid_setOnDidScroll') as string + '';
        })
      Text(this.text1).id('Grid_setOnReach_01')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text1 = storage1.get('Grid_setOnReachStart') as string + '_' + storage1.get('Grid_setOnReachEnd') as string + '';
        })
      Text(this.text2).id('Grid_setOnScroll_01')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text2 = storage2.get('Grid_setOnScrollStart') as string + '_' + storage2.get('Grid_setOnScrollStop') as string;
        })
      Text(this.text3).id('Grid_setOnScrollIndex_01')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text3 = storage3.get('Grid_setOnScrollFrameBegin') as string + '_' + storage3.get('Grid_setOnScrollIndex') as string;
        })
      Grid(){
        GridItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        GridItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
        GridItem()
          .borderWidth(2)
          .width('100%')
          .height('50%')
      }.height('50%')
      .id('key_gridItem_set')
      .columnsTemplate('1r')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOff: number, scrollState: ScrollState, scrollSource: ScrollSource)=>{
        console.log(`Grid:: onWillScroll 1 scrollOff=${scrollOff}, scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((scrollOff: number, scrollState: ScrollState)=>{
        console.log(`Grid:: onDidScroll 1  scrollOff=${scrollOff}, scrollState=${scrollState}`)
      })
      .onReachStart(()=>{
        console.log(`Grid:: onReachStart 1 `)
      })
      .onReachEnd(()=>{
        console.log(`Grid:: onReachEnd 1 `)
      })
      .onScrollStart(()=>{
        console.log(`Grid:: onScrollStart 1 `)
      })
      .onScrollStop(()=>{
        console.log(`Grid:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((off: number, state: ScrollState) => {
        console.log(`Grid:: onScrollFrameBegin 1 off=${off}, state=${state}`)
        return undefined;
      })
      .onScrollIndex((first: number, last: number)=>{
        console.log(`Grid:: onScrollIndex 1 start=${first}, end=${last}`)
      })
      NodeContainer(this.myNodeController)
    }.width('100%')
  }
}
