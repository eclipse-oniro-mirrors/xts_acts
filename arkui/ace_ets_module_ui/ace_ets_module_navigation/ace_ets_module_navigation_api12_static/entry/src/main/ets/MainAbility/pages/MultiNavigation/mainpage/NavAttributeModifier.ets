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
import {NavigationAttribute,AttributeModifier,Percentage} from '@ohos.arkui.component';
import {
  Observed
} from '@ohos.arkui.stateManagement';
@Observed
export class NavWidthRangeAttrModifier implements AttributeModifier<NavigationAttribute> {
  isApplicationSet: boolean = false;
  minHomeWidth: Percentage = '50%';
  maxHomeWidth: Percentage = '50%';

  applyNormalAttribute(instance: NavigationAttribute): void {
    if (this.isApplicationSet) {
      instance.navBarWidthRange([this.minHomeWidth, this.maxHomeWidth]);
    }
  }
}