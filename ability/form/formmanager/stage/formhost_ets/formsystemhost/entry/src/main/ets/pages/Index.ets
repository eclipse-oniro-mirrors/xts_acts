/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import formInfo from '@ohos.app.form.formInfo';
import formHost from '@ohos.app.form.formHost';
import Want from '@ohos.app.ability.Want';
import CommonEventManager from '@ohos.commonEventManager';
import { BusinessError } from '@ohos.base';

interface InfoType {id:number}

@Entry
@Component
struct Index {
  @State formId: string = "0";
  @State bundle: string = "com.example.getformsinfotest";
  @State ability: string = "EntryFormAbility";
  @State moduleName: string = "entry";
  @State name: string = "widget";

  private dimension: FormDimension = FormDimension.Dimension_1_2;

  private TAG = `[FormComponent.host]`;

  private isFormLocation: boolean = false;
  private formLocation: formInfo.FormLocation = formInfo.FormLocation.OTHER;
  private updateFormSize: boolean = false;
  private isTestFormId: boolean = false;
  private isTestRect: boolean = false;
  private newDimension: formInfo.FormDimension = formInfo.FormDimension.Dimension_1_2;
  private testFormId: string = "-1";
  private formOnUpdataSizeEvent = "FMS_FormOnUpdateSize_commonEvent";

  private publishUpdateSizeCallBack = () => {
    console.debug(`====>${this.TAG} formsystemhost formUpdateSizeEventCallBack ====>`);
  }

  aboutToAppear() {
    console.log(`${this.TAG} aboutToAppear start`);
    let want = AppStorage.get<Want>('want') as Want;
    console.info(`${this.TAG} aboutToAppear:${JSON.stringify(want)}`);
    if(want.parameters) {
      this.name = want.parameters.name as string;
    }
    if(want.parameters) {
      this.bundle = want.parameters.bundle as string;
    }
    if(want.parameters) {
      this.ability = want.parameters.ability as string;
    }
    if(want.parameters) {
      this.moduleName = want.parameters.moduleName as string;
    }
    if (want.parameters) {
      this.updateFormSize = want.parameters.updateFormSize as boolean;
    }
    if (want.parameters) {
      this.newDimension = want.parameters.newDimension as number;
    }
    if (want.parameters) {
      this.isTestFormId = want.parameters.isTestFormId as boolean;
    }
    if (want.parameters) {
      this.testFormId = want.parameters.testFormId as string;
    }
    if (want.parameters) {
      this.isTestRect = want.parameters.isTestRect as boolean;
    }
    if (want.parameters) {
      this.isFormLocation = want.parameters.isFormLocation as boolean;
    }
    if (want.parameters) {
      this.formLocation = want.parameters.formLocation as number;
    }
    console.info(`${this.TAG} aboutToAppear end:${this.bundle},${this.ability},${this.updateFormSize}`);
  }

  build() {
    Column() {
      Text('form component test begin1')
      Column() {
        FormComponent({
          id: this.formId,
          name: this.name,
          bundle: this.bundle,
          ability: this.ability,
          module: this.moduleName,
          dimension: this.dimension,
        })
          .width(100)
          .height(100)
          .border({ width: 1 })
          .margin({ top: 10, bottom: 10 })
          .onAcquired((form:InfoType) => {
            console.log(`${this.TAG} onAcquired start`);
            this.formId = form.id.toString();
            if (this.isFormLocation) {
              setTimeout(() => {
                try {
                  formHost.updateFormLocation(this.formId, this.formLocation);
                } catch (error) {
                  console.error(`catch error, code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`);
                }
              }, 1000);
            } else if (this.updateFormSize) {
              if (!this.isTestFormId) {
                this.testFormId = form.id.toString();
              }
              setTimeout(() => {
                try {
                  let newRect: formInfo.Rect|null = {left: 1, top: 2, width: 100, height: 100};
                  if (this.isTestRect) {
                    newRect = null;
                  }
                  formHost.updateFormSize(this.testFormId, this.newDimension, newRect);
                } catch (error) {
                  console.error(`catch error, code: ${(error as BusinessError).code}, message: ${(error as BusinessError).message}`);
                  let commonEventPublishData:CommonEventManager.CommonEventPublishData = {
                    code: (error as BusinessError).code,
                    parameters: {
                      "formId" : this.formId
                    }
                  };
                  CommonEventManager.publish(this.formOnUpdataSizeEvent, commonEventPublishData, this.publishUpdateSizeCallBack);
                }
              }, 1000);
            }
          })
          .onError((error) => {
            console.log(`${this.TAG} error code:` + error.errcode);
            console.log(`${this.TAG} error msg:` + error.msg);
          })
      }
      .width('100%')
      Text('form component test end1')
    }
  }
}
