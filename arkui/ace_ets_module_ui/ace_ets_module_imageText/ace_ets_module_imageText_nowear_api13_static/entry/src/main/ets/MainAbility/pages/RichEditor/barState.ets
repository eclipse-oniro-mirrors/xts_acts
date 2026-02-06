'use static';
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

import { ResourceColor, Entry, Component,RichEditorController,RichEditorOptions,Column,RichEditor,FlexAlign,BarState, ImageFit, } from '@ohos.arkui.component';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'

@Entry
@Component
struct RichEditorBarState {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  controller3: RichEditorController = new RichEditorController();
  controller4: RichEditorController = new RichEditorController();
  controller5: RichEditorController = new RichEditorController();
  options1: RichEditorOptions = { controller: this.controller1 } as RichEditorOptions;
  options2: RichEditorOptions = { controller: this.controller2 } as RichEditorOptions;
  options3: RichEditorOptions = { controller: this.controller3 } as RichEditorOptions;
  options4: RichEditorOptions = { controller: this.controller4 } as RichEditorOptions;
  options5: RichEditorOptions = { controller: this.controller5 } as RichEditorOptions;

  build() {
    Column() {
      RichEditor(this.options1)
        .barState(BarState.Auto)
        .id('RichEditor_BarState_Auto')
        .height('5%').borderWidth(1)
       .onReady(():void => {
          this.controller1.addTextSpan('BarState.Auto')
        })

      RichEditor(this.options2)
        .barState(BarState.Off)
        .id('RichEditor_BarState_Off')
        .height('5%').borderWidth(1)
        .onReady(():void => {
          this.controller2.addTextSpan('BarState.Off')
        })

      RichEditor(this.options3)
        .barState(BarState.On)
        .id('RichEditor_BarState_On')
        .height('5%').borderWidth(1)
       .onReady(():void => {
          this.controller3.addTextSpan('BarState.On')
        })

      RichEditor(this.options4)
        .id('RichEditor_barState_default')
        .height('5%').borderWidth(1)
       .onReady(():void => {
          this.controller4.addTextSpan('default')
        })

      RichEditor(this.options5)
        .barState(undefined)
        .id('RichEditor_barState_undefined')
        .height('5%').borderWidth(1)
       .onReady(():void => {
          this.controller5.addTextSpan('undefined')
        })
    }.justifyContent(FlexAlign.Center)
  }
}