'use static'
/**
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
  Entry, Component, $r, Text, Row, Column, Color, ClickEvent, TextInput, TextArea, Span, Search,
  Button, InsertValue, DeleteValue, TextAlign, AttributeModifier, SearchAttribute
} from '@ohos.arkui.component';
import {
  State,Observed
} from '@ohos.arkui.stateManagement'
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

@Observed
class MyTextModifier1 implements AttributeModifier<SearchAttribute> {
  public isCallback: boolean = false;
  public deleteValue: string = ''

  applyNormalAttribute(instance: SearchAttribute): void {
    instance.height(30)
    if(!this.isCallback){
      instance.onDidDelete(undefined);
    } else {
      instance.onDidDelete((info: DeleteValue) => {
        this.deleteValue = info.deleteValue;
      })
    }
  }
}

@Entry
@Component
struct SearchOnDidDelete1 {
  @State modifier1: MyTextModifier1 = new MyTextModifier1()
  build() {
    Column() {
      Text(this.modifier1.deleteValue)
        .id('deleteValueTextModifier').fontSize(10).width('100%').textAlign(TextAlign.Center).height('5%')

      Search()
        .id('onDidDeleteModifier')
        .width('95%')
        .height('10%')
        .attributeModifier(this.modifier1)
      Button(`callback: ${this.modifier1.isCallback}`)
        .id('changeModifierButton1')
        .onClick((e: ClickEvent)=>{
          this.modifier1.isCallback = !this.modifier1.isCallback;
        })
        .fontSize(20)
        .height('5%')
    }.height('100%').width('100%');
  }
}