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
import { application, common, Want, wantConstant } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.message = 'Welcome';
        })
      Button() {
        Text('start plugin empty moduleName')
          .fontSize(36)
      }
      .padding(10)
      .onClick(async () => {
        let context = getContext(this) as common.UIAbilityContext;
        let want: Want = {
          abilityName: '111',
          bundleName: '111',
        };
        want.parameters = {};
        want.parameters[wantConstant.Params.DESTINATION_PLUGIN_ABILITY] = true;
        try {
          await context.startAbility(want);
        } catch (err) {
          hilog.info(0x0000, 'testTag', 'startFailed: ' + JSON.stringify(err));
        }
      })

      Button() {
        Text('start plugin not exist')
          .fontSize(36)
      }
      .padding(10)
      .onClick(async () => {
        let context = getContext(this) as common.UIAbilityContext;
        let want: Want = {
          abilityName: '111',
          bundleName: '111',
          moduleName: '111'
        };
        want.parameters = {};
        want.parameters[wantConstant.Params.DESTINATION_PLUGIN_ABILITY] = true;
        try {
          await context.startAbility(want);
        } catch (err) {
          hilog.info(0x0000, 'testTag', 'startFailed: ' + JSON.stringify(err));
        }
      })

      Button() {
        Text('create plugin module context')
          .fontSize(36)
      }
      .padding(10)
      .onClick(async () => {
        let context = getContext(this) as common.UIAbilityContext;
        try {
          await application.createPluginModuleContext(context, '', '');
        } catch (err) {
          hilog.info(0x0000, 'testTag', 'createContextFailed: ' + JSON.stringify(err));
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}