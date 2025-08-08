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
import hilog from '@ohos.hilog';
import { application, common } from '@kit.AbilityKit';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';

const caseName: string = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_1100';

@Entry
@Component
struct setFontSizeAbility011 {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', caseName + 'setFontSizeAbility011 aboutToAppear');
  }
  private context = getContext(this) as common.UIAbilityContext;
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Button() {
          Text('set font null')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }
        .id('set and show')
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('1%')
        .height('1%')
        .onClick(() => {
          try {
            let applicationContext = application.getApplicationContext();
            applicationContext.setFontSizeScale(null);
            console.log(`${caseName} Succeed to set size of font.`);
            console.log(`${caseName} zhuhan font ` + this.context.config.fontSizeScale);
          } catch(error) {
            console.log(`${caseName} Failed to set size of font, error is ${JSON.stringify(error)}`);
            console.log(`${caseName} zhuhan err ` + error.code);
            let options: commonEventManager.CommonEventPublishData = {
              code: 0,
              data: error.code.toString()
            };
            commonEventManager.publish('setFontSize1100', options, (err: BusinessError) => {
              if(err) {
                hilog.error(0xFF00, 'testTag', caseName + 'PublishCallBack err = ' + JSON.stringify(err));
              } else {
                hilog.info(0xFF00, 'testTag', caseName + 'Publish success');
              }
            });
          }
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