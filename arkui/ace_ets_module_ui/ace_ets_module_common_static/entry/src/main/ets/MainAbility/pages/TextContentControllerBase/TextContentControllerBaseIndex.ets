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
import { Entry, Component, Column, Button, Text, StyledString, TextRange, TextInput, TextInputController } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TextContentControllerBaseIndex {
  @State setStyledPlaceholderStatus: string = 'init';
  @State deleteBackwardStatus: string = 'init';
  @State scrollToVisibleStatus: string = 'init';
  private controller: TextInputController = new TextInputController();

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('TextContentControllerBaseIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      TextInput({
        placeholder: 'text_content_controller',
        controller: this.controller
      })
        .id('textContentControllerInput')
        .height('8%');

      Button('setStyledPlaceholder')
        .id('textContentSetStyledPlaceholderBtn')
        .height('8%')
        .onClick(() => {
          try {
            this.controller.setStyledPlaceholder(new StyledString('placeholder'));
            this.setStyledPlaceholderStatus = 'setStyledPlaceholder_ok';
          } catch (error) {
            this.setStyledPlaceholderStatus = 'setStyledPlaceholder_fail';
          }
        });
      Text(this.setStyledPlaceholderStatus).key('textContentSetStyledPlaceholderStatus').height('5%');

      Button('deleteBackward')
        .id('textContentDeleteBackwardBtn')
        .height('8%')
        .onClick(() => {
          try {
            this.controller.deleteBackward();
            this.deleteBackwardStatus = 'deleteBackward_ok';
          } catch (error) {
            this.deleteBackwardStatus = 'deleteBackward_fail';
          }
        });
      Text(this.deleteBackwardStatus).key('textContentDeleteBackwardStatus').height('5%');

      Button('scrollToVisible')
        .id('textContentScrollToVisibleBtn')
        .height('8%')
        .onClick(() => {
          try {
            this.controller.scrollToVisible({ start: 0, end: 1 } as TextRange);
            this.scrollToVisibleStatus = 'scrollToVisible_ok';
          } catch (error) {
            this.scrollToVisibleStatus = 'scrollToVisible_fail';
          }
        });
      Text(this.scrollToVisibleStatus).key('textContentScrollToVisibleStatus').height('5%');
    }
    .width('100%')
    .height('100%');
  }
}
