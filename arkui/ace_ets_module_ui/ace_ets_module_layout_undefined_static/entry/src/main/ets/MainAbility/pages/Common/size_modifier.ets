'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import {  State, Observed } from '@ohos.arkui.stateManagement'
import { Entry,Column,Text,Button,Divider,SafeAreaType,SafeAreaEdge,SizeOptions,
  Component,ButtonAttribute,AttributeModifier} from '@ohos.arkui.component'

@Observed
export class SizeModifierCommon implements AttributeModifier<ButtonAttribute> {
 public isUndefined: boolean = false;
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance
      .size(this.isUndefined ? undefined : { width: '100vp', height: '50vp' } as SizeOptions )
      .id('Common_size')
  }
}

@Entry
@Component
struct CommonExample {
  @State buttonText: string = 'true'
  @State modifier4 : SizeModifierCommon = new SizeModifierCommon()

  build() {
    Column() {
      Text('size-动态切换').fontSize(20).margin(15).width('90%')
      Button('Button')
        .fontSize(50)
        .attributeModifier(this.modifier4)
        .id('Common_sizeModifier')

      Button('Button')
        .fontSize(50)
        .id('Common_size_base')
      
      Divider()
      Button('isUndefined = ' + this.buttonText)
        .id('changeButton')
        .onClick(() => {
          this.modifier4.isUndefined == true ? this.modifier4.isUndefined = false : this.modifier4.isUndefined = true
          this.modifier4.isUndefined == true ? this.buttonText = 'true' : this.buttonText = 'false'
        })
    }.width('100%')
  }
}