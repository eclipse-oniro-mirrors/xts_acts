/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import mediaquery from '@ohos.mediaquery';
import window from '@ohos.window';
import common from '@ohos.app.ability.common';

let portraitFunc = null;

@Entry
@Component
struct RichEditorDoubleClick016 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  @State message: string = '';
  private changBoolean: boolean = true;
  listener = mediaquery.matchMediaSync('(orientation: 横屏)');

  onPortrait() {
  }

  aboutToAppear() {
    portraitFunc = this.onPortrait.bind(this);
    this.listener.on('change', portraitFunc);
  }

  private changeOrientation(isLandscape: boolean) {
    let context = getContext(this) as common.UIAbilityContext;
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }

  build() {
    Column() {

      Column() {
        Text('message:' + this.message).id('message')
        Button('changeOrientation').onClick(() => {
          this.changeOrientation(this.changBoolean);
          this.changBoolean = !this.changBoolean;
        }).id('changeOrientation')
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('0123456');
            this.controller.addTextSpan('abc');
            this.controller.addTextSpan('def');
          })
          .onSelectionChange((value: RichEditorRange) => {
            console.log('RichEditorController value:' + JSON.stringify(value));
            this.message = JSON.stringify(value);
          })
          .caretColor(Color.Red)
          .selectedBackgroundColor(Color.Green)
          .borderWidth(1)
          .borderColor(Color.Green)
          .id('RichEditorDoubleClick016')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('50%')
    }
  }
}