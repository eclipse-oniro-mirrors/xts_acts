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

@Entry
@Component
struct IndicatorComponentNullUndefined {
  private indicatorController: IndicatorComponentController = new IndicatorComponentController()

  build() {
    Column({space:3}) {
      Button('changeNull')
        .id('changeIndexNullButton')
        .height(25)
        .onClick(()=>{
          this.indicatorController.changeIndex(null,null);
        })
      Button('changeUndefined')
        .id('changeIndexUndefinedButton')
        .height(25)
        .onClick(()=>{
          this.indicatorController.changeIndex(undefined,undefined);
        })

      Row({space:3}){
        IndicatorComponent(this.indicatorController)
          .id('IndicatorComponentNull')
          .height(30)
          .style(null)
          .count(null)
          .initialIndex(null)
          .loop(true)
          .count(6)
          .vertical(true)
        IndicatorComponent(this.indicatorController)
          .id('IndicatorComponentUndefined')
          .height(30)
          .style(undefined)
          .count(undefined)
          .initialIndex(undefined)
          .loop(true)
          .count(6)
          .vertical(true)
      }

    }
    .width('100%')
    .height('100%')
  }
}