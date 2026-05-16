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
struct getContext2DFromDrawingContextNullUndefined {
  build() {
    Column({ space: 3 }) {
      Canvas()
        .onReady(() => {
          try {
            let context2D: CanvasRenderingContext2D =
              CanvasRenderingContext2D.getContext2DFromDrawingContext(null, null)
              context2D.fillStyle = 'rgb(39,135,217)'
          } catch (error) {
            console.info('error')
          }
        })
        .id('getContext2DFromDrawingContextNull')
        .width(80)
        .height(80)
        .background(Color.Blue)
      Canvas()
        .onReady(() => {
          try {
            let context2D: CanvasRenderingContext2D =
              CanvasRenderingContext2D.getContext2DFromDrawingContext(undefined, undefined)
            context2D.fillStyle = 'rgb(39,135,217)'
          } catch (error) {
            console.info('error')
          }
        })
        .id('getContext2DFromDrawingContextUndefined')
        .width(80)
        .height(80)
        .background(Color.Blue)
    }
    .width('100%')
    .height('100%')
  }
}