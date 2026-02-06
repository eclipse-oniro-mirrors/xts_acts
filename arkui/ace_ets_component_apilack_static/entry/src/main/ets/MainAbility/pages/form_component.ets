'use static';
/*
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
import {
  Color,
  Column,
  Component,
  Entry,
  ErrorInformation,
  FormCallbackInfo,
  FormComponent,
  FormDimension,
  Text,
  Visibility
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct Index {
  @State formId: long = 0;
  @State bundle: string = "com.form.formsystemtestservicea.hmservice";
  @State ability: string = "com.form.formsystemtestservicea.hmservice.MainAbility";
  @State moduleName: string = "entry";
  @State name: string = "Form_Js001";
  @State allowUpate: boolean = true;
  @State isShowing: boolean = true;
  private dimension: FormDimension = FormDimension.Dimension_1_2;
  private deleteForm: boolean = false;
  private deleteId: string = "-1";
  private temporaryId: string = "-1";
  private temporary: boolean = false;
  private castForm: boolean = false;

  build() {
    Column() {
      Text('form component test begin')
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
          .onUninstall((info: FormCallbackInfo) => {
            console.log("[FormComponent] onUninstall:" + JSON.stringify(info));
          })
          .onError((error: ErrorInformation) => {
            console.log("[FormComponent.host] error code:" + error.errcode);
            console.log("[FormComponent.host] error msg:" + error.msg);
          })
      }
      .backgroundColor(Color.White)

      Text('form component test end')
    }
    .backgroundColor(Color.White)
  }
}
