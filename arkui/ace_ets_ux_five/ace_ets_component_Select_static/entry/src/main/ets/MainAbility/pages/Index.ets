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
import {
  Button,
  ButtonType,
  ClickEvent,
  Color,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FontWeight,
  ItemAlign,
  Margin,
  Row,
  Select,
  Text,
  TextInputController
} from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage, State } from '@ohos.arkui.stateManagement'

@Entry
@Component
struct Index {
  @State text: string = '';
  controller: TextInputController = new TextInputController();

  aboutToAppear() {
    try {
      let router1 = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router1);
    } catch (error: Error) {
      console.log('error ' + error);
    }
  }

  build() {
    Row() {
      Column() {
        Select([{ value: 'aaa' },
          { value: 'bbb' },
          { value: 'ccc' },
          { value: 'ddd' },
          { value: 'eee' },
          { value: 'fff' },
          { value: 'ggg' }
        ])
          .value('TTTT')
          .key("ArkUX_Select_Visual_0030")
          .optionWidth(this.getUIContext().px2vp(300))
          .optionHeight(this.getUIContext().px2vp(300))

        Select([{ value: 'aaa' },
          { value: 'bbb' },
          { value: 'ccc' },
          { value: 'ddd' },
          { value: 'eee' },
          { value: 'fff' },
          { value: 'ggg' }
        ])
          .key("ArkUX_Select_Visual_0040")
          .backgroundColor(Color.Blue)
          .value('TTTT')
          .optionBgColor(Color.Blue)
          .optionWidth(this.getUIContext().px2vp(600))
          .optionHeight(this.getUIContext().px2vp(600))

        Select([{ value: 'aaa' },
          { value: 'bbb' },
          { value: 'ccc' },
          { value: 'ddd' },
          { value: 'eee' },
          { value: 'fff' },
          { value: 'ggg' }
        ])
          .key("ArkUX_Select_Visual_0050")
          .value('TTTT')
          .optionWidth(this.getUIContext().px2vp(900))
          .optionHeight(this.getUIContext().px2vp(900))

        Select([{ value: 'aaa' },
          { value: 'bbb' },
          { value: 'ccc' },
          { value: 'ddd' },
          { value: 'eee' },
          { value: 'fff' },
          { value: 'ggg' }
        ])
          .key("ArkUX_Select_Visual_0060")
          .value('TTTT')
          .optionWidth(this.getUIContext().px2vp(1200))
          .optionHeight(this.getUIContext().px2vp(1200))

        Select([{ value: 'aaa' },
          { value: 'bbb' },
          { value: 'ccc' },
          { value: 'ddd' },
          { value: 'eee' },
          { value: 'fff' },
          { value: 'ggg' }
        ])
          .key("ArkUX_Select_Visual_0070")
          .value('TTTT')
          .optionWidth(this.getUIContext().px2vp(1500))
          .optionHeight(this.getUIContext().px2vp(1500))

      }.width('100%')
    }.height('100%')
  }
}