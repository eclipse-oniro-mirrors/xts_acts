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
  wrapBuilder,
  SheetSize,
  TripleLengthDetents,
  SheetOptions
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import {
  Router,
  UIContext,
  ResolvedUIContext,
  CustomKeyboardContinueFeature
} from '@ohos.arkui.UIContext';
import { ComponentContent } from '@kit.ArkUI';

@Builder
function uiContextSheetBuilder() {
  Column() {
    Text('ui_context_sheet');
  }
  .width('100%')
  .height('100%');
}

@Entry
@Component
struct UIContextIndex {
  private static readonly OPEN_BIND_SHEET_KEY: string = 'uiContextOpenBindSheetStatus';
  private static readonly UPDATE_BIND_SHEET_KEY: string = 'uiContextUpdateBindSheetStatus';
  private static readonly CLOSE_BIND_SHEET_KEY: string = 'uiContextCloseBindSheetStatus';

  @State resolveUIContextStatus: string = 'init';
  @State getMagnifierStatus: string = 'init';
  @State getMeasureUtilsStatus: string = 'init';
  @State animateToImmediatelyStatus: string = 'init';
  @State getNavigationInfoByUniqueIdStatus: string = 'init';
  @State vp2pxStatus: string = 'init';
  @State getWindowIdStatus: string = 'init';
  @State openBindSheetStatus: string = 'init';
  @State updateBindSheetStatus: string = 'init';
  @State closeBindSheetStatus: string = 'init';
  @State setCustomKeyboardContinueFeatureStatus: string = 'init';

  private uiContext: UIContext = this.getUIContext();
  private sheetContent: ComponentContent<undefined> =
    new ComponentContent(this.uiContext, wrapBuilder(uiContextSheetBuilder));
  private sheetOpened: boolean = false;

  aboutToAppear() {
    try {
      const router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
      AppStorage.setOrCreate<string>(UIContextIndex.OPEN_BIND_SHEET_KEY, 'init');
      AppStorage.setOrCreate<string>(UIContextIndex.UPDATE_BIND_SHEET_KEY, 'init');
      AppStorage.setOrCreate<string>(UIContextIndex.CLOSE_BIND_SHEET_KEY, 'init');
    } catch (error) {
      console.error('UIContextIndex aboutToAppear error: ' + error);
    }
  }

  private sheetOptions(): SheetOptions {
    const options: SheetOptions = {
      detents: [SheetSize.MEDIUM, SheetSize.FIT_CONTENT, SheetSize.LARGE] as TripleLengthDetents
    };
    return options;
  }

  private setSheetStatus(key: string, status: string): void {
    AppStorage.setOrCreate<string>(key, status);
    AppStorage.set<string>(key, status);
  }

  private openBindSheetAsync(): void {
    const options: SheetOptions = this.sheetOptions();
    try {
      this.getUIContext().openBindSheet(this.sheetContent, options);
      this.sheetOpened = true;
      this.openBindSheetStatus = 'openBindSheet_ok';
      this.setSheetStatus(UIContextIndex.OPEN_BIND_SHEET_KEY, this.openBindSheetStatus);
    } catch (error) {
      console.error('openBindSheet error: ' + error);
      this.openBindSheetStatus = 'openBindSheet_fail';
      this.setSheetStatus(UIContextIndex.OPEN_BIND_SHEET_KEY, this.openBindSheetStatus);
    }
  }

  private updateBindSheetAsync(): void {
    const options: SheetOptions = this.sheetOptions();
    try {
      this.getUIContext().openBindSheet(this.sheetContent, options);
      this.getUIContext().updateBindSheet(this.sheetContent, options);
      this.updateBindSheetStatus = 'updateBindSheet_ok';
      this.setSheetStatus(UIContextIndex.UPDATE_BIND_SHEET_KEY, this.updateBindSheetStatus);
    } catch (error) {
      console.error('updateBindSheet error: ' + error);
      this.updateBindSheetStatus = 'updateBindSheet_fail';
      this.setSheetStatus(UIContextIndex.UPDATE_BIND_SHEET_KEY, this.updateBindSheetStatus);
    }
  }

  private closeBindSheetAsync(): void {
    const options: SheetOptions = this.sheetOptions();
    try {
      this.getUIContext().openBindSheet(this.sheetContent, options);
      this.getUIContext().closeBindSheet(this.sheetContent);
      this.sheetOpened = false;
      this.closeBindSheetStatus = 'closeBindSheet_ok';
      this.setSheetStatus(UIContextIndex.CLOSE_BIND_SHEET_KEY, this.closeBindSheetStatus);
    } catch (error) {
      console.error('closeBindSheet error: ' + error);
      this.closeBindSheetStatus = 'closeBindSheet_fail';
      this.setSheetStatus(UIContextIndex.CLOSE_BIND_SHEET_KEY, this.closeBindSheetStatus);
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Button('resolveUIContext')
        .id('uiContextResolveUIContextBtn')
        .height('4%')
        .onClick(() => {
          try {
            const resolved: ResolvedUIContext = UIContext.resolveUIContext();
            this.resolveUIContextStatus = resolved !== undefined ? 'resolveUIContext_ok' : 'resolveUIContext_fail';
          } catch (error) {
            this.resolveUIContextStatus = 'resolveUIContext_fail';
          }
        });
      Text(this.resolveUIContextStatus).key('uiContextResolveUIContextStatus').height('3%');

      Button('getMagnifier')
        .id('uiContextGetMagnifierBtn')
        .height('4%')
        .onClick(() => {
          try {
            const magnifier = this.getUIContext().getMagnifier();
            this.getMagnifierStatus = magnifier !== undefined ? 'getMagnifier_ok' : 'getMagnifier_fail';
          } catch (error) {
            this.getMagnifierStatus = 'getMagnifier_fail';
          }
        });
      Text(this.getMagnifierStatus).key('uiContextGetMagnifierStatus').height('3%');

      Button('getMeasureUtils')
        .id('uiContextGetMeasureUtilsBtn')
        .height('4%')
        .onClick(() => {
          try {
            const measureUtils = this.getUIContext().getMeasureUtils();
            this.getMeasureUtilsStatus = measureUtils !== undefined ? 'getMeasureUtils_ok' : 'getMeasureUtils_fail';
          } catch (error) {
            this.getMeasureUtilsStatus = 'getMeasureUtils_fail';
          }
        });
      Text(this.getMeasureUtilsStatus).key('uiContextGetMeasureUtilsStatus').height('3%');

      Button('animateToImmediately')
        .id('uiContextAnimateToImmediatelyBtn')
        .height('4%')
        .onClick(() => {
          try {
            this.getUIContext().animateToImmediately({ duration: 10 }, () => {
              this.animateToImmediatelyStatus = 'animateToImmediately_ok';
            });
          } catch (error) {
            this.animateToImmediatelyStatus = 'animateToImmediately_fail';
          }
        });
      Text(this.animateToImmediatelyStatus).key('uiContextAnimateToImmediatelyStatus').height('3%');

      Button('vp2px')
        .id('uiContextVp2pxBtn')
        .height('4%')
        .onClick(() => {
          try {
            const px: number = this.getUIContext().vp2px(10);
            this.vp2pxStatus = px >= 0 ? 'vp2px_ok' : 'vp2px_fail';
          } catch (error) {
            this.vp2pxStatus = 'vp2px_fail';
          }
        });
      Text(this.vp2pxStatus).key('uiContextVp2pxStatus').height('3%');

      Button('getWindowId')
        .id('uiContextGetWindowIdBtn')
        .height('4%')
        .onClick(() => {
          try {
            const windowId = this.getUIContext().getWindowId();
            this.getWindowIdStatus = (windowId === undefined || windowId >= 0) ? 'getWindowId_ok' : 'getWindowId_fail';
          } catch (error) {
            this.getWindowIdStatus = 'getWindowId_fail';
          }
        });
      Text(this.getWindowIdStatus).key('uiContextGetWindowIdStatus').height('3%');

      Button('openBindSheet')
        .id('uiContextOpenBindSheetBtn')
        .height('4%')
        .onClick(() => {
          this.openBindSheetAsync();
        });
      Text(this.openBindSheetStatus).key('uiContextOpenBindSheetStatus').height('3%');

      Button('updateBindSheet')
        .id('uiContextUpdateBindSheetBtn')
        .height('4%')
        .onClick(() => {
          this.updateBindSheetAsync();
        });
      Text(this.updateBindSheetStatus).key('uiContextUpdateBindSheetStatus').height('3%');

      Button('closeBindSheet')
        .id('uiContextCloseBindSheetBtn')
        .height('4%')
        .onClick(() => {
          this.closeBindSheetAsync();
        });
      Text(this.closeBindSheetStatus).key('uiContextCloseBindSheetStatus').height('3%');

      Button('setCustomKeyboardContinueFeature')
        .id('uiContextSetCustomKeyboardContinueFeatureBtn')
        .height('4%')
        .onClick(() => {
          try {
            this.getUIContext().setCustomKeyboardContinueFeature(CustomKeyboardContinueFeature.ENABLED);
            this.setCustomKeyboardContinueFeatureStatus = 'setCustomKeyboardContinueFeature_ok';
          } catch (error) {
            this.setCustomKeyboardContinueFeatureStatus = 'setCustomKeyboardContinueFeature_fail';
          }
        });
      Text(this.setCustomKeyboardContinueFeatureStatus).key('uiContextSetCustomKeyboardContinueFeatureStatus').height('3%');
    }
    .width('100%')
    .height('100%');
  }
}
