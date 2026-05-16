'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { ExpandMode } from '@ohos.arkui.node'
import { Entry, Column, Component, Flex, FlexDirection, ItemAlign, FlexAlign, Text, Button, FontWeight, ButtonType, ClickEvent,
  IDataSource,DataOperation,DataChangeListener,Visibility,Scroll,ColumnOptions,Color,List,Row,LazyForEach,ListItem,Margin
} from '@ohos.arkui.component'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';

class BasicDataSource implements IDataSource<string> {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): int {
    return 0;
  }

  public getData(index: int): string {
    return this.originDataArray[index as Int];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index as int);
    })
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index as int);
    })
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index as int);
    })
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from as int, to as int);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

class MyDataSource extends BasicDataSource {
  private dataArray: string[] = [];

  public totalCount(): int {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index as Int];
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index as int, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}


@Entry
@Component
struct lazyForEachTest {
  @State vis: Visibility = Visibility.Visible
  @State isShow: boolean = true
  private data: MyDataSource = new MyDataSource();
  private data1: MyDataSource = new MyDataSource();
  @State arr: string[] = [] as Array<string>;

  @State getChildValue:string = '5'
  @State getFirstChildIndexWithoutExpandValue:string = '1'
  @State getLastChildIndexWithoutExpandValue:string = '9'

  aboutToAppear() {
    for (let i = 0; i <= 10; i++) {
      this.data.pushData(`Hello${i}`)
    }
    for (let i = 0; i <= 10; i++) {
      this.data1.pushData(`TTT${i}`)
    }
    for (let i = 0; i <= 10; i++) {
      this.arr.push(`World${i}`)
    }
  }

  build() {
    Scroll() {
      Column({ space: 15 } as ColumnOptions) {
        Column() {
          Scroll() {
            Column() {
              List({ space: 3 }) {
                LazyForEach(this.data1, (item1: string) => {
                  ListItem() {
                    Row() {
                      Text(item1).fontSize(20).id(item1)
                        .onAppear(() => {
                          console.info('appear:' + item1)
                        })
                    }.margin({ left: 10, right: 10 } as Margin)
                  }.id('LazyForEachListItem_' + item1)
                }, (item1: string) => item1)
              }
              .margin(8)
              .id('LazyForEachList')
              .borderWidth(2)
              .cachedCount(2)
              .height(105)

              Column() {
                Text(this.getChildValue).id('getChildValue').height('3%')
                Text(this.getFirstChildIndexWithoutExpandValue).id('getFirstChildIndexWithoutExpandValue').height('3%')
                Text(this.getLastChildIndexWithoutExpandValue).id('getLastChildIndexWithoutExpandValue').height('3%')
                Row() {
                  Button('EXPAND')
                    .id('button_expand')
                    .width('20%').margin(5).height('3%')
                    .onClick((e:ClickEvent) => {
                      console.info('+++++++++++++++++++++2.1');
                      const uiContext = this.getUIContext();
                      console.info('+++++++++++++++++++++2.2');
                      if (uiContext) {
                        console.info('+++++++++++++++++++++2.3');
                        const frameNode = uiContext.getFrameNodeById('LazyForEachList');
                        console.info('+++++++++++++++++++++2.4');
                        if (frameNode) {
                          console.info('+++++++++++++++++++++2.5');
                          this.getChildValue = frameNode.getChild(3, ExpandMode.EXPAND)?.getId() + ''; //取值是undefined，期望值是LazyForEachListItem_TTT3，断言失败
                          console.info('+++++++++++++++++++++2.6',this.getChildValue);
                          this.getFirstChildIndexWithoutExpandValue = frameNode.getFirstChildIndexWithoutExpand() + ''; //取值是-1，期望值是0，断言失败
                          console.info('+++++++++++++++++++++2.7',this.getFirstChildIndexWithoutExpandValue);
                          this.getLastChildIndexWithoutExpandValue = frameNode.getLastChildIndexWithoutExpand() + '';//取值是-1，期望值是10，断言失败
                          console.info('+++++++++++++++++++++2.8',this.getLastChildIndexWithoutExpandValue);
                        }
                      }
                    })
                  Button('NOT_EXPAND')
                    .id('button_not_expand')
                    .width('20%').margin(5).height('3%')
                    .onClick((e:ClickEvent) => {
                      const uiContext = this.getUIContext();
                      if (uiContext) {
                        const frameNode = uiContext.getFrameNodeById('LazyForEachList');
                        if (frameNode) {
                          this.getChildValue = frameNode.getChild(3, ExpandMode.NOT_EXPAND)?.getId() + '';
                          this.getFirstChildIndexWithoutExpandValue = frameNode.getFirstChildIndexWithoutExpand() + ''; //取值不对
                          this.getLastChildIndexWithoutExpandValue = frameNode.getLastChildIndexWithoutExpand() + '';
                        }
                      }
                    })
                }

                Row() {
                  Button('LAZY_EXPAND')
                    .id('button_lazy_expand')
                    .width('20%').margin(5).height('3%')
                    .onClick((e:ClickEvent) => {
                      const uiContext = this.getUIContext();
                      if (uiContext) {
                        const frameNode = uiContext.getFrameNodeById('LazyForEachList');
                        if (frameNode) {
                          this.getChildValue = frameNode.getChild(3, ExpandMode.LAZY_EXPAND)?.getId() + '';
                          this.getFirstChildIndexWithoutExpandValue = frameNode.getFirstChildIndexWithoutExpand() + '';
                          this.getLastChildIndexWithoutExpandValue = frameNode.getLastChildIndexWithoutExpand() + '';
                        }
                      }
                    })
                  Button('ExpandMode_null')
                    .id('button_expand_null')
                    .width('20%').margin(5).height('3%')
                    .onClick((e:ClickEvent) => {
                      const uiContext = this.getUIContext();
                      if (uiContext) {
                        const frameNode = uiContext.getFrameNodeById('LazyForEachList');
                        if (frameNode) {
                          this.getChildValue = frameNode.getChild(3, undefined)?.getId() + '';
                          this.getFirstChildIndexWithoutExpandValue = frameNode.getFirstChildIndexWithoutExpand() + '';
                          this.getLastChildIndexWithoutExpandValue = frameNode.getLastChildIndexWithoutExpand() + '';
                        }
                      }
                    })
                }

                Row() {
                  Button('ExpandMode_undefined')
                    .id('button_expand_undefined')
                    .width('20%').margin(5).height('3%')
                    .onClick((e:ClickEvent) => {
                      const uiContext = this.getUIContext();
                      if (uiContext) {
                        const frameNode = uiContext.getFrameNodeById('LazyForEachList');

                        if (frameNode) {
                          this.getChildValue = frameNode.getChild(3, undefined)?.getId() + '';
                          this.getFirstChildIndexWithoutExpandValue = frameNode.getFirstChildIndexWithoutExpand() + '';
                          this.getLastChildIndexWithoutExpandValue = frameNode.getLastChildIndexWithoutExpand() + '';
                        }
                      }
                    })
                  Button('Expand Out of bounds')
                    .id('button_expand_out')
                    .width('20%').margin(5).height('3%')
                    .onClick((e:ClickEvent) => {
                      const uiContext = this.getUIContext();
                      if (uiContext) {
                        const frameNode = uiContext.getFrameNodeById('LazyForEachList');

                        if (frameNode) {
                          this.getChildValue = frameNode.getChild(11, ExpandMode.EXPAND)?.getId() + '';
                          this.getFirstChildIndexWithoutExpandValue = frameNode.getFirstChildIndexWithoutExpand() + '';
                          this.getLastChildIndexWithoutExpandValue = frameNode.getLastChildIndexWithoutExpand() + '';
                        }
                      }
                    })
                }
                Row() {
                  Button('LazyExpand Out of bounds')
                    .id('button_lazy_expand_out')
                    .width('20%').margin(5).height('3%')
                    .onClick((e:ClickEvent) => {
                      const uiContext = this.getUIContext();
                      if (uiContext) {
                        const frameNode = uiContext.getFrameNodeById('LazyForEachList');
                        if (frameNode) {
                          this.getChildValue = frameNode.getChild(11, ExpandMode.LAZY_EXPAND)?.getId() + '';
                          this.getFirstChildIndexWithoutExpandValue = frameNode.getFirstChildIndexWithoutExpand() + '';
                          this.getLastChildIndexWithoutExpandValue = frameNode.getLastChildIndexWithoutExpand() + '';
                        }
                      }
                    })
                  Button('NotExpand Out of bounds')
                    .id('button_not_expand_out')
                    .width('20%').margin(5).height('3%')
                    .onClick((e:ClickEvent) => {
                      const uiContext = this.getUIContext();
                      if (uiContext) {
                        const frameNode = uiContext.getFrameNodeById('LazyForEachList');

                        if (frameNode) {
                          this.getChildValue = frameNode.getChild(4, ExpandMode.NOT_EXPAND)?.getId() + '';
                          this.getFirstChildIndexWithoutExpandValue = frameNode.getFirstChildIndexWithoutExpand() + '';
                          this.getLastChildIndexWithoutExpandValue = frameNode.getLastChildIndexWithoutExpand() + '';
                        }
                      }
                    })
                }
              }.height('50%')
            }
          }.scrollBarColor(Color.Transparent)
        }
        .width('100%')
        .backgroundColor(Color.Gray)
        .id('Column_TS')
      }
      .width('100%')
    }.scrollBarColor(Color.Transparent)
  }
}