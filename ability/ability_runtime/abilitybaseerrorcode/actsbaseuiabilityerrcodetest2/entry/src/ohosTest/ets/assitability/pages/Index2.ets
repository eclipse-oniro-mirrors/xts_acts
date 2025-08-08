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
import hilog from '@ohos.hilog';
let testAbilityWant:Want;
@Entry
@Component
struct Index222 {
   aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility2 index aboutToAppear');
    testAbilityWant = AppStorage.get<Want>('TestAbilityWant') as Want;
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility2 index aboutToAppear ' + JSON.stringify(testAbilityWant));
  }

  build() {
    Column() {
      Text("test").margin(20)
      EmbeddedComponent({
        bundleName: "com.acts.ability.errcode",
        abilityName: "TestEmbeddedUIExtAbility",
        parameters:{
            "case":testAbilityWant?.parameters?.case as string,
            "caseName":testAbilityWant?.parameters?.caseName as string
        }
      }, EmbeddedType.EMBEDDED_UI_EXTENSION)
        .width('50%')
        .height('50%')
        .borderWidth(2)
        .borderColor(Color.Blue)
        .onTerminated((info) => {
          console.info("assitability onTerminated")
        })
        .onError((error) => {
          console.info("assitability error")
        })
    }

    .height('100%')
    .width('100%')
  }
}