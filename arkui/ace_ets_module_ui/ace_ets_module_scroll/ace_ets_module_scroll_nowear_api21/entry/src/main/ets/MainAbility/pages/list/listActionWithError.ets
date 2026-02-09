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
import { BusinessError } from '@ohos.base';

export class ListDataSource implements IDataSource {
  private list: number[] = [];
  private listeners: DataChangeListener[] = [];

  constructor(list: number[]) {
    this.list = list;
  }

  setData(list: number[]): void {
    this.list = list;
  }

  totalCount(): number {
    return this.list.length;
  }

  getData(index: number): number {
    return this.list[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    });
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }

  public deleteItemByIndex(index: number): void {
    this.list.splice(index, 1);
    this.notifyDataDelete(index);
  }

  public insertItem(index: number, data: number): void {
    this.list.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public deleteItem(num: number): void {
    this.deleteItemByIndex(this.list.indexOf(num));
  }
}

@Entry
@Component
struct ListItemExample2 {
  private arr: ListDataSource = new ListDataSource([]);
  @State arr2: number[] = [0, 1, 2, 3, 4];
  @State enterEndDeleteAreaString: string = 'not enterEndDeleteArea';
  @State exitEndDeleteAreaString: string = 'not exitEndDeleteArea';
  private scroller: ListScroller = new ListScroller();
  @State directions: (ListItemSwipeActionDirection | undefined | null)[] = [
    ListItemSwipeActionDirection.START,
    ListItemSwipeActionDirection.END,
    undefined,
    null,
  ]
  @State dirIndex: number = 0;
  @State text: ResourceStr | undefined = '0';
  @State listItemGroupIndex: number = 0;
  @State flag: boolean = true;

  @Builder
  itemEnd() {
    Row() {
      Button('Delete').margin(this.flag ? '4vp' : '20vp')
      Button('Set').margin('4vp').onClick(() => {
        this.scroller.closeAllSwipeActions();
      })
    }.padding('4vp').justifyContent(FlexAlign.SpaceEvenly)
  }

  getList(): FrameNode | undefined | null {
    let node: FrameNode | null = this.getUIContext().getFrameNodeByUniqueId(this.getUniqueId());
    let count: number = node?.getChildrenCount() ?? 0;
    for (let i = 0; i < count; i++) {
      let child: FrameNode | undefined | null = node?.getChild(i);
      if (child?.getNodeType() === 'List') {
        return child;
      }
    }
    return undefined;
  }

  getListItemGroup(index: number, list: FrameNode | undefined): FrameNode | undefined | null {
    let count: number = list?.getChildrenCount() ?? 0;
    let listItemGroupCount: number = 0;
    for (let i = 0; i < count; i++) {
      let child: FrameNode | undefined | null = list?.getChild(i);
      if (child?.getNodeType() === 'ListItemGroup') {
        if (listItemGroupCount === index) {
          return child;
        }
        listItemGroupCount++;
      }
    }
    return undefined;
  }

  aboutToAppear(): void {
    let array: number[] = [];
    for (let i = 0; i < 5; i++) {
      array.push(i);
    }
    this.arr.setData(array);
  }

  build() {
    Flex({ wrap: FlexWrap.Wrap }) {
      Flex({ wrap: FlexWrap.Wrap }) {
        Button('directions ' + this.directions[this.dirIndex])
          .onClick(() => {
            this.dirIndex = (this.dirIndex + 1) % this.directions.length;
          })
        Button('listItemGroup ' + this.listItemGroupIndex)
          .onClick(() => {
            this.listItemGroupIndex = (this.listItemGroupIndex + 1) % this.arr2.length;
          })
        Button('expand inList')
          .id('expand inList')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.expand(this.getList()?.getChild(Number(this.text)),
                this.directions[this.dirIndex])
            } catch (error) {
              console.error('LIST Error expanding item:', (error as BusinessError).code,
                (error as BusinessError).message);
            }
          })
        Button('collapse inList')
          .id('collapse inList')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.collapse(this.getList()?.getChild(Number(this.text)))
            } catch (error) {
              console.error('LIST Error expanding item:', (error as BusinessError).code,
                (error as BusinessError).message);
            }
          })
        Button('expand inListItemGroup')
          .onClick(() => {
            try {
              let group = this.getListItemGroup(this.listItemGroupIndex, this.getList() ?? undefined);
              ListItemSwipeActionManager.expand(group?.getChild(Number(this.text)), this.directions[this.dirIndex])
            } catch (error) {
              console.error('LIST Error expanding item:', (error as BusinessError).code,
                (error as BusinessError).message);
            }
          })
        Button('collapse inListItemGroup')
          .onClick(() => {
            try {
              let group = this.getListItemGroup(this.listItemGroupIndex, this.getList() ?? undefined);
              ListItemSwipeActionManager.collapse(group?.getChild(Number(this.text)))
            } catch (error) {
              console.error('LIST Error expanding item:', (error as BusinessError).code,
                (error as BusinessError).message);
            }
          })
        Button('非法')
          .id('invalid')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.collapse(this.getUIContext().getFrameNodeByUniqueId(this.getUniqueId()))
            } catch (error) {
              console.error('LIST Error expanding item:', (error as BusinessError).code,
                (error as BusinessError).message);
            }
          })
        Button('空收起')
          .id('invalid001')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.expand(undefined,this.directions[this.dirIndex])
            } catch (error) {
              console.error('LIST Error expanding item:', (error as BusinessError).code,
                (error as BusinessError).message);
            }
          })
        Button('空放开')
          .id('invalid002')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.collapse(undefined)
            } catch (error) {
              console.error('LIST Error expanding item:', (error as BusinessError).code,
                (error as BusinessError).message);
            }
          })
          Button('非法弹出')
          .id('invalid003')
          .onClick(() => {
            try {
              ListItemSwipeActionManager.expand(this.getUIContext().getFrameNodeByUniqueId(this.getUniqueId()),
              this.directions[this.dirIndex])
            } catch (error) {
              console.error('LIST Error expanding item:', (error as BusinessError).code,
                (error as BusinessError).message);
            }
          })
        Button('change flag')
          .onClick(() => {
            this.flag = !this.flag;
          })
      }

      List({ space: 10, scroller: this.scroller }) {
        LazyForEach(this.arr, (item: number) => {
          ListItem() {
            Text('item' + item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }
          .transition({ type: TransitionType.Delete, opacity: 0 })
          .swipeAction({
            start: {
              builder: () => {
                this.itemEnd()
              },
              onAction: () => {
                this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                  this.arr.deleteItem(item);
                });
              },
              actionAreaDistance: 56,
              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = 'enterEndDeleteArea';
                this.exitEndDeleteAreaString = 'not exitEndDeleteArea';
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = 'not enterEndDeleteArea';
                this.exitEndDeleteAreaString = 'exitEndDeleteArea';
              }
            },
            end: {
              builder: () => {
                this.itemEnd()
              },
              onAction: () => {
                this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                  this.arr.deleteItem(item);
                });
              },
              actionAreaDistance: 56,
              onEnterActionArea: () => {
                this.enterEndDeleteAreaString = 'enterEndDeleteArea';
                this.exitEndDeleteAreaString = 'not exitEndDeleteArea';
              },
              onExitActionArea: () => {
                this.enterEndDeleteAreaString = 'not enterEndDeleteArea';
                this.exitEndDeleteAreaString = 'exitEndDeleteArea';
              }
            },
          })

        }, (item: number) => item.toString())
        ForEach(this.arr2, (item1: number) => {
          ListItemGroup() {
            ForEach(this.arr2, (item: number) => {
              ListItem() {
                Text('ListItemGroup ' + (this.arr2.length * item1 + this.arr.totalCount() + item) + ' item' + item)
                  .width('100%')
                  .height(100)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }
              .transition({ type: TransitionType.Delete, opacity: 0 })
              .swipeAction({
                start: {
                  builder: () => {
                    this.itemEnd()
                  },
                  onAction: () => {
                    this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                      let index = this.arr2.indexOf(item);
                      this.arr2.splice(index, 1);
                    });
                  },
                  actionAreaDistance: 56,
                  onEnterActionArea: () => {
                    this.enterEndDeleteAreaString = 'enterEndDeleteArea';
                    this.exitEndDeleteAreaString = 'not exitEndDeleteArea';
                  },
                  onExitActionArea: () => {
                    this.enterEndDeleteAreaString = 'not enterEndDeleteArea';
                    this.exitEndDeleteAreaString = 'exitEndDeleteArea';
                  }
                },
                end: {
                  builder: () => {
                    this.itemEnd()
                  },
                  onAction: () => {
                    this.getUIContext()?.animateTo({ duration: 1000 }, () => {
                      let index = this.arr2.indexOf(item);
                      this.arr2.splice(index, 1);
                    });
                  },
                  actionAreaDistance: 56,
                  onEnterActionArea: () => {
                    this.enterEndDeleteAreaString = 'enterEndDeleteArea';
                    this.exitEndDeleteAreaString = 'not exitEndDeleteArea';
                  },
                  onExitActionArea: () => {
                    this.enterEndDeleteAreaString = 'not enterEndDeleteArea';
                    this.exitEndDeleteAreaString = 'exitEndDeleteArea';
                  }
                }
              })
            }
            )
          }
        }, (item: number) => item.toString())
        ListItem() {
          Text('end')
            .width('100%')
            .height(100)
            .fontSize(16)
            .textAlign(TextAlign.Center)
            .borderRadius(10)
            .backgroundColor(0xFFFFFF)
        }
        .transition({ type: TransitionType.Delete, opacity: 0 })
        .swipeAction({
          start: {
            builder: () => {
              this.itemEnd()
            },
            actionAreaDistance: 56,
            onEnterActionArea: () => {
              this.enterEndDeleteAreaString = 'enterEndDeleteArea';
              this.exitEndDeleteAreaString = 'not exitEndDeleteArea';
            },
            onExitActionArea: () => {
              this.enterEndDeleteAreaString = 'not enterEndDeleteArea';
              this.exitEndDeleteAreaString = 'exitEndDeleteArea';
            }
          },
          end: {
            builder: () => {
              this.itemEnd()
            },
            actionAreaDistance: 56,
            onEnterActionArea: () => {
              this.enterEndDeleteAreaString = 'enterEndDeleteArea';
              this.exitEndDeleteAreaString = 'not exitEndDeleteArea';
            },
            onExitActionArea: () => {
              this.enterEndDeleteAreaString = 'not enterEndDeleteArea';
              this.exitEndDeleteAreaString = 'exitEndDeleteArea';
            }
          }
        })
      }
      .id('list')
      .height('80%')

    }
    .padding(10)
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}