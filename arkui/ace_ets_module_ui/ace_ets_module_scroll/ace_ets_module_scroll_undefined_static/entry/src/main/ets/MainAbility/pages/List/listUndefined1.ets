'use static'
import {
  Entry,
  Text,
  Column,
  Component,
  Button,
  ClickEvent,
  Color,
  TextAlign,
  ForEach,
  LazyForEach,
  Row,
  Blank,
  Scroll,
  CommonMethod,
  ListDividerOptions,
  List,
  ListItem,
  Axis,
  ListItemAlign
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { MyDataSource } from './MyDataSource'

@Entry
@Component
struct ListEventPage1 {
  private arr: MyDataSource<Int> = new MyDataSource<Int>();
  @State message: string = 'Hello World';
  @State isCachedCount: boolean = true;
  @State isCachedIsShown: boolean = true;
  @State isMaintainVisibleContentPosition: boolean = true;

  build() {
    Scroll() {
      Column() {
        List({ space: 12, initialIndex: 0 }) {
          LazyForEach(this.arr, (item: Int, index: Int) => {
            ListItem() {
              Column() {
                Text('N' + item).fontSize(12).height('16')
              }
            }
            .width('100%')
            .height('40vp')
            .backgroundColor('#c386e5dd')
          })
        }
        .border({ width: 3, color: Color.Red })
        .cachedCount(this.isCachedCount ? 2 : undefined, this.isCachedIsShown ? true : undefined)
        .maintainVisibleContentPosition(this.isMaintainVisibleContentPosition ? true : undefined)
        .width('100%')
        .height('65%')
        .id('MyList')

        Blank().height('5vp')
        Button('isCachedCount: ' + this.isCachedCount)
          .id('List_CachedCount')
          .onClick((e: ClickEvent) => {
            this.isCachedCount = !this.isCachedCount
          })
        Button('isCachedIsShown: ' + this.isCachedIsShown)
          .id('List_cachedIsShown')
          .onClick((e: ClickEvent) => {
            this.isCachedIsShown = !this.isCachedIsShown
          })
        Button('isMaintainVisibleContentPosition: ' + this.isMaintainVisibleContentPosition)
          .id('List_maintainVisibleContentPosition')
          .onClick((e: ClickEvent) => {
            this.isMaintainVisibleContentPosition = !this.isMaintainVisibleContentPosition
          })
      }

    }
    .width('100%').height('100%')
  }
}