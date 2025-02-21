// @ts-nocheck
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

@Entry
@Component
struct Index {
  @State message: string = 'FormHostAbility'
  @State isShowing: boolean = true;

  @State formId: number = 0;
  @State bundle: string = "com.example.apicoverhaptest";
  @State ability: string = "FormAbility";
  @State moduleName: string = "phone";
  @State name: string = "widget";
  private dimension: FormDimension = FormDimension.Dimension_2_1;
  private temporary = false;

  build() {
    Row() {
      Column() {
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
          .onAcquired((form) => {
            console.log("[FormComponent.FormHostAbility] get form, form id:" + form.id);
            globalThis.formId21 = form.id
          })
          .onError((error) => {
            console.log("[FormComponent.FormHostAbility] error code:" + error.errcode);
            console.log("[FormComponent.FormHostAbility] error msg:" + error.msg);
          })
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}