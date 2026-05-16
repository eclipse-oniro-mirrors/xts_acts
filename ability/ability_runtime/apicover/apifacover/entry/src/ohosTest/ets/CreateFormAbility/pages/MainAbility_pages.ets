/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import AbilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../../test/List.test';

@Entry
@Component
struct Index1 {
  @State message: string = 'CreateFormAbility';
  @State isShowing: boolean = true;
  @State formId: number = 0;
  @State bundle: string = "com.example.apicoverhaptest";
  @State ability: string = "FormAbility";
  @State moduleName: string = "entry";
  @State name: string = "form1";
  @State allowUpate: boolean = true;
  private dimension: FormDimension = FormDimension.Dimension_2_2;
  private temporary = false;

  aboutToAppear() {
    this.isShowing = AppStorage.get<boolean>("isCreateForm")!;
  }

  build() {
    Row() {
      Column() {
        if (this.isShowing) {
          FormComponent({
            id: this.formId,
            name: this.name,
            bundle: this.bundle,
            ability: this.ability,
            module: this.moduleName,
            dimension: this.dimension,
            temporary: this.temporary,
          })
            .allowUpdate(this.allowUpate)
            .visibility(this.isShowing ? Visibility.Visible : Visibility.Hidden)
            .size({ width: 360, height: 360 })
            .onAcquired((form) => {
              console.log("[FormComponent.host] get form, form id:" + form.id);
            })
        }
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}