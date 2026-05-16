'use static'
import { Entry, Text, Column, Component, Button, ClickEvent, UIContext } from '@ohos.arkui.component'
import { State, PropRef, Link, Provide, Consume, StorageLink, LocalStorageLink, Observed, ObjectLink } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { NodeContent } from '@ohos.arkui.node'

class Data {
  code: number;
  constructor(code: number) {
    this.code = code;
  }
}

@Observed
class Info {
  count: number;
  constructor(count: number) {
    this.count = count;
  }
}

@Entry
@Component
struct Index {
  @State stateVar: string = 'state var';
  message: string = 'var';

  build() {
    Column(undefined) {
      Text('Hello World').fontSize(20)
      Button(this.message).backgroundColor('#FFFF00FF')
      .id('click')
      .onClick((e:ClickEvent)=>{
        let uiContext: UIContext = this.getUIContext();
        uiContext.setUIStates(()=>{
          this.stateVar += "~"
          console.log(" UI状态更新完成！")
        });
      })
      Text(this.stateVar).id('text').fontSize(20)
    }
  }
}