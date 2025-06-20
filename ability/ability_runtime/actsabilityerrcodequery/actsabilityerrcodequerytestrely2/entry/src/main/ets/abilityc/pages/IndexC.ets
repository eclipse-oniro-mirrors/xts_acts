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
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

let resultCode = 100;
// 返回给接口调用方AbilityResult信息
let abilityResult: common.AbilityResult = {
  // want,
  resultCode
};

@Entry
@Component
struct IndexC {
  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbilityC indexC aboutToAppear');
  }

  @State message: string = 'Hello World CCC';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('Terminate CCC')
          .type(ButtonType.Capsule)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('1%')
          .height('1%')
          .onClick(() => {
            try {
              let context = getContext(this) as common.UIAbilityContext;
              context.terminateSelfWithResult(abilityResult, (err: BusinessError) => {
                if (err.code) {
                  // 处理业务逻辑错误
                  console.error(`terminateSelfWithResult failed, code is ${err.code}, message is ${err.message}`);
                  return;
                }
                // 执行正常业务
                console.info('terminateSelfWithResult succeed');
              });
            } catch (err) {
              // 捕获同步的参数错误
              let code = (err as BusinessError).code;
              let message = (err as BusinessError).message;
              console.error(`terminateSelf failed, code is ${code}, message is ${message}`);
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}