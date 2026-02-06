/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { inspector } from '@kit.ArkUI';

@Entry
@Component
struct ImageExample {
  @State onLayoutText: string = 'off'
  @State imageWidth: number = 20;
  listenerForRootByID: inspector.ComponentObserver = this.getUIContext().getUIInspector().createComponentObserver(9)
  listenerForRow: inspector.ComponentObserver = this.getUIContext().getUIInspector().createComponentObserver('ROW_ID')
  @State ll: Resource | null = $r('app.media.icon');
  @State textString: string = ''
  @State layoutChildrenState: string = 'init'
  @State layoutChildrenState1: string = 'init1'
  @State layoutChildrenState2: string = 'init2'

  onLayoutChildrenCompleteByID: () => void = (): void =>  {
    this.layoutChildrenState1 = this.layoutChildrenState1 +"1"
    console.log('lll onLayoutChildrenComplete')
  }

  onLayoutChildrenCompleteByID1: () => void = (): void =>  {
    this.layoutChildrenState2 = this.layoutChildrenState2 +"1"
    console.log('lll onLayoutChildrenComplete1')
  }

  build() {
    Column() {
      Text(this.layoutChildrenState).id('initid1')
      Text(this.layoutChildrenState1).id('initid2')
      Text(this.layoutChildrenState2).id('initid3')
      Column() {
        Row() {
          Row({ space: 5 }) {
            Text(this.textString).id("Text_ID")
            Image(this.ll)
              .height(20)
              .border({ width: 1 })
              .id('IMAGE_ID')
              .width(this.imageWidth)
          }.id('ROW_ID')
        }.width('100%')

        Column() {
          Button("onLayoutChildrenByID").id("Button1").onClick((event: ClickEvent) => {
            this.listenerForRow.onLayoutChildren(this.onLayoutChildrenCompleteByID);
          })
          Button("onLayoutChildrenByID1").id("Button2").onClick((event: ClickEvent) => {
            this.listenerForRow.onLayoutChildren(this.onLayoutChildrenCompleteByID1);
          })
          Button("offLayoutChildrenByID").id("Button3").onClick((event: ClickEvent) => {
            this.listenerForRow.offLayoutChildren(this.onLayoutChildrenCompleteByID);
            this.layoutChildrenState = 'offLayoutChildrenByID';
            console.info("layoutChildrenState:offLayoutChildrenByID");
          })
          Button("offLayoutChildren()").id("Button4").onClick((event: ClickEvent) => {
            this.listenerForRow.offLayoutChildren();
            this.layoutChildrenState = 'offLayoutChildrencomplete';
          })
          Button("change").id("Button5").onClick((event: ClickEvent) => {
            this.textString = this.textString + '1'
            this.imageWidth += 10;
          })
        }.padding({ top: 30 })

      }.padding({ right: 10, top: 10 }).id('Column_ID')
    }.width('100%')
  }
  aboutToAppear(): void {
    try {
      let listenerForRowByID2: inspector.ComponentObserver = this.getUIContext().getUIInspector().createComponentObserver(2147483648)
      let listenerForRowByID3: inspector.ComponentObserver = this.getUIContext().getUIInspector().createComponentObserver(-2)
    }catch (e) {
      console.log(`eee {e}` + e)
    }

  }
}