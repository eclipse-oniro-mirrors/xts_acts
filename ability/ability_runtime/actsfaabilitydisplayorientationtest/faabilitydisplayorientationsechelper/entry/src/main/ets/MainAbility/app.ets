/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import featureAbility from '@ohos.ability.featureAbility';
import bundle from '@ohos.bundle';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import CommonEventManager from '@ohos.commonEventManager';

class Test {
  onCreate() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onCreate');
  }
  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onDestroy');
  }
  onActive() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Application onActive');
    featureAbility.getWant((error: BusinessError, want: Want) => {
      hilog.info(0x0000, 'testTag', '%{public}s', `get want: ${JSON.stringify(want)}`);
      let number = want.parameters?.number;
      switch (number) {
        case 7:
          featureAbility.getContext().getDisplayOrientation((err, data) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation data: ${data}`);
            if (bundle.DisplayOrientation.UNSPECIFIED == data) {
              featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.LANDSCAPE).then(() => {
                featureAbility.getContext().getDisplayOrientation((error, value) => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation2 data: ${value}`);
                  if (bundle.DisplayOrientation.LANDSCAPE == value) {
                    featureAbility.startAbility(
                      {
                        want: {
                          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
                          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
                          parameters: {
                            number: number
                          }
                        }
                      }
                    ).then(data => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `fa startAbility data: ${data}`);
                      featureAbility.terminateSelf();
                    }, ((err: BusinessError) => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `fa startAbility err: ${JSON.stringify(err)}`);
                    }))
                  }
                })
              })
            }
          })
          break;
        case 8:
          featureAbility.getContext().getDisplayOrientation((err, data) => {
            hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation data: ${data}`);
            if (bundle.DisplayOrientation.UNSPECIFIED == data) {
              featureAbility.getContext().setDisplayOrientation(bundle.DisplayOrientation.PORTRAIT).then(() => {
                featureAbility.getContext().getDisplayOrientation((error, value) => {
                  hilog.info(0x0000, 'testTag', '%{public}s', `getDisplayOrientation2 data: ${value}`);
                  if (bundle.DisplayOrientation.PORTRAIT == value) {
                    featureAbility.startAbility(
                      {
                        want: {
                          bundleName: 'com.ohos.actsfaabilitydisplayorientationhelper',
                          abilityName: 'com.ohos.actsfaabilitydisplayorientationhelper.FourthAbility',
                          parameters: {
                            number: number
                          }
                        }
                      }
                    ).then(data => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `fa startAbility data: ${data}`);
                      featureAbility.terminateSelf();
                    }, ((err: BusinessError) => {
                      hilog.info(0x0000, 'testTag', '%{public}s', `fa startAbility err: ${JSON.stringify(err)}`);
                    }))
                  }
                })
              })
            }
          })
          break;
      }
    })
  }
}

export default new Test()