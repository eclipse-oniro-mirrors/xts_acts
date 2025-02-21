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

import featureAbility from "@ohos.ability.featureAbility";
import file from '@system.file';
import { Core, ExpectExtend, ReportExtend } from '@ohos/hypium';

@Entry
@Component
struct Index {
  private componentName: string = `FormProviderB`;

  aboutToAppear() {
    console.info(`${this.componentName} start run testcase!!!!`);

    featureAbility.getWant()
      .then((want: any) => {
        console.info(`${this.componentName} Operation successful. Data: ${JSON.stringify(want)}`);
        const core = Core.getInstance();
        const expectExtend = new ExpectExtend({
          'id': 'extend'
        });
        core.addService('expect', expectExtend);
        const reportExtend = new ReportExtend(file);
        core.addService('report', reportExtend);
        core.init();
        core.subscribeEvent('task', reportExtend);
        const configService = core.getDefaultService('config');
        configService.setConfig(want.parameters);
        core.execute();
      })
      .catch((error: any) => {
        console.error(`${this.componentName} Operation failed. Cause: ${JSON.stringify(error)}`);
      })
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Text(`Fms Main Ability Test`)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
  }
}
