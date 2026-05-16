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

import { ExceptionPrompt, PromptOptions, MarginType } from '@ohos.arkui.advanced.ExceptionPrompt';

@Entry
@Component
struct Index {
  @State options: PromptOptions = {
    icon: $r('sys.media.ohos_ic_public_fail'),
    tip: '异常提示2',
    marginType: MarginType.FIT_MARGIN,
    actionText: '设置网络',
    marginTop: 80,
    isShown:true,
  }

  build() {
    Column() {
      ExceptionPrompt({
        options: this.options,
        onTipClick: () => {
          // Click the text on the left to change into the connecting state
        },
        onActionTextClick: () => {
          // Click Set Network to open the Set network pop-up interface
        },
      })
    }
  }
}