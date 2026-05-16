'use static'

import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  Scroller,
  List,
  ForEach,
  TextAlign,
  ListItem,
  ListItemGroup
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'

@Entry
@Component
struct ListContentSize {
  scrollerForList: Scroller = new Scroller()
  @State arrIndex: int = 10;
  @State editFlag: boolean = false
  @State contentWidth: double = -1;
  @State contentHeight: double = -1;
  private data: number[] = (() => {
    let arr: number[] = [];
    for (let i = 0; i <= 9; i++) {
      arr.push(i);
    }
    return arr;
  })();

  build() {
    Column() {
      Button('GetContentSize')
        .id('GetContentSize')
        .width('20%')
        .height('10%')
        .onClick(() => {
          this.contentWidth = this.scrollerForList.contentSize().width;
          this.contentHeight = this.scrollerForList.contentSize().height;
        })
      List({ scroller: this.scrollerForList }) { //测试点：space
        ForEach(this.data, (i: number) => {
          ListItemGroup() {
            ListItem() {
              Text(`${i}`)
                .width(200)
                .height(100)
            }
          }
        }, (i: number) => i.toString())
      }
      .width(200)
      .height('50%')

      Text('' + this.contentWidth)
        .fontColor(Color.Red)
        .key('ListContentWidth')
      Text('' + this.contentHeight)
        .fontColor(Color.Red)
        .key('ListContentHeight')
    }
  }
}