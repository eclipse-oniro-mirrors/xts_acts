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
import { AtomicServiceSearch } from '@ohos.atomicservice.AtomicServiceSearch'


@Component
export struct Demo03 {
  @State filterValue: string = '';
  onCreateMenu = (menuItems: Array<TextMenuItem>) => {
    let item1: TextMenuItem = {
      content: 'custom1',
      icon: $r('app.media.icon'),
      id: TextMenuItemId.of('custom1'),
    }
    let item2: TextMenuItem = {
      content: 'custom2',
      id: TextMenuItemId.of('custom2'),
      icon: $r('app.media.icon'),
    }
    menuItems.push(item1)
    menuItems.unshift(item2)
    return menuItems
  }

  onMenuItemClick = (menuItem: TextMenuItem, textRange: TextRange) => {
    if (menuItem.id.equals(TextMenuItemId.of('custom2'))) {
      console.log('拦截 id: custom2 start:' + textRange.start + '; end:' + textRange.end)
      return true
    }
    if (menuItem.id.equals(TextMenuItemId.COPY)) {
      console.log('拦截 COPY start:' + textRange.start + '; end:' + textRange.end)
      return true
    }
    if (menuItem.id.equals(TextMenuItemId.SELECT_ALL)) {
      console.log('不拦截 SELECT_ALL start:' + textRange.start + '; end:' + textRange.end)
      return false
    }
    return false
  }

  @State editMenuOptions: EditMenuOptions = {
    onCreateMenu: this.onCreateMenu, onMenuItemClick: this.onMenuItemClick
  }

  build() {
    Column({space: 8}) {
      // 15 测试letterSpacing和decoration
      Text('------测试letterSpacing和decoration------').fontColor(Color.Red).fontWeight(700);

      Text('letterSpacing').fontSize(9).fontColor(0xCCCCCC)
      AtomicServiceSearch({
        value: 'letterSpacing 0'
      }).margin({bottom: 10})
      AtomicServiceSearch({
        value: 'letterSpacing 3',
        search: {
          letterSpacing: 3
        }
      }).margin({bottom: 10})
      AtomicServiceSearch({
        value: 'letterSpacing -1',
        search: {
          letterSpacing: -1
        }
      }).margin({bottom: 10})

      Text('decoration').fontSize(9).fontColor(0xCCCCCC)
      AtomicServiceSearch({
        value: 'LineThrough, Red',
        search: {
          decoration: {type: TextDecorationType.LineThrough, color: Color.Red}
        }
      }).margin({bottom: 10})
      AtomicServiceSearch({
        value: 'Overline, Red, DOTTED',
        search: {
          decoration: {type: TextDecorationType.Overline, color: Color.Red, style: TextDecorationStyle.DOTTED}
        }
      }).margin({bottom: 10})
      AtomicServiceSearch({
        value: 'Underline, Red, WAVY',
        search: {
          decoration: {type: TextDecorationType.Underline, color: Color.Red, style: TextDecorationStyle.WAVY}
        }
      }).margin({bottom: 10})

      // 16 测试fontFeature
      Text('---------测试fontFeature---------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        value: 'This is ss01 on : 0123456789',
        search: {
          fontFeature: '\'ss012\' on'
        }
      });
      AtomicServiceSearch({
        value: 'This is ss01 off : 0123456789',
        search: {
          fontFeature: '\'ss01\' off'
        }
      });

      // 17 测试inputFilter
      Text('----------测试inputFilter----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        search: {
          inputFilter: {
            inputFilterValue: '[a-z]',
            error: (filterValue: string) => {
              this.filterValue = filterValue
            }
          }
        }
      })
      Text('Filter:' + this.filterValue)

      // 18 测试textIndent
      Text('----------测试textIndent----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        select: {
          options: [
            { value: 'Select1', icon: $r('app.media.icon') },
            { value: 'Select2', icon: $r('app.media.icon') },
            { value: 'Select3', icon: $r('app.media.icon') },
            { value: 'Select4', icon: $r('app.media.icon') }
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
        search: {
          textIndent: 50
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

      // 19 测试minFontSize和maxFontSize
      Text('------测试minFontSize和maxFontSize------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        value: 'This is the text without the adaptive font test.',
      })

      AtomicServiceSearch({
        value: 'This is the text without the adaptive font test.',
        search: {
          minFontSize: 4,
          maxFontSize: 40
        }
      })

      // 20 测试editMenuOptions
      Text('------测试editMenuOptions------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        value:'Default input',
        search: {
          editMenuOptions : this.editMenuOptions
        }
      })

      // 21 测试enablePreviewText
      Text('------测试enablePreviewText------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch();

      AtomicServiceSearch({
        search: {
          enablePreviewText: false
        }
      });


    }
  }

  private alert(message: string): void {
    AlertDialog.show({
      message: message
    })
  }
}
