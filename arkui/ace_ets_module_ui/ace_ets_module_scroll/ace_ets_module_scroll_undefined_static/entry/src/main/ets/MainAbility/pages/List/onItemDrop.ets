'use static'
import {
  ForEach,
  Entry,
  Component,
  Scroll,
  List,
  TextAlign,
  Column,
  ListItem,
  Text,
  Button,
  Color,
  LazyForEach,
  Stack,
  Row,
  NestedScrollMode,
  Builder,
  ListItemAlign,
  ItemDragInfo
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { MyDataSource } from './MyDataSource';

@Entry
@Component
struct Index {
  @State listArr: string[] = ['1'] as string[];
  @State isChange:boolean = true
  @State text:String = '';

  @Builder
  pixelMapBuilder() {
    Column() {
      Text('123')
        .fontSize(16)
        .width(80)
        .height(80)
        .textAlign(TextAlign.Center)
    }
  }

  aboutToAppear() {
    for (let i = 0; i < 16; i++) {
      this.listArr.push(i + '');
    }
  }

  build() {
    Column() {
      List() {
        ForEach(this.listArr, (item: string) => {
          ListItem() {
            Text(item)
          }
          .width(80)
          .height(80)
          .borderRadius(4)
          .id('List_item' + item)
        }, (item: string) => item)
      }
      .width('100%')
      .height(500)
      .alignListItem(ListItemAlign.Center)
      .onItemDragStart((event: ItemDragInfo) => {
        console.log('xxx onItemDragStart')
        return ()=>{this.pixelMapBuilder()}
      })
      .onItemDrop(this.isChange ? (event: ItemDragInfo, itemIndex: Int, insertIndex: Int, isSuccess: boolean) => {
        console.log('xxx onItemDrop')
        this.text += '1';
      } : undefined)

      Button('Change').onClick(() => {
        this.isChange = !this.isChange;
      })
        .id('changeButton')
      Button(this.text)
        .backgroundColor('#00ff00')
        .id('dragText')
    }
    .width('100%')
    .height('100%')
  }
}