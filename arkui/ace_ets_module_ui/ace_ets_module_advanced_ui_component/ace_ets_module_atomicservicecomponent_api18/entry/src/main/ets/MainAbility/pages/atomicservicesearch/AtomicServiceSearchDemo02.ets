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
export struct Demo02 {
  @State enterTypes: Array<EnterKeyType> =
    [EnterKeyType.Go, EnterKeyType.Search, EnterKeyType.Send, EnterKeyType.Done, EnterKeyType.Next,
      EnterKeyType.PREVIOUS, EnterKeyType.NEW_LINE]
  @State index: number = 0
  build() {
    Column({space: 8}) {
      // 8 测试search及cancel图标
      Text('---------测试search及cancel图标---------').fontColor(Color.Red).fontWeight(700);

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
          searchIcon: {
            size: 18,
            color: Color.Red,
            src: $r(`app.media.icon`)
          },
          cancelIcon: {
            size: 18,
            color: Color.Red,
            src: $r(`app.media.icon`)
          },
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

      //9 测试caretStyle及选中背景色
      Text('------测试caretStyle及选中背景色------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        value:'123456',
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
          caretStyle: { width: 3, color: Color.Green },
          selectedBackgroundColor: Color.Red
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

      //10. 测试enableKeyboardOnFocus
      Text('------测试enableKeyboardOnFocus------').fontColor(Color.Red).fontWeight(700);

      Button('focus Search')
        .width('100%')
        .onClick(() => {
          focusControl.requestFocus('search')
        })

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
          searchKey:'search',
          enableKeyboardOnFocus: false
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

      // 11 测试hideSelectionMenu
      Text('---------测试hideSelectionMenu---------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        value:'123456',
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
          hideSelectionMenu: true
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

      // 12 测试SearchType
      Text('-------------测试SearchType-----------').fontColor(Color.Red).fontWeight(700);

      Text('数字类型输入框').alignSelf(ItemAlign.Start).decoration({
        type: TextDecorationType.Underline,
        color: Color.Black,
        style: TextDecorationStyle.SOLID
      })
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

            } else if (index === 1) {

            } else if (index === 2) {

            } else if (index === 3) {
            }
          }
        },
        search: {
          type: SearchType.PHONE_NUMBER
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

      Text('普通输入框').alignSelf(ItemAlign.Start).decoration({
        type: TextDecorationType.Underline,
        color: Color.Black,
        style: TextDecorationStyle.SOLID
      })
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
          type: SearchType.NORMAL
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

      // 13 测试maxLength
      Text('-------------测试maxLength-----------').fontColor(Color.Red).fontWeight(700);

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
          maxLength: 0
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

      // 14 测试enterKeyType
      Text('-------------测试enterKeyType-----------').fontColor(Color.Red).fontWeight(700);

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
          enterKeyType: this.enterTypes[this.index]
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
      Button('改变EnterKeyType').onClick(() => {
        this.index = (this.index + 1) % this.enterTypes.length;
      }).width('100%')

    }
  }

  private alert(message: string): void {
    AlertDialog.show({
      message: message
    })
  }
}
