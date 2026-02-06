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
    this.rootNode.commonAttribute.width(100)
      .height(100)
      .backgroundColor(Color.Pink);
    return this.rootNode;
  }

  addCommonEvent(frameNode: FrameNode) {
    let listEvent: UIScrollEvent | undefined = typeNode.getEvent(frameNode, 'Scroll');
    listEvent?.setOnWillScroll((scrollOffx: number, scrollOffy: number, 
      scrollState: ScrollState, scrollSource: ScrollSource)=>{
      storage.set('Scroll_setOnWillScroll', 'setOnWillScroll');
      console.log(`Scroll:: onWillScroll scrollOffx=${scrollOffx}, scrollOffy=${scrollOffy},
        scrollState=${scrollState}, scrollSource=${scrollSource}`)
    })
    listEvent?.setOnDidScroll((xOffset: number, yOffset: number, scrollState: ScrollState)=>{
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
    listEvent?.setOnScrollFrameBegin((offset: number, state: ScrollState) => {
      storage3.set('Scroll_setOnScrollFrameBegin', 'setOnScrollFrameBegin');
      console.log(`Scroll:: setOnScrollFrameBegin offset=${offset}, state=${state}`)
      return undefined;
    })
  }
}

@Entry
@Component
struct setOnScrollIndex03 {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: number = 0;
  @State text: string = 'start';
  @State text1: string = 'start';
  @State text2: string = 'start';
  @State text3: string = 'start';

  build() {
    Column() {
      Button('add CommonEvent to Text')
        .id('Scroll_addCommonEvent_03')
        .height('5%')
        .onClick(() => {
          this.myNodeController!.addCommonEvent(this.myNodeController!.rootNode!.getParent()!.getPreviousSibling() !)
        })
      Text(this.text).id('Scroll_setOnWill_03')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text = storage.get('Scroll_setOnWillScroll') as string + '_' + storage.get('Scroll_setOnDidScroll') as string + '';
        })
      Text(this.text1).id('Scroll_setOnReach_03')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text1 = storage1.get('Scroll_setOnReachStart') as string + '_' + storage1.get('Scroll_setOnReachEnd') as string + '';
        })
      Text(this.text2).id('Scroll_setOnScroll_03')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text2 = storage2.get('Scroll_setOnScrollStart') as string + '_' + storage2.get('Scroll_setOnScrollStop') as string;
        })
      Text(this.text3).id('Scroll_setOnFrameBegin_03')
        .height('5%')
        .fontWeight(700).fontColor(Color.Green)
        .onClick(() => {
          this.text3 = storage3.get('Scroll_setOnScrollFrameBegin') as string
        })
      Scroll(){
        Column(){
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
      }.height('50%')
      .id('key_ScrollItem_set')
      .edgeEffect(EdgeEffect.None)
      .onWillScroll((scrollOffx: number, scrollOffy: number, scrollState: ScrollState, scrollSource: ScrollSource)=>{
        console.log(`Scroll:: onWillScroll 1 scrollOffx=${scrollOffx}, scrollOffy=${scrollOffy}scrollState=${scrollState}, scrollSource=${scrollSource}`)
      })
      .onDidScroll((scrollOff: number, scrollState: ScrollState)=>{
        console.log(`Scroll:: onDidScroll 1  scrollOff=${scrollOff}, scrollState=${scrollState}`)
      })
      .onReachStart(()=>{
        console.log(`Scroll:: onReachStart 1 `)
      })
      .onReachEnd(()=>{
        console.log(`Scroll:: onReachEnd 1 `)
      })
      .onScrollStart(()=>{
        console.log(`Scroll:: onScrollStart 1 `)
      })
      .onScrollStop(()=>{
        console.log(`Scroll:: onScrollStop 1 `)
      })
      .onScrollFrameBegin((off: number, state: ScrollState) => {
        console.log(`Scroll:: onScrollFrameBegin 1 off=${off}, state=${state}`)
        return undefined;
      })
      NodeContainer(this.myNodeController)
    }.width('100%')
  }
}