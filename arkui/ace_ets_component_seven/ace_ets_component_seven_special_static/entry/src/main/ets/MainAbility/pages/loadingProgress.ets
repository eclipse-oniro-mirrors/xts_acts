'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { Entry, Component, Column, AttributeModifier, LoadingProgressAttribute, ColumnOptions, LoadingProgress, Margin, Text, Color } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';

class TestLoadingProgressModifier implements AttributeModifier<LoadingProgressAttribute> {
  applyNormalAttribute(instance: LoadingProgressAttribute): void {
    instance
      .color(Color.Blue)
      .enableLoading(true)
  }
}

@Entry
@Component
struct LoadingProgressExampleAdd {
  @State modifier: TestLoadingProgressModifier = new TestLoadingProgressModifier()

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('Orbital LoadingProgress ').fontSize(9).fontColor(0xCCCCCC).width('90%')
      LoadingProgress()
        .key('ArkUX_Stage_loadingProgress_attrs_0100')
        .attributeModifier(this.modifier)
    }
    .width('100%')
    .margin({ top: 5 } as Margin)
  }
}