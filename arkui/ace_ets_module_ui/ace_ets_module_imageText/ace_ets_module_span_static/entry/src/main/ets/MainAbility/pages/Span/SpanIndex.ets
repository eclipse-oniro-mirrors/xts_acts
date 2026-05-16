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

'use static'

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Text,
  Span,
  FontWeight,
  Scroll
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct SpanIndex {
  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) {
      console.log('SpanIndex error ' + error);
    }
  }

  build() {
    Scroll() {
      Column({ space: 16 } as ColumnOptions) {
        // fontWeight: FontWeight.Bold
        Text() {
          Span('FontWeight.Bold')
            .fontWeight(FontWeight.Bold)
            .key('spanFontWeightBold')
        }

        // fontWeight: FontWeight.Normal
        Text() {
          Span('FontWeight.Normal')
            .fontWeight(FontWeight.Normal)
            .key('spanFontWeightNormal')
        }

        // fontWeight: FontWeight.Medium
        Text() {
          Span('FontWeight.Medium')
            .fontWeight(FontWeight.Medium)
            .key('spanFontWeightMedium')
        }

        // fontWeight: FontWeight.Lighter
        Text() {
          Span('FontWeight.Lighter')
            .fontWeight(FontWeight.Lighter)
            .key('spanFontWeightLighter')
        }

        // fontWeight: FontWeight.Bolder
        Text() {
          Span('FontWeight.Bolder')
            .fontWeight(FontWeight.Bolder)
            .key('spanFontWeightBolder')
        }

        // fontWeight: int value 700
        Text() {
          Span('fontWeight int 700')
            .fontWeight(700)
            .key('spanFontWeightInt700')
        }

        // fontWeight: int value 400
        Text() {
          Span('fontWeight int 400')
            .fontWeight(400)
            .key('spanFontWeightInt400')
        }

        // fontWeight: ResourceStr 'bold'
        Text() {
          Span('fontWeight ResourceStr bold')
            .fontWeight('bold')
            .key('spanFontWeightStrBold')
        }

        // fontWeight: undefined
        Text() {
          Span('fontWeight undefined')
            .fontWeight(undefined)
            .key('spanFontWeightUndefined')
        }
      }
      .width('100%')
      .padding({ top: '2%', bottom: '2%', left: '2%', right: '2%' })
    }
    .width('100%')
    .height('100%')
  }
}
