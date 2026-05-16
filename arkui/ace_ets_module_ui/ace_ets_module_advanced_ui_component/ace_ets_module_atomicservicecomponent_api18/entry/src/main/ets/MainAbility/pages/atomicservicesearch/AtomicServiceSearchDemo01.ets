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
import { AtomicServiceSearch, SearchParams, SelectParams } from '@ohos.atomicservice.AtomicServiceSearch'


@Component
export struct Demo01 {
  @State copyValue: string = '';
  @State cutValue: string = '';
  @State private placeholder: string = 'Type to Search...';
  @State private defaultValue: string = 'default';
  @State private search?: SearchParams = {};
  @State private select?: SelectParams = {
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
  };

  build() {
    Column({ space: 8 }) {

      // 1.测试搜索框样式
      Text('-------------测试搜索框样式-----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({});

      AtomicServiceSearch({
        operation: {
          auxiliaryItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('扫一扫');
            }
          }
        }
      });

      AtomicServiceSearch({
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
      });

      AtomicServiceSearch({
        select: {
          options: [
            { value: 'Select1', icon: $r('app.media.icon') },
            { value: 'Select2', icon: $r('app.media.icon') },
            { value: 'Select3', icon: $r('app.media.icon') },
            { value: 'Select4', icon: $r('app.media.icon') }
          ],
          selected: 0,
          selectValue: 'Select1',
          onSelect: (index: number, selectValue: string) => {
            if (index === 0) {
              this.alert(`index: ${index}, selectValue: ${selectValue}`);
            } else if (index === 1) {
              this.alert(`index: ${index}, selectValue: ${selectValue}`);
            } else if (index === 2) {
              this.alert(`index: ${index}, selectValue: ${selectValue}`);
            } else if (index === 3) {
              this.alert(`index: ${index}, selectValue: ${selectValue}`);
            }
          },
        },
      });
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
        operation: {
          auxiliaryItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('扫一扫');
            }
          }
        }
      });
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
      });
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
          searchButton: {
            searchButtonValue: 'SEARCH',
          }
        }
      });

      // 2 测试接口参数
      Text('-------------测试接口参数-----------').fontColor(Color.Red).fontWeight(700);

      Button('修改placeholder')
        .width('100%')
        .type(ButtonType.Normal)
        .borderRadius(20)
        .onClick(() => {
          if (this.placeholder === 'Search...') {
            this.placeholder = 'Type to Search...';
          } else {
            this.placeholder = 'Search...';
          }
        });
      Button('修改defaultValue')
        .width('100%')
        .type(ButtonType.Normal)
        .borderRadius(20)
        .onClick(() => {
          if (this.defaultValue === 'value') {
            this.defaultValue = 'defaultValue';
          } else {
            this.defaultValue = 'value';
          }
        });
      Button('修改Select样式')
        .width('100%')
        .type(ButtonType.Normal)
        .borderRadius(20)
        .onClick(() => {
          this.select = {
            options: [
              { value: '选项1', icon: $r('app.media.icon') },
              { value: '选项2', icon: $r('app.media.icon') },
            ],
            selected: -1,
            selectValue: '选项1',
            onSelect: (index: number) => {
              if (index === 0) {
                this.alert('选项1');
              } else if (index === 1) {
                this.alert('选项2');
              }
            }
          };
        });

      Button('修改Search样式')
        .width('100%')
        .type(ButtonType.Normal)
        .borderRadius(20)
        .onClick(() => {
          this.search = {
            componentBackgroundColor: '#e0eee8'
          }
        });

      AtomicServiceSearch({
        value: this.defaultValue,
        placeholder: this.placeholder,
        select: this.select,
        search: this.search,
        operation: {
          independentItem: {
            value: $r(`app.media.icon`),
            action: () => {
              this.alert('通知');
            }
          }
        }
      })

      // 3.测试search背景色及按压背景色
      Text('------测试search背景色及按压背景色-------').fontColor(Color.Red).fontWeight(700);

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
          componentBackgroundColor: '#e0eee8',
          pressedBackgroundColor: '#c0ebd7'
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

      // 4 测试searchButton
      Text('-------------测试searchButton-----------').fontColor(Color.Red).fontWeight(700);

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
          searchButton: {
            searchButtonValue: 'SUBMIT',
            options: { fontSize: 10, fontColor: Color.Red }
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

      // 5 测试placeholder颜色及字体
      Text('---------测试placeholder颜色及字体--------').fontColor(Color.Red).fontWeight(700);

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
          placeholderColor:Color.Red,
          placeholderFont: {
            size: 12,
            weight:700,
            family:'Arial',
            style:FontStyle.Italic
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

      // 6 测试search字体、颜色及对齐方式
      Text('-------测试search字体、颜色及对齐方式------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        value: 'hello',
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
          textFont: {
            size: 12,
            weight: 700,
            family: 'Arial',
            style: FontStyle.Italic
          },
          textAlign: TextAlign.Center,
          fontColor: Color.Red
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

      // 7 测试copyOptions
      Text('-----------测试copyOptions----------').fontColor(Color.Red).fontWeight(700);

      AtomicServiceSearch({
        value: 'Search CopyOption:不支持复制',
        search: {
          copyOptions: CopyOptions.None,
          onCopy: (value:string) => {
            this.copyValue = value;
          },
          onCut:(value: string) => {
            this.cutValue = value;
          }
        },
      })
      AtomicServiceSearch({
        value: 'Search CopyOption:应用内复制',
        search: {
          copyOptions: CopyOptions.InApp,
          onCopy: (value:string) => {
            this.copyValue = value;
          },
          onCut:(value: string) => {
            this.cutValue = value;
          }
        },
      })
      AtomicServiceSearch({
        value: 'Search CopyOption:设备内复制',
        search: {
          copyOptions: CopyOptions.LocalDevice,
          onCopy: (value:string) => {
            this.copyValue = value;
          },
          onCut:(value: string) => {
            this.cutValue = value;
          }
        },
      })
      Text('copy: ' + this.copyValue)
      Text('cut:' + this.cutValue)

    }
  }

  private alert(message: string): void {
    AlertDialog.show({
      message: message
    })
  }
}