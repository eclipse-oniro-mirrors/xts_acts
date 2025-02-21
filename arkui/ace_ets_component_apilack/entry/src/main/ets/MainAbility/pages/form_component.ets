/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

@Entry
@Component
struct Index {
  @State formId: number = 0;
  @State bundle: string = "com.form.formsystemtestservicea.hmservice";
  @State ability: string = "com.form.formsystemtestservicea.hmservice.MainAbility";
  @State moduleName: string = "entry";
  @State name: string = "Form_Js001";
  @State allowUpate: boolean = true;
  @State isShowing: boolean = true;

  private dimension: FormDimension = FormDimension.Dimension_1_2;

  private deleteForm = false;
  private deleteId = "-1";
  private temporaryId="-1";
  private temporary = false;
  private castForm = false;

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
            .onUninstall((info) => {
              console.log("[FormComponent] onUninstall:" + JSON.stringify(info));
            })
            .onError((error) => {
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
