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

import {
  Entry,
  Component,
  Builder,
  Column,
  ColumnOptions,
  Button,
  Text,
  wrapBuilder
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, UIContext, OverlayManager } from '@ohos.arkui.UIContext';
import { ComponentContent } from '@kit.ArkUI';

@Builder
function overlayBuilderA() {
  Text('overlay_content_a')
    .key('overlayTextA')
    .fontSize(18);
}

@Builder
function overlayBuilderB() {
  Text('overlay_content_b')
    .key('overlayTextB')
    .fontSize(18);
}

@Entry
@Component
struct OverlayManagerIndex {
  @State addStatus: string = 'init';
  @State addOrderStatus: string = 'init';
  @State hideStatus: string = 'init';
  @State showAllStatus: string = 'init';
  @State removeStatus: string = 'init';

  private uiContext: UIContext = this.getUIContext();
  private contentA: ComponentContent<undefined> =
    new ComponentContent(this.uiContext, wrapBuilder(overlayBuilderA));
  private contentB: ComponentContent<undefined> =
    new ComponentContent(this.uiContext, wrapBuilder(overlayBuilderB));
  private hasAddedA: boolean = false;
  private hasAddedB: boolean = false;

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('OverlayManagerIndex aboutToAppear error: ' + error);
    }
  }

  aboutToDisappear() {
    let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
    try {
      if (this.hasAddedA) {
        overlayManager.removeComponentContent(this.contentA);
      }
    } catch (error) {
      console.error('remove contentA in aboutToDisappear error: ' + error);
    }
    try {
      if (this.hasAddedB) {
        overlayManager.removeComponentContent(this.contentB);
      }
    } catch (error) {
      console.error('remove contentB in aboutToDisappear error: ' + error);
    }
    this.hasAddedA = false;
    this.hasAddedB = false;
  }

  private safeAddA() {
    let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
    if (!this.hasAddedA) {
      overlayManager.addComponentContent(this.contentA, 0);
      this.hasAddedA = true;
    }
  }

  private safeAddB() {
    let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
    if (!this.hasAddedB) {
      overlayManager.addComponentContentWithOrder(this.contentB);
      this.hasAddedB = true;
    }
  }

  build() {
    Column({ space: 10 } as ColumnOptions) {
      Button('addComponentContent')
        .id('addContent')
        .height('6%')
        .onClick(() => {
          try {
            this.safeAddA();
            this.addStatus = 'add_ok';
          } catch (error) {
            this.addStatus = 'add_fail';
            console.error('addComponentContent error: ' + error);
          }
        });

      Text(this.addStatus).key('addStatus').height('4%');

      Button('addComponentContentWithOrder')
        .id('addContentWithOrder')
        .height('6%')
        .onClick(() => {
          try {
            this.safeAddB();
            this.addOrderStatus = 'add_order_ok';
          } catch (error) {
            this.addOrderStatus = 'add_order_fail';
            console.error('addComponentContentWithOrder error: ' + error);
          }
        });

      Text(this.addOrderStatus).key('addOrderStatus').height('4%');

      Button('hideComponentContent')
        .id('hideContent')
        .height('6%')
        .onClick(() => {
          try {
            let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
            this.safeAddA();
            overlayManager.hideComponentContent(this.contentA);
            this.hideStatus = 'hide_ok';
          } catch (error) {
            this.hideStatus = 'hide_fail';
            console.error('hideComponentContent error: ' + error);
          }
        });

      Text(this.hideStatus).key('hideStatus').height('4%');

      Button('showAllComponentContents')
        .id('showAllContents')
        .height('6%')
        .onClick(() => {
          try {
            let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
            this.safeAddA();
            overlayManager.showAllComponentContents();
            this.showAllStatus = 'show_all_ok';
          } catch (error) {
            this.showAllStatus = 'show_all_fail';
            console.error('showAllComponentContents error: ' + error);
          }
        });

      Text(this.showAllStatus).key('showAllStatus').height('4%');

      Button('removeComponentContent')
        .id('removeContent')
        .height('6%')
        .onClick(() => {
          try {
            let overlayManager: OverlayManager = this.getUIContext().getOverlayManager() as OverlayManager;
            this.safeAddB();
            overlayManager.removeComponentContent(this.contentB);
            this.hasAddedB = false;
            this.removeStatus = 'remove_ok';
          } catch (error) {
            this.removeStatus = 'remove_fail';
            console.error('removeComponentContent error: ' + error);
          }
        });

      Text(this.removeStatus).key('removeStatus').height('4%');
    }
    .width('100%')
    .height('100%');
  }
}
