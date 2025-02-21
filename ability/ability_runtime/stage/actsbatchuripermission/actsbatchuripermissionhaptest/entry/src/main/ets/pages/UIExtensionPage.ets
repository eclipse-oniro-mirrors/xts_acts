/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

function logIndexUIExt(info) {
  console.info('SUB_Ability_AbilityRuntime_Uri_BatchAuthorization_Test MyUIExtensionPage ' + info);
}

@Entry
@Component
struct IndexUIExt {

  onPageShow() {
    logIndexUIExt('IndexUIExt onPageShow');
  }

  aboutToAppear(){
    logIndexUIExt('IndexUIExt aboutToAppear');
    logIndexUIExt('testcase = ' + globalThis.testcase);
    logIndexUIExt('filesDir = ' + globalThis.filesDir);
    logIndexUIExt('flags = ' + globalThis.flag);
    logIndexUIExt('preCount = ' + globalThis.preCount);
    logIndexUIExt('tempCount = ' + globalThis.tempCount);
  }

  build() {
    Row() {
      Column() {
        UIExtensionComponent({
          bundleName: 'com.example.myuiextension',
          abilityName: 'UIExtensionAbility',
          flags: globalThis.flag,
          uri: globalThis.fileUri,
          parameters: {
            'ability.params.stream': globalThis.uriList,
            testcase: globalThis.testcase,
            filesDir: globalThis.filesDir,
            preCount: globalThis.preCount,
            tempCount: globalThis.tempCount
          }
        }).width('100%').height('100%')
          .onResult(async (data)=>{
            let successCount = data.want.parameters.successCount;
            logIndexUIExt(' onResult：successCount = ' + successCount);
            if (globalThis.UIAbilityContext1 !== undefined) {
              globalThis.UIAbilityContext1.terminateSelfWithResult({
                want: { parameters: {'successCount': successCount}},
                resultCode: 0
              })
            } else {
              logIndexUIExt('UIAbilityContext1 is undefined!');
            }
          })
          .onReceive((data)=>{
            logIndexUIExt(' onReceive data = ' + data);
          })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
