'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Entry, Component, Column, Text, List, ListItem, ListItemGroup, Scroll, Grid, GridItem, Scroller, WaterFlow, FlowItem, TextInput, TextArea, Swiper, SwiperController, TextController, TextInputController, TextAreaController } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct FrameNodeIndex {
  private scroller: Scroller = new Scroller();
  private swiperCtrl: SwiperController = new SwiperController();

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] FrameNodeIndex error ' + error); }
  }

  build() {
    Scroll() {
      Column() {
        Text('FrameNode Test').key('frameNodeRoot').id('frameNodeRoot').fontSize(20)
        List({ scroller: this.scroller }) {
          ListItemGroup() {
            ListItem() { Text('Item1') }
          }
          ListItem() { Text('Item2') }
        }.key('frameNodeList').id('frameNodeList').width('100%').height('15%')

        Scroll() {
          Column() { Text('ScrollContent') }
        }.key('frameNodeScroll').id('frameNodeScroll').width('100%').height('10%')

        Grid() {
          GridItem() { Text('G1') }
          GridItem() { Text('G2') }
        }.key('frameNodeGrid').id('frameNodeGrid').columnsTemplate('1fr 1fr').width('100%').height('10%')

        WaterFlow() {
          FlowItem() { Text('W1') }
          FlowItem() { Text('W2') }
        }.key('frameNodeWaterFlow').id('frameNodeWaterFlow').width('100%').height('10%')

        Text('TextNode').key('frameNodeText').id('frameNodeText')
        TextInput({ placeholder: 'input' }).key('frameNodeTextInput').id('frameNodeTextInput').width('100%').height('5%')
        TextArea({ placeholder: 'area' }).key('frameNodeTextArea').id('frameNodeTextArea').width('100%').height('5%')
        Swiper(this.swiperCtrl) {
          Text('S1')
          Text('S2')
        }.key('frameNodeSwiper').id('frameNodeSwiper').width('100%').height('10%')
      }.width('100%')
    }.width('100%').height('100%')
  }
}
