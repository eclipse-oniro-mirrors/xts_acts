/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {MessageManager,Callback} from '../../utils/MessageManager';

@Styles function itemStyle () {
  .width(336)
  .height(621)
  .margin({ top: 48, left: 12 })
  .borderRadius(24)
  .backgroundColor('#FFFFFF')
}

@Extend(Text) function itemTextStyle () {
  .fontColor('#182431')
  .fontSize(36)
  .fontWeight(500)
  .opacity(0.4)
  .margin({ top: 82, bottom: 40 })
}

@Entry
@Component
struct StepperExample {
  @State currentIndex: number = 0
  @State firstState: ItemState = ItemState.Normal
  @State secondState: ItemState = ItemState.Normal
  @State thirdState: ItemState = ItemState.Normal
  @State nextLabel:string = "下一步"
  @State prevLabel:string = "返回"
  @State testState:ItemState = ItemState.Normal
  
  messageManager:MessageManager = new MessageManager()

  onPageShow() {
    console.info('stepper onPageShow')
    globalThis.value = {
      name:'messageManager',message:this.messageManager
    }
    let callback:Callback = (message:any) => {
      console.error('message = ' + message.name + "--" + message.value)
      if (message.name == 'nextLabel') {
          this.nextLabel = message.value
      }
      if (message.name == 'prevLabel') {
          this.prevLabel = message.value
      }
      if (message.name == 'testState') {
          this.testState = message.value
      }
      if (message.name == 'index') {
          this.currentIndex = message.value
      }
    }
    this.messageManager.registerCallback(callback)
  }


  build() {
    Stepper({
      index: this.currentIndex
    }) {
      // 第一个步骤页
      StepperItem() {
        Column() {
          Text('Page One')
            .itemTextStyle().key('pageOne')
          Button('change status:' + this.firstState)
            .backgroundColor('#007dFF')
            .onClick(() => {
              this.firstState = this.firstState === ItemState.Skip ? ItemState.Normal : ItemState.Skip
            }).key('btStp')
        }.itemStyle()
      }
      .nextLabel('Next')
      .status(this.firstState)
      // 第二个步骤页
      StepperItem() {
        Column() {
          Text('Page Two').key('pageTwo')
            .itemTextStyle()
          Button('change status:' + this.secondState)
            .backgroundColor('#007dFF')
            .onClick(() => {
              this.secondState = this.secondState === ItemState.Disabled ? ItemState.Normal : ItemState.Disabled
            })
        }.itemStyle()
      }
      .nextLabel(this.nextLabel)
      .prevLabel(this.prevLabel)
      .status(this.testState).key('stepperTwo')
      // 第三个步骤页
      StepperItem() {
        Column() {
          Text('Page Three').key('pageThree')
            .itemTextStyle()
          Button('change status:' + this.thirdState)
            .backgroundColor('#007dFF')
            .onClick(() => {
              this.thirdState = this.thirdState === ItemState.Waiting ? ItemState.Normal : ItemState.Waiting
            })
        }.itemStyle().key('stepperThree')
      }
      .status(this.thirdState)
      // 第四个步骤页
      StepperItem() {
        Column() {
          Text('Page Four').key('pageFour')
            .itemTextStyle()
        }.itemStyle()
      }
    }
    .backgroundColor('#F1F3F5')
    .onFinish(() => {
      // 此处可处理点击最后一页的Finish时的逻辑，例如路由跳转等
      console.info('onFinish')
      this.currentIndex = 0
    })
    .onSkip(() => {
      // 此处可处理点击跳过时的逻辑，例如动态修改Stepper的index值使其跳转到某一步骤页等
      console.info('onSkip')
      this.currentIndex = 2
    })
    .onChange((prevIndex: number, index: number) => {
       this.currentIndex = index
    })
    .onNext((index:number,pendingIndex:number) => {
        this.currentIndex = pendingIndex
    })
    .onPrevious((index:number,pendingIndex:number) => {
       this.currentIndex = pendingIndex

    }).key('stepkey').width('100%').height('80%')
  }
}