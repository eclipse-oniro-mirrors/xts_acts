/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { UIContext } from '@ohos.arkui.UIContext';

export const UI_CONTEXT_IS_EASY_SPLIT_PAGE: string = 'MainAbility/pages/UIContext/UIContextIsEasySplitPage';
export const UI_CONTEXT_IS_EASY_SPLIT_STATUS_KEY: string = 'ohosTestUiContextIsEasySplitStatus';
export const UI_CONTEXT_IS_EASY_SPLIT_VALUE_KEY: string = 'ohosTestUiContextIsEasySplitValue';

@Entry
@Component
struct UIContextIsEasySplitPage {
  aboutToAppear(): void {
    AppStorage.setOrCreate(UI_CONTEXT_IS_EASY_SPLIT_STATUS_KEY, 'pending');
    try {
      let uiContext: UIContext = this.getUIContext();
      let easySplit: boolean = uiContext.isEasySplit();
      AppStorage.setOrCreate(UI_CONTEXT_IS_EASY_SPLIT_VALUE_KEY, easySplit);
      AppStorage.setOrCreate(UI_CONTEXT_IS_EASY_SPLIT_STATUS_KEY, 'ok');
    } catch (_e) {
      console.warn('[UIContextIsEasySplitPage] getUIContext / isEasySplit 异常（弱环境可忽略）');
      AppStorage.setOrCreate(UI_CONTEXT_IS_EASY_SPLIT_STATUS_KEY, 'fail');
    }
  }

  build() {
    Column({ space: 8 }) {
      Text('Instrument：UIContext.isEasySplit()')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
      Text('Route：MainAbility/pages/UIContext/UIContextIsEasySplitPage')
        .fontSize(11)
        .fontColor($r('sys.color.ohos_id_color_text_secondary'))
    }
    .width('100%')
    .height('100%')
    .padding({ left: 12, right: 12, top: 8, bottom: 32 })
  }
}
