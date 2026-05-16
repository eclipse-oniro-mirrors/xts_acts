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
import { BusinessError } from "@ohos.base";
import commonEventManager from '@ohos.commonEventManager'
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { Component, ClickEvent, Button, Column } from '@ohos.arkui.component'

@Component
export struct StatusClickComponent {
  public isLandScape: boolean = false;

  private changeOrientation(isLandscape: boolean) {
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    window.getLastWindow(context).then((lastWindow) => {
      lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    });
  }

  build() {
    Column() {
      Button('Top').onClick((e:ClickEvent) => {
        try {
          commonEventManager.publish('usual.event.CLICK_STATUSBAR', (err: BusinessError | null) => {
            console.log('Publish statusBar click');
            if (err) {
              console.error(`publish failed, code is ${err.code}, message is ${err.message}`);
            } else {
              console.info('publish success');
            }
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(`publish failed, code is ${err.code}, message is ${err.message}`);
        }
      }).width(100).height(40).margin(5).id('Top')
    }
  }
}