/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { InputMethodListDialog, Pattern, PatternOptions } from '@kit.IMEKit';

@Entry
@Component
export struct settingsItem {
  @State defaultPattern: number = 1;
  private oneHandAction: PatternOptions = {
    defaultSelected: this.defaultPattern,
    patterns: [
      {
        icon: $r('app.media.icon'),
        selectedIcon: $r('app.media.icon')
      },
      {
        icon: $r('app.media.icon'),
        selectedIcon: $r('app.media.icon')
      },
      {
        icon: $r('app.media.icon'),
        selectedIcon: $r('app.media.icon'),
      }],
    action:(index: number)=>{
      console.info(`pattern is changed, current is ${index}`);
      this.defaultPattern = index;
    }
  };
  private listController: CustomDialogController = new CustomDialogController({
    builder: InputMethodListDialog({ patternOptions: this.oneHandAction }),
    customStyle: true,
    maskColor: '#00000000'
  });

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column,
        alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text("inputMethodList").fontSize(20).id('input1')
      }
    }
    .width("100%")
    .id('bindInputMethod')
    .onClick((event?: ClickEvent) => {
      this.listController.open();
    })
  }
}