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

import { inspector } from '@kit.ArkUI';
@Entry
@Component
struct TextTimerExample {
  @State message1: string = '';
  @State message2: string = '';
  @State Text_w_1: number = 100;
  @State Text_A_1: number = 0;

  onDrawChildren1:(childIds: number[])=>void=(childIds: number[]):void=>{
    this.message1 += ', id: ' + JSON.stringify(childIds[0]);
    console.log('neuTest1: onDrawComplete: ' + JSON.stringify(childIds));
  }
  onDrawChildren2:(childIds: number[])=>void=(childIds: number[]):void=>{
    this.message2 += ', id: ' + JSON.stringify(childIds[0]);
    console.log('neuTest2: onDrawComplete: ' + JSON.stringify(childIds));
  }
  build() {
    Column({ space: 8 }) {
        Column(){
          Column(){
            Text('text1')
              .width(this.Text_w_1)
              .border({ width: 1 })
              .rotate({
                angle: 0,
              }).id('Text1')
          }.id('Column1').borderWidth(1)

          Column(){
            Text('text2').width(100)
              .border({ width: 1 })
              .rotate({
              angle: this.Text_A_1,
            }).id('Text2')
          }.id('Column2')
        }
        Column(){
          Text('text1尺寸' + this.message1).onClick(() => {
            this.message1 = '';
            this.Text_w_1 += 10;
          }).id('Button1')
          Text('text2旋转' + this.message2).onClick(() => {
             this.message2 = '';
            this.Text_A_1 += 90;
          }).id('Button2')
          Text('text1off' + this.message1).onClick(() => {
            this.message1 = '';
            this.listener1.offDrawChildren(this.onDrawChildren1);
            this.Text_w_1 += 10;
          }).id('Button3')
        }
    }
  }
  listener1: inspector.ComponentObserver = inspector.createComponentObserver('Column1');
  listener2: inspector.ComponentObserver = inspector.createComponentObserver('Column2');
  aboutToAppear() {
    this.listener1.onDrawChildren(this.onDrawChildren1);
    try {
      this.listener1.onDrawChildren(undefined);
    } catch (e) {
      console.log('Incorrect arguments: ' + e);
    }
    this.listener2.onDrawChildren(this.onDrawChildren2);
    try {
      this.listener2.onDrawChildren(null);
    } catch (e) {
      console.log('Incorrect arguments: ' + e);
    }
  }
}