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
  @State dragItem: number = -1
  @State dragMove:boolean = false;

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
      .backgroundColor(Color.Blue)
      .onItemDragStart((event: ItemDragInfo) => {
        console.log('xxx onItemDragStart')
        this.dragMove = true;
        return ()=>{this.pixelMapBuilder()}
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: Int, insertIndex: Int, isSuccess: boolean) => {
        console.log('xxx onItemDrop')
      })
      .onItemDragMove(this.isChange ? (event: ItemDragInfo, itemIndex: Int, insertIndex: Int) => {
        console.log('xxx onItemDragMove')
        if(this.dragMove){
          this.text += '1';
        }
        this.dragMove = false;
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