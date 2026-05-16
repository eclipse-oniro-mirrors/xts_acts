'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
  Column,
  Text,
  Component,
  Entry,
  CommonMethod,
  AttributeModifier,
  SpringLoadingContext,
  FlexAlign,
} from '@ohos.arkui.component';
import { AppStorage } from '@ohos.arkui.stateManagement';

class CommonMethodRealChainModifier implements AttributeModifier<CommonMethod> {
  applyNormalAttribute(cm: CommonMethod): void {
    cm.background('#AABBCCDD', undefined);
    cm.enableClickSoundEffect(false);
    cm.onDragSpringLoading((_ctx: SpringLoadingContext): void => {}, undefined);
    cm.onNeedSoftkeyboard((): boolean => {
      return false;
    });
    cm.debugLine('CommonMethodApiProbe.ets:1', 'entry');
    AppStorage.setOrCreate<string>('cm_probe_chain', '1');
  }
}

class CommonMethodNullSpringModifier implements AttributeModifier<CommonMethod> {
  applyNormalAttribute(cm: CommonMethod): void {
    cm.onDragSpringLoading(null, undefined);
    AppStorage.setOrCreate<string>('cm_probe_null_spring', '1');
  }
}

@Entry
@Component
struct CommonMethodApiProbe {
  aboutToAppear(): void {
    AppStorage.setOrCreate<string>('common_method_probe', '1');
  }

  build() {
    Column() {
      Text('common method host')
        .fontSize(22)
        .id('commonMethodHost')
        .key('commonMethodHost')
        .attributeModifier(new CommonMethodRealChainModifier());
      Text('null spring host')
        .fontSize(18)
        .id('commonMethodNullSpringHost')
        .key('commonMethodNullSpringHost')
        .attributeModifier(new CommonMethodNullSpringModifier());
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}
