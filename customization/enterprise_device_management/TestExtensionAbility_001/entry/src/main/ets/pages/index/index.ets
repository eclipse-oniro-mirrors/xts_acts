/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import file from '@system.file';
import { Core, ExpectExtend, InstrumentLog, ReportExtend } from "deccjsunit/index"
@Entry
@Component
struct Index {
  aboutToAppear() {
    console.info("start run testcase!!!!")
    const core = Core.getInstance()
    const expectExtend = new ExpectExtend({
      'id': 'extend'
    })
    core.addService('expect', expectExtend)
    const reportExtend = new ReportExtend(file)

    core.addService('report', reportExtend)
    core.init()
    core.subscribeEvent('task', reportExtend)
    console.info("subscribeEvent run !!!!")
    const configService = core.getDefaultService('config')
    console.info('parameters---->' + JSON.stringify(globalThis.abilityWant.parameters))
    configService.setConfig(globalThis.abilityWant.parameters)
    core.execute()
  }
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
      Text('MainAbility')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
        .width('100%')
      .height('100%')
  }
}