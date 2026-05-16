/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Animator as animator, AnimatorResult, AnimatorOptions, SimpleAnimatorOptions } from '@kit.ArkUI';

@Entry
@Component
struct CreateNullUndefinedTest {
  private animatorResult: AnimatorResult | undefined = undefined;
  private animatorResultApi9: AnimatorResult | undefined = undefined;
  private animatorResultApi18: AnimatorResult | undefined = undefined;
  @State columnWidth: number = 100;
  @State columnHeight: number = 100;
  private defaultOptions: AnimatorOptions = {
    duration: 1500,
    easing: 'ease',
    delay: 0,
    fill: 'forwards',
    direction: 'normal',
    iterations: 1,
    begin: 100,
    end: 200
  };

  aboutToDisappear() {
    this.animatorResult?.finish();
    this.animatorResult = undefined;
    this.animatorResultApi9?.finish();
    this.animatorResultApi9 = undefined;
    this.animatorResultApi18?.finish();
    this.animatorResultApi18 = undefined;
  }

  build() {
    Column() {
      // ========== API 9 create tests ==========
      Text('API 9 create with null')
        .width('100%')
        .height(30)
        .id('api9_create_null')
        .fontSize(16)

      Button('API9 CreateNull')
        .id('btn_api9_create_null')
        .onClick(() => {
          try {
            this.animatorResultApi9 = animator.create(null);
            console.info('[api9_create_null] SUCCESS', JSON.stringify(this.animatorResultApi9));
          } catch (error) {
            console.info('[api9_create_null] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      Text('API 9 create with undefined')
        .width('100%')
        .height(30)
        .id('api9_create_undefined')
        .fontSize(16)

      Button('API9 CreateUndefined')
        .id('btn_api9_create_undefined')
        .onClick(() => {
          try {
            this.animatorResultApi9 = animator.create(undefined);
            console.info('[api9_create_undefined] SUCCESS', JSON.stringify(this.animatorResultApi9));
          } catch (error) {
            console.info('[api9_create_undefined] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      Divider().color(Color.Gray).margin({ top: 10, bottom: 10 })

      // ========== API 18 create tests ==========
      Text('API 18 create with AnimatorOptions null')
        .width('100%')
        .height(30)
        .id('api18_create_null')
        .fontSize(16)

      Button('API18 CreateNull')
        .id('btn_api18_create_null')
        .onClick(() => {
          try {
            this.animatorResultApi18 = animator.create(null);
            console.info('[api18_create_null] SUCCESS', JSON.stringify(this.animatorResultApi18));
          } catch (error) {
            console.info('[api18_create_null] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      Text('API 18 create with AnimatorOptions undefined')
        .width('100%')
        .height(30)
        .id('api18_create_undefined')
        .fontSize(16)

      Button('API18 CreateUndefined')
        .id('btn_api18_create_undefined')
        .onClick(() => {
          try {
            this.animatorResultApi18 = animator.create(undefined);
            console.info('[api18_create_undefined] SUCCESS', JSON.stringify(this.animatorResultApi18));
          } catch (error) {
            console.info('[api18_create_undefined] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      Text('API 18 create with SimpleAnimatorOptions null')
        .width('100%')
        .height(30)
        .id('api18_create_simple_null')
        .fontSize(16)

      Button('API18 CreateSimpleNull')
        .id('btn_api18_create_simple_null')
        .onClick(() => {
          try {
            let nullSimple: SimpleAnimatorOptions | null = null;
            this.animatorResultApi18 = animator.create(nullSimple);
            console.info('[api18_create_simple_null] SUCCESS', JSON.stringify(this.animatorResultApi18));
          } catch (error) {
            console.info('[api18_create_simple_null] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      Text('API 18 create with SimpleAnimatorOptions undefined')
        .width('100%')
        .height(30)
        .id('api18_create_simple_undefined')
        .fontSize(16)

      Button('API18 CreateSimpleUndefined')
        .id('btn_api18_create_simple_undefined')
        .onClick(() => {
          try {
            let undefinedSimple: SimpleAnimatorOptions | undefined = undefined;
            this.animatorResultApi18 = animator.create(undefinedSimple);
            console.info('[api18_create_simple_undefined] SUCCESS', JSON.stringify(this.animatorResultApi18));
          } catch (error) {
            console.info('[api18_create_simple_undefined] ERROR: ' + JSON.stringify(error));
            AppStorage.setOrCreate('errCode', error?.code)
          }
        })
        .height('10%')

      // Animation display column
      Divider().color(Color.Gray).margin({ top: 10, bottom: 10 })

      Column()
        .width(this.columnWidth)
        .height(this.columnHeight)
        .backgroundColor(Color.Red)
        .id('animation_column')
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
