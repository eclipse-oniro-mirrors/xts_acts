/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import hilog from '@ohos.hilog';
import { common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const TAG: string = 'actsAbilityRunTimeTest-Page ';

@Entry
@Component
struct IndexFeature {
  private context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private TAG = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_IndexFeature';
  @State message: string = 'message';

  aboutToAppear(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'FeatureAbility index aboutToAppear');
  }

  onPageShow(): void {
    hilog.info(0x0000, TAG, '%{public}s', 'FeatureAbility index onPageShow');
  }

  build() {
    Row() {
      Column() {
        Text('Hello Feature')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button('getFontSizeScale')
          .id('getFontSizeScaleButton')
          .size({ width: '1%', height: '1%' })
          .onClick(() => {
            let config = this.context.config;
            this.message = JSON.stringify(config);
            let options: commonEventManager.CommonEventPublishData = {
              code: 1,
              parameters: {
                'from': 'Rely_IndexFeature_getFontSizeScale',
                'fontSize': config.fontSizeScale
              }
            };
            commonEventManager.publish('Rely_IndexFeature_getFontSizeScale', options, (err: BusinessError) => {
              if (err) {
                hilog.info(0x0000, this.TAG, "[%{public}s] PublishCallBack err: %{public}s", this.TAG, JSON.stringify(err));
              } else {
                hilog.info(0x0000, this.TAG, "[%{public}s] Publish success", this.TAG);
              }
            });
            try {
              this.context.terminateSelf((err: BusinessError) => {
                if (err.code) {
                  hilog.info(0x0000, this.TAG, "[%{public}s] terminateSelf failed, err: %{public}s", this.TAG, JSON.stringify(err));
                  return;
                }
                hilog.info(0x0000, this.TAG, "[%{public}s] terminateSelf succeed", this.TAG);
              });
            } catch (paramErr) {
              hilog.info(0x0000, this.TAG, "[%{public}s] terminateSelf failed, paramErr: %{public}s", this.TAG, JSON.stringify(paramErr));
            }
          })
          .margin({top: 10})
        Text(this.message)
          .margin({top: 10})
      }
      .width('100%')
    }
    .height('100%')
  }
}