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


import { Entry, Component, Column, Image, Button, Edges, $r, ClickEvent, LocalizedEdges,
  Flex, FlexDirection, ItemAlign, FlexAlign, Text, FontWeight, ColumnOptions } from '@ohos.arkui.component'
import inspector from '@ohos.arkui.inspector'
import { State } from '@ohos.arkui.stateManagement';
import { UIInspector } from '@ohos.arkui.UIContext';

// import { inspector, UIInspector } from '@kit.ArkUI';
@Entry
@Component
struct TextTimerExample {
  @State message1: string = '';
  @State message2: string = '';
  @State Text_w_1: number = 100;
  @State Text_A_1: number = 0;

  onDrawChildren1:()=>void=():void=>{
    this.message1 += 'ok';
    console.log('neuTest1: onDrawComplete');
  }
  onDrawChildren2:()=>void=():void=>{
    this.message2 += 'ok';
    console.log('neuTest2: onDrawComplete');
  }
  build() {
    Column({ space: 8 } as ColumnOptions) {
        Column(){
          Column(){
            Text('text1')
              .width(this.Text_w_1)
              .border({ width: 1 })
              .rotate({
                angle: 0,
              })
          }.id('Column1').borderWidth(1)

          Column(){
            Text('text2').width(100)
              .border({ width: 1 })
              .rotate({
              angle: this.Text_A_1,
            })
          }.id('Column2')
        }
        Column(){
          Text('text1尺寸' + this.message1).onClick((e:ClickEvent) => {
            this.Text_w_1 += 10;
          }).id('Button1')
          Text('text2旋转' + this.message2).onClick((e:ClickEvent) => {
            this.Text_A_1 += 90;
          }).id('Button2')
          Text('text1off' + this.message1).onClick((e:ClickEvent) => {
            this.listener1.offDrawChildren(this.onDrawChildren1);
            this.Text_w_1 += 10;
          }).id('Button3')
        }
    }
  }
  uiInspector:UIInspector = this.getUIContext().getUIInspector();
  listener1:inspector.ComponentObserver = this.uiInspector.createComponentObserver("Column1") as inspector.ComponentObserver;
  listener2:inspector.ComponentObserver = this.uiInspector.createComponentObserver("Column2") as inspector.ComponentObserver;
  // listener1: inspector.ComponentObserver = inspector.createComponentObserver('Column1');
  // listener2: inspector.ComponentObserver = inspector.createComponentObserver('Column2');
  aboutToAppear() {
    this.listener1.onDrawChildren( this.onDrawChildren1);
    this.listener2.onDrawChildren( this.onDrawChildren2);
  }
}