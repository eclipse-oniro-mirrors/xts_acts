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
  ListItemAlign,
  AttributeModifier,
  ListAttribute
} from '@ohos.arkui.component';
import { State, Observed, Track } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import { MyDataSource } from './MyDataSource'

@Observed
export class MyModifier implements AttributeModifier<ListAttribute> {
  @Track public isCachedCount: boolean = true;
  @Track public isCachedIsShown: boolean = true;
  @Track public isMaintainVisibleContentPosition: boolean = true;

  applyNormalAttribute(instance: ListAttribute): void {
    instance
      .cachedCount(this.isCachedCount ? 2 : undefined, this.isCachedIsShown ? true : undefined)
      .maintainVisibleContentPosition(this.isMaintainVisibleContentPosition ? true : undefined)
  }
}


@Entry
@Component
struct ListEventPage1 {
  public arr: MyDataSource<Int> = new MyDataSource<Int>();
  @State message: string = 'Hello World';
  @State myModifier: MyModifier = new MyModifier();

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
        .attributeModifier(this.myModifier)
        .width('100%')
        .height('65%')
        .id('MyListModifier')

        Blank().height('5vp')
        Button('isCachedCount: ' + this.myModifier.isCachedCount)
          .id('ListModifier_CachedCount')
          .onClick((e: ClickEvent) => {
            this.myModifier.isCachedCount = !this.myModifier.isCachedCount
          })
        Button('isCachedIsShown: ' + this.myModifier.isCachedIsShown)
          .id('List_cachedIsShown')
          .onClick((e: ClickEvent) => {
            this.myModifier.isCachedIsShown = !this.myModifier.isCachedIsShown
          })
        Button('isMaintainVisibleContentPosition: ' + this.myModifier.isMaintainVisibleContentPosition)
          .id('List_maintainVisibleContentPosition')
          .onClick((e: ClickEvent) => {
            this.myModifier.isMaintainVisibleContentPosition = !this.myModifier.isMaintainVisibleContentPosition
          })
      }

    }
    .width('100%').height('100%')
  }
}