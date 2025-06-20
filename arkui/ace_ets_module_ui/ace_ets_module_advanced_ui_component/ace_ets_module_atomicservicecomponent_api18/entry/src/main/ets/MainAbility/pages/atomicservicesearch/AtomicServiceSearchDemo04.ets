/*
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
import { AtomicServiceSearch } from '@ohos.atomicservice.AtomicServiceSearch';
import { SymbolGlyphModifier } from '@kit.ArkUI';

class MyMenuItemContentModifier implements ContentModifier<MenuItemConfiguration> {
  public modifierText: string = ''

  constructor(text: string) {
    this.modifierText = text;
  }

  applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
    return wrapBuilder(menuItemBuilder)
  }
}

@Builder
function menuItemBuilder(configuration: MenuItemConfiguration) {
  Row() {
    Text(configuration.value)
    Blank()
    if (configuration.symbolIcon) {
      SymbolGlyph().attributeModifier(configuration.symbolIcon).fontSize(24)
    } else if (configuration.icon) {
      Image(configuration.icon).size({ width: 24, height: 24 })
    }
    Blank(30)
    Text((configuration.contentModifier as MyMenuItemContentModifier).modifierText)
    Blank(30)
    Path()
      .width('100px')
      .height('150px')
      .commands('M40 0 L80 100 L0 100 Z')
      .fillOpacity(0)
      .stroke(Color.Black)
      .strokeWidth(3)
  }
  .onClick(() => {
    configuration.triggerSelect(configuration.index, configuration.value.valueOf().toString())
  })
}

@Component
export struct Demo04 {
  @State value: string = 'false';
  @State changeValue: string = '';
  @State submitValue: string = '';
  @State offsetX: number = 0;
  @State offsetY: number = 0;
  @State insertValue: string = '';
  @State deleteValue: string = '';
  @State insertOffset: number = 0;
  @State deleteOffset: number = 0;
  @State deleteDirection: number = 0;
  @State startIndex: number = 0;
  @State endIndex: number = 0;

  @State text: string = 'ContentModifier'
  @State symbolModifier1: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontColor([Color.Gray]);
  @State symbolModifier2: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.exposure')).fontColor([Color.Gray]);


  build() {
    Column({space: 8}) {
      // 22 测试enableHapticFeedback
      Text('------测试enableHapticFeedback------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        search: {
          enableHapticFeedback: true
        }
      })
      AtomicServiceSearch({
        search: {
          enableHapticFeedback: false
        }
      })
      // 23 测试search事件
      Text('----------测试search事件-----------').fontColor(Color.Red).fontWeight(700);

      Text('editing: ' + this.value)
        .width('100%')
        .height(25)
        .borderRadius(15)
        .padding({ left: 15 })
        .backgroundColor('rgba(0, 0, 0, 0.1)')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.MARQUEE });
      Text('onSubmit:' + this.submitValue)
        .width('100%')
        .height(25)
        .borderRadius(15)
        .padding({ left: 15 })
        .backgroundColor('rgba(0, 0, 0, 0.1)')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.MARQUEE });
      Text('onChange:' + this.changeValue)
        .width('100%')
        .height(25)
        .borderRadius(15)
        .padding({ left: 15 })
        .backgroundColor('rgba(0, 0, 0, 0.1)')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.MARQUEE });
      Text('offset x:' + this.offsetX + ' y:' + this.offsetY)
        .width('100%')
        .height(25)
        .borderRadius(15)
        .padding({ left: 15 })
        .backgroundColor('rgba(0, 0, 0, 0.1)')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.MARQUEE });
      Text('insertValue:' + this.insertValue + '  insertOffset:' + this.insertOffset)
        .width('100%')
        .height(25)
        .borderRadius(15)
        .padding({ left: 15 })
        .backgroundColor('rgba(0, 0, 0, 0.1)')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.MARQUEE });
      Text('deleteValue:' + this.deleteValue + '  deleteOffset:' + this.deleteOffset)
        .width('100%')
        .height(25)
        .borderRadius(15)
        .padding({ left: 15 })
        .backgroundColor('rgba(0, 0, 0, 0.1)')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.MARQUEE });
      Text('deleteDirection:' + (this.deleteDirection == 0 ? 'BACKWARD' : 'FORWARD'))
        .width('100%')
        .height(25)
        .borderRadius(15)
        .padding({ left: 15 })
        .backgroundColor('rgba(0, 0, 0, 0.1)')
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.MARQUEE });
      AtomicServiceSearch({
        operation: {
          auxiliaryItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('扫一扫');
            }
          }
        },
        search: {
          onSubmit: (value: string) => {
            this.submitValue = value
          },
          onChange: (value: string) => {
            this.changeValue = value
          },
          onCopy: () => {
            this.alert('onCopy');
          },
          onCut: () => {
            this.alert('onCut');
          },
          onPaste: () => {
            this.alert('onPaste');
          },
          onTextSelectionChange: (selectionStart: number, selectionEnd: number) => {
            this.startIndex = selectionStart
            this.endIndex = selectionEnd
          },
          onContentScroll: (totalOffsetX: number, totalOffsetY: number) => {
            this.offsetX = totalOffsetX
            this.offsetY = totalOffsetY
          },
          onEditChange: (data: boolean) => {
            this.value = data ? 'true' : 'false'
          },
          onWillInsert: (info: InsertValue) => {
            if (info.insertValue === '你好') {
              return true;
            }
            return false;
            // return true;
          },
          onDidInsert: (info: InsertValue) => {
            this.alert(info.insertValue)
            this.insertValue = info.insertValue
            this.insertOffset = info.insertOffset
          },
          onWillDelete: (info: DeleteValue) => {
            if (info.deleteValue === '好') {
              return true;
            }
            return false;
          },
          onDidDelete: (info: DeleteValue) => {
            this.alert(info.deleteValue)
            this.deleteValue = info.deleteValue
            this.deleteOffset = info.deleteOffset
            this.deleteDirection = info.direction
          },
        },
      })

      Search().onDidInsert((info: InsertValue) => {
        this.alert(info.insertValue)
        this.insertValue = info.insertValue
        this.insertOffset = info.insertOffset
      })

      // 24 测试Select-options
      Text('----------测试Select-options-----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
          ],
          selected: -1,
          selectValue: 'Select1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('Select1');
            } else if (index === 1) {
              this.alert('Select2');
            } else if (index === 2) {
              this.alert('Select3');
            } else if (index === 3) {
              this.alert('Select4');
            }
          }
        },
        operation: {
          auxiliaryItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('扫一扫');
            }
          },
          independentItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('通知');
            }
          }
        }
      })

      AtomicServiceSearch({
        select: {
          selected: -1,
          selectValue: 'Select1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('Select1');
            } else if (index === 1) {
              this.alert('Select2');
            } else if (index === 2) {
              this.alert('Select3');
            } else if (index === 3) {
              this.alert('Select4');
            }
          }
        },
        operation: {
          auxiliaryItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('扫一扫');
            }
          },
          independentItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('通知');
            }
          }
        }
      })
      // 25 测试Select-selected
      Text('----------测试Select-selected-----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
            { value: 'Select1', icon: $r('app.media.icon') },
            { value: 'Select2', icon: $r('app.media.icon') },
            { value: 'Select3', icon: $r('app.media.icon') },
            { value: 'Select4', icon: $r('app.media.icon') }
          ],
          selected: 1,
          selectValue: 'Select1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('Select1');
            } else if (index === 1) {
              this.alert('Select2');
            } else if (index === 2) {
              this.alert('Select3');
            } else if (index === 3) {
              this.alert('Select4');
            }
          }
        }
      })

      AtomicServiceSearch({
        select: {
          options: [
            { value: 'Select1', icon: $r('app.media.icon') },
            { value: 'Select2', icon: $r('app.media.icon') },
            { value: 'Select3', icon: $r('app.media.icon') },
            { value: 'Select4', icon: $r('app.media.icon') }
          ],
          selected: 10,
          selectValue: 'Select1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('Select1');
            } else if (index === 1) {
              this.alert('Select2');
            } else if (index === 2) {
              this.alert('Select3');
            } else if (index === 3) {
              this.alert('Select4');
            }
          }
        }
      })

      AtomicServiceSearch({
        select: {
          options: [
            { value: 'Select1', icon: $r('app.media.icon') },
            { value: 'Select2', icon: $r('app.media.icon') },
            { value: 'Select3', icon: $r('app.media.icon') },
            { value: 'Select4', icon: $r('app.media.icon') }
          ],
          selectValue: 'Select1',
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('Select1');
            } else if (index === 1) {
              this.alert('Select2');
            } else if (index === 2) {
              this.alert('Select3');
            } else if (index === 3) {
              this.alert('Select4');
            }
          }
        }
      })

      // 26 测试Select-selectValue
      Text('----------测试Select-selectValue-----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
            { value: 'Select1', icon: $r('app.media.icon') },
            { value: 'Select2', icon: $r('app.media.icon') },
            { value: 'Select3', icon: $r('app.media.icon') },
            { value: 'Select4', icon: $r('app.media.icon') }
          ],
          selected: 1,
          onSelect: (index: number) => {
            if (index === 0) {
              this.alert('Select1');
            } else if (index === 1) {
              this.alert('Select2');
            } else if (index === 2) {
              this.alert('Select3');
            } else if (index === 3) {
              this.alert('Select4');
            }
          }
        }
      })

      // 27 测试Select-参数为空
      Text('----------测试Select-参数为空-----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
        }
      })

      // 28 测试Select-menuItemContent
      Text('-----测试Select-menuItemContent------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
            { value: 'item1', icon: $r('app.media.icon'), symbolIcon: this.symbolModifier1 },
            { value: 'item1', icon: $r('app.media.icon'), symbolIcon: this.symbolModifier2 }
          ],
          selectValue: this.text,
          onSelect: (index: number, text?: string) => {
            console.info('Select index:' + index)
            console.info('Select text:' + text)
          },
          menuItemContentModifier: new MyMenuItemContentModifier('Content Modifier'),
          optionWidth:280
        }
      })
    }
  }

  private alert(message: string): void {
    AlertDialog.show({
      message: message
    })
  }
}
