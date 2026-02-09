'use static';
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
import { Builder, DataPanelConfiguration, Column, ForEach, Line, Row, Text, Alignment, Margin, ContentModifier, WrappedBuilder, wrapBuilder, CustomBuilderT,
  Entry, Component, DataPanel, DataPanelType, Padding, RelativeContainer, Rect
} from '@ohos.arkui.component'
import {
  State,
  PropRef,
  AppStorage
} from '@ohos.arkui.stateManagement'


@Builder
function buildDataPanel(config: DataPanelConfiguration) {
  Column() {
    Column() {
      ForEach(config.values, (item: number, index: int) => {
        ChildItem({ item: item, index: index as int, max: config.maxValue })
      })
    }.padding(10)

    Column() {
      Line().width('100%').backgroundColor('#ff373737').margin({ bottom: 5 } as Margin)
    }.padding({ left: 20, right: 20 } as Padding)

    Row() {
      Text('Length=' + config.values.length + '    ').margin({ left: 10 } as Margin ).align(Alignment.Start)
      Text('Max=' + config.maxValue).margin({ left: 10 } as Margin).align(Alignment.Start).id('DataPanelContentModifier_max')
    }
  }
}

class DataPanelBuilder implements ContentModifier<DataPanelConfiguration> {
  constructor() {
  }
  applyContent(): WrappedBuilder<CustomBuilderT<DataPanelConfiguration>> {
    return wrapBuilder(buildDataPanel)
  }
}

@Entry
@Component
struct DataPanelBuilderExample {
  build() {
    Column() {
      Text('Data panel').margin({ top: 12 } as Margin);
      Row() {
        DataPanel({ values: [12.3, 21.1, 13.4, 35.2, 26.0, 32.0], max: 140, type: DataPanelType.Circle })
          .width(400)
          .height(260)
          .constraintSize({ maxWidth: '100%' })
          .padding({ top: 10 } as Padding)
          .contentModifier(new DataPanelBuilder())
      }.margin(15).backgroundColor('#fff5f5f5')
    }
  }
}

@Component
struct ChildItem {
  @PropRef item: number;
  @PropRef index: int;
  @PropRef max: number;
  public color1: string = '#65ff00dd'
  public color2: string = '#6500ff99'
  public color3: string = '#65ffe600'
  public color4: string = '#6595ff00'
  public color5: string = '#65000dff'
  public color6: string = '#650099ff'
  public colorArray: Array<string> = [this.color1, this.color2, this.color3, this.color4, this.color5, this.color6]

  build() {
    RelativeContainer() {
      Row() {
        Rect()
          .height(25)
          .width(this.item * 600 / this.max)
          .foregroundColor(this.colorArray[this.index])
          .radius(5)
          .align(Alignment.Start)
        Text(' ' + this.item)
          .fontSize(17)
      }
    }.height(28)
  }
}