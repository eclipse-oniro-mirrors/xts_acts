'use static';

/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import {
  Entry,
  Component,ColumnOptions,
  Column,
  Scroll,
  Divider,
  Text,
  LineCapStyle
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct DividerIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.info('[ARKUI_NEW] DividerIndex error ' + error);
    }
  }

  build() {
      Column({space:1} as ColumnOptions) {
        Text('Divider default')
          .height(10)
        Divider()
          .id('dividerDefault').key('dividerDefault')
          .width(180)
          .height(7)

        Text('Divider vertical true')
          .height(10)
        Divider()
          .vertical(true)
          .id('dividerVerticalTrue').key('dividerVerticalTrue')
          .width(180)
          .height(7)

        Text('Divider vertical false')
          .height(10)
        Divider()
          .vertical(false)
          .id('dividerVerticalFalse').key('dividerVerticalFalse')
          .width(180)
          .height(7)

        Text('Divider color red')
          .height(10)
        Divider()
          .color('#FF0000')
          .id('dividerColorRed').key('dividerColorRed')
          .width(180)
          .height(7)

        Text('Divider strokeWidth 5')
          .height(10)
        Divider()
          .strokeWidth(5)
          .id('dividerStrokeWidth5').key('dividerStrokeWidth5')
          .width(180)
          .height(7)

        Text('Divider strokeWidth 10px')
          .height(10)
        Divider()
          .strokeWidth('10px')
          .id('dividerStrokeWidth10px').key('dividerStrokeWidth10px')
          .width(180)
          .height(7)

        Text('Divider lineCap Butt')
          .height(10)
        Divider()
          .lineCap(LineCapStyle.Butt)
          .id('dividerLineCapButt').key('dividerLineCapButt')
          .width(180)
          .height(7)

        Text('Divider lineCap Round')
          .height(10)
        Divider()
          .lineCap(LineCapStyle.Round)
          .id('dividerLineCapRound').key('dividerLineCapRound')
          .width(180)
          .height(7)

        Text('Divider lineCap Square')
          .height(10)
        Divider()
          .lineCap(LineCapStyle.Square)
          .id('dividerLineCapSquare').key('dividerLineCapSquare')
          .width(180)
          .height(7)

    }
    .width('100%')
    .height('100%')
  }
}
