/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { FormLink } from '@ohos.arkui.component';
import formProvider from '@ohos.app.form.formProvider';
import formInfo from '@ohos.app.form.formInfo';
import formError from '@ohos.application.formError';
import batteryInfo from '@ohos.batteryInfo';
import formBindingData from '@ohos.app.form.formBindingData';


const DOMAIN: int = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  message: string = 'var';

  aboutToAppear() {
    hilog.info(DOMAIN, TAG, `Index enter`);

    try {
      hilog.info(DOMAIN, TAG, `Index enter1 ${formInfo.PublishFormErrorCode.SUCCESS === 0}`);
    } catch (err) {
      hilog.info(DOMAIN, TAG, `Index enter1 ${err.message}`);
    }
    try {
      hilog.info(DOMAIN, TAG, `Index enter2 ${batteryInfo.BatteryCapacityLevel.LEVEL_FULL}`);
    } catch (err) {
      hilog.info(DOMAIN, TAG, `Index enter2 ${err.message}`);
    }
    try {
      hilog.info(DOMAIN, TAG, `Index enter3 ${formError.FormError.ERR_COMMON}`);
    } catch (err) {
      hilog.info(DOMAIN, TAG, `Index enter3 ${err.message}`);
    }
  }

  changeValue() {
    hilog.info(DOMAIN, TAG, 'changeValue enter');
    this.stateVar+='~'
  }

  build() {
    Column(undefined) {
      Text('Hellooooooooooooooooooo World').fontSize(20)

      Button('XtsFormBindingData.router.push').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick XtsFormBindingData.router.push');
          let aRouter = this.getUIContext().getRouter();
          try {
            aRouter.pushUrl({url: 'testform/pages/XtsFormBindingData'});
          } catch (err) {
            hilog.error(DOMAIN, TAG, `pushUrl error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

      Button('XtsFormComponent.router.push').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick XtsFormComponent.router.push');
          let aRouter = this.getUIContext().getRouter();
          try {
            aRouter.pushUrl({url: 'testform/pages/XtsFormComponent'});
          } catch (err) {
            hilog.error(DOMAIN, TAG, `pushUrl error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

      Button('XtsFormInfo.router.push').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick XtsFormInfo.router.push');
          let aRouter = this.getUIContext().getRouter();
          try {
            aRouter.pushUrl({url: 'testform/pages/XtsFormInfo'});
          } catch (err) {
            hilog.error(DOMAIN, TAG, `pushUrl error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

      Button('XtsFormLink.router.push').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick XtsFormLink.router.push');
          let aRouter = this.getUIContext().getRouter();
          try {
            aRouter.pushUrl({url: 'testform/pages/XtsFormLink'});
          } catch (err) {
            hilog.error(DOMAIN, TAG, `pushUrl error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

      Button('XtsFormProvider.router.push').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick XtsFormProvider.router.push');
          let aRouter = this.getUIContext().getRouter();
          try {
            aRouter.pushUrl({url: 'testform/pages/XtsFormProvider'});
          } catch (err) {
            hilog.error(DOMAIN, TAG, `pushUrl error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

      Button('XtsFormAgent.router.push').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick XtsFormAgent.router.push');
          let aRouter = this.getUIContext().getRouter();
          try {
            aRouter.pushUrl({url: 'testform/pages/XtsFormAgent'});
          } catch (err) {
            hilog.error(DOMAIN, TAG, `pushUrl error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

      Button('XtsFormObserver.router.push') .backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick XtsFormObserver.router.push');
          let aRouter = this.getUIContext().getRouter();
          try {
            aRouter.pushUrl({url: 'testform/pages/XtsFormObserver'});
          } catch (err) {
            hilog.error(DOMAIN, TAG, `pushUrl error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

        Button('XtsFormHost.router.push').backgroundColor('#ff35e288')
        .onClick((event: ClickEvent) => {
          hilog.info(DOMAIN, TAG, 'onClick XtsFormHost.router.push');
          let aRouter = this.getUIContext().getRouter();
          try {
            aRouter.pushUrl({ url: 'testform/pages/XtsFormHost' });
          } catch (err) {
            hilog.error(DOMAIN, TAG, `pushUrl error code: ${err?.code}, error message: ${err?.message}`);
          }
        })

      Text(this.stateVar).fontSize(20)
      Child({ stateVar: this.stateVar } as __Options_Child)
    }
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';
  build() {
    Text(this.stateVar).fontSize(50)
  }
}
