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

import { Entry, Column, Component, Row, Toggle,  Text, Button, ClickEvent, ButtonRole, Checkbox,
  ColumnOptions, Shape, Path, Flex, Builder, Margin, Radio, RadioIndicatorType } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct RadioIndicatorTypeTest {
  @State text:string = ''

  @Builder
  indicatorBuilder() {
    Text('Custom').id('RadioIndicatorType_Text')
  }

  build() {
    Column({space:10} as ColumnOptions) {
      Column() {
        Text('Radio1')
        Radio({ value: 'Radio1', group: 'radioGroup1',
          indicatorType:RadioIndicatorType.TICK
        })
          .width('80vp')
          .height('80vp')
          .checked(true)
          .id('RadioIndicatorType_Radio1')
      }

      Column() {
        Text('Radio2')
        Radio({ value: 'Radio2', group: 'radioGroup2',
          indicatorType:RadioIndicatorType.DOT
        })
          .width('80vp')
          .height('80vp')
          .checked(true)
          .id('RadioIndicatorType_Radio2')
      }

      Column() {
        Text('Radio3')
        Radio({ value: 'Radio3', group: 'radioGroup3',
          indicatorType:RadioIndicatorType.CUSTOM,
          indicatorBuilder:()=>{this.indicatorBuilder()}
        })
          .width('80vp')
          .height('80vp')
          .checked(true)
          .id('RadioIndicatorType_Radio3')
      }


    }.width('100%')
  }
}