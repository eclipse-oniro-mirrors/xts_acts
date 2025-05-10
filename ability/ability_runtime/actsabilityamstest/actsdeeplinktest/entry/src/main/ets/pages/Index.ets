/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { appManager, common, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@kit.BasicServicesKit';
import { systemParameterEnhance } from '@kit.BasicServicesKit';
function sleep(time: number){
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

@Entry
@Component
struct Index {
  aboutToAppear(): void {
    try {
      let info: string = systemParameterEnhance.getSync('persist.sys.abilityms.multi_process_model');
      console.log('1111',JSON.stringify(info));
    } catch(e) {
      console.log('getSync unexpected error: ' + e);
    }
  }
  @State message: string = 'appA';
//获取上下文对象
  context=getContext(this) as common.UIAbilityContext
  build() {
    Column({space:5}){
      Text(this.message)
        .id('appA')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      Button('仅配置action')
        .id('TestCase4')
        .onClick(() => {
          let want: Want = {
            parameters: {
              'ohos.ability.params.showDefaultPicker':true,


            },
           action:'-~!@#$ %^&*'
          }
          this.context.startAbility(want)
            .then(() => {
              hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility1');
            })
            .catch((error: BusinessError) => {
              hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility1 error');
            })

        })


    }
    .height('100%')
    .width('100%')
  }
}