/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


const DOMAIN: number = 0x0000;
const TAG: string = 'testTag';

@Entry
@Component
struct MyStateSample {
  @State stateVar: string = 'state var';
  @State isFormLinkPage: boolean = false;
  message: string = 'var';

  aboutToAppear() {
    hilog.info(DOMAIN, TAG, `Index enter`);

    try {
      hilog.info(DOMAIN, TAG, `Index enter1 ${formInfo.PublishFormErrorCode.SUCCESS === 0}`);
    } catch (err: Error) {
      hilog.info(DOMAIN, TAG, `Index enter1 ${err.message}`);
    }
    try {
      hilog.info(DOMAIN, TAG, `Index enter2 ${batteryInfo.BatteryCapacityLevel.LEVEL_FULL}`);
    } catch (err: Error) {
      hilog.info(DOMAIN, TAG, `Index enter2 ${err.message}`);
    }
    try {
      hilog.info(DOMAIN, TAG, `Index enter3 ${formError.FormError.ERR_COMMON}`);
    } catch (err: Error) {
      hilog.info(DOMAIN, TAG, `Index enter3 ${err.message}`);
    }
  }

  changeValue() {
    this.stateVar+='~'

    // 使用callback异步回调
    hilog.info(DOMAIN, TAG, 'formProvider enter');

    let formId: string = '1671231085'; //用hap包装好的应用的卡片id
    try {
      formProvider.setFormNextRefreshTime(formId, 5, (error: BusinessError<void> | null) => {
        if (error?.code) {
          hilog.info(DOMAIN, TAG, `formProvider callback error, code:${error?.code}`);
        }
        hilog.info(DOMAIN, TAG, 'formProvider setFormNextRefreshTime callback success');
      });
      hilog.info(DOMAIN, TAG, 'formProvider setFormNextRefreshTime register success');
    } catch (error) {
      hilog.info(DOMAIN, TAG, 'formProvider setFormNextRefreshTime catch error' + error);
    }

    let formId2: string = '1671231085'; //用hap包装好的应用的卡片id
    try {
      await formProvider.setFormNextRefreshTime(formId2, 9);
      hilog.info(DOMAIN, TAG, `formProvider setFormNextRefreshTime success`);
    } catch (error) {
      hilog.info(DOMAIN, TAG, `formProvider setFormNextRefreshTime catch error, code:` + error);
    }

    hilog.info(DOMAIN, TAG, 'test into index build...');
  }

  build() {
    if (this.isFormLinkPage) {
      FormLink({
        action: 'message',
        abilityName: 'EntryAbility',
      }) {
        Column(undefined) {
          Button('Jump back').backgroundColor('#ff2fa6c8')
            .onClick((e: ClickEvent) => {
              hilog.info(DOMAIN, TAG, 'On Click Jump back');
              this.isFormLinkPage = false;
            })
        }
        .onAppear(() => {
          hilog.info(DOMAIN, TAG, 'FormLinkTest001 start 002999');
        })
      }
    } else {
      Column(undefined) {
        Text('Hellooooooooooooooooooo World').fontSize(20)

        Column(undefined) {
          Button('Jump to test formLink-StsSetAction').backgroundColor('#ff653dd2')
            .onClick((e: ClickEvent) => {
              hilog.info(DOMAIN, TAG, 'On Click Jump to test formLink');
              this.isFormLinkPage = true;
            })

          Button('click to test formProvider.setFormNextRefreshTime')
            .backgroundColor('#FFFF00FF')
            .onClick((e: ClickEvent) => {
              hilog.info(DOMAIN, TAG, 'On Click to test');
              this.changeValue()
            })

          Button('router.push').backgroundColor('#ff35e288')
            .onClick((e: ClickEvent) => {
              hilog.info(DOMAIN, TAG, 'onClick router.push');
              let aRouter = this.getUIContext().getRouter();
              try {
                aRouter.pushUrl({url: 'testform/pages/XtsFormLink'})
              } catch (e: Error) {
                hilog.info(DOMAIN, TAG, 'pushUrl error:' + e.message);
              }
            })

          Text(this.stateVar).fontSize(20)
          Child({ stateVar: this.stateVar } as __Options_Child)
        }
      }
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
