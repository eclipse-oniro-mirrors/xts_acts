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

@Entry
@Component
struct Index {
  aboutToAppear(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility index aboutToAppear');
  }

  private context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize('1%')
          .fontWeight(FontWeight.Bold)
        Button() {
          Text('next page')
            .fontSize('1%')
            .fontWeight(FontWeight.Bold)
        }
        .size({ width: '1%', height: '1%' })
        .type(ButtonType.Capsule)
        .backgroundColor('#0D9FFB')
        .width('35%')
        .height('5%')
        .onClick(() => {
        })

        EmbeddedComponent({
          bundleName: "com.test.actssetfontsizetest",
          abilityName: "TestUIExtensionAbility",
        }, EmbeddedType.EMBEDDED_UI_EXTENSION)
          .width('100%')
          .height('90%')
          .onTerminated((info) => {
            let TAG = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_TestPageIndex';
            hilog.info(0x0000, TAG, '[%{public}s] EmbeddedComponent onTerminated, info: [%{public}s]', TAG, JSON.stringify(info));
            this.message = 'Termination: code = ' + info.code + ', want = ' + JSON.stringify(info.want);
            this.context.terminateSelf()
          })
          .onError((error) => {
            let TAG = 'SUB_Ability_AbilityRuntime_setFontSizeAtApp_TestPageIndex';
            hilog.info(0x0000, TAG, '[%{public}s] EmbeddedComponent onError, error: [%{public}s]', TAG, JSON.stringify(error));
            this.message = 'EmbeddedComponent Error: code = ' + error.code + ', message = ' + error.message;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}