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
import { ColorMetrics } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';
import { ComponentContent } from '@kit.ArkUI';
import { BuilderNode, FrameNode, NodeController,typeNode, RenderNode } from '@ohos.arkui.node'
import { Entry, Column, Component,Builder,Text,ColumnOptions,Margin,Button,NodeContainer,
  Visibility,wrapBuilder,FontWeight,Color,WrappedBuilder,Scroll,Scroller,ColumnOptions,
  HorizontalAlign,ColumnOptions,Stack,Row,Position,ResourceColor,$r

} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import { ClickEvent } from '@ohos.arkui.component';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
@Entry
@Component
struct ColorMetricsIndex {
  @State errorStr401: string = '';
  @State errorStr180003: string = '';

  build() {
    Column() {
      Button('ResourceColor ErrorCode 401').id('error_bnt401_id')
        .width('80%')
        .height(50)
        .onClick((e:ClickEvent) => {
          try {
            // ColorMetrics.resourceColor(null);
          } catch (e) {
            this.errorStr401 = (e as BusinessError).code + '';
          }
        })

      Button('ResourceColor ErrorCode 180003').id('error_bnt180003_id')
        .width('80%')
        .height(50)
        .onClick((e:ClickEvent) => {
          try {
            let color: ResourceColor = $r('app.float.font_hello');
            ColorMetrics.resourceColor(color);
          } catch (e) {
            this.errorStr180003 = (e as BusinessError).code + '';
          }
        })
      Text(this.errorStr401).id('error_str401_id')
      Text(this.errorStr180003).id('error_str180003_id')
    }
    .width('100%')
    .height('100%')
  }
}