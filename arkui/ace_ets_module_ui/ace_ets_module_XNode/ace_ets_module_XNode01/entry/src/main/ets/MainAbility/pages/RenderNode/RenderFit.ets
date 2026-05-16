/**
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

@Entry
@Component
struct RenderFit1 {

  build() {
    Column() {
      Text("LEFT").id("LEFT").renderFit(RenderFit.LEFT).margin(5)
      Text("RIGHT").id("RIGHT").renderFit(RenderFit.RIGHT).margin(5)
      Text("TOP_LEFT").id("TOP_LEFT").renderFit(RenderFit.TOP_LEFT).margin(5)
      Text("TOP_RIGHT").id("TOP_RIGHT").renderFit(RenderFit.TOP_RIGHT).margin(5)
      Text("BOTTOM_LEFT").id("BOTTOM_LEFT").renderFit(RenderFit.BOTTOM_LEFT).margin(5)
      Text("BOTTOM_RIGHT").id("BOTTOM_RIGHT").renderFit(RenderFit.BOTTOM_RIGHT).margin(5)
      Text("RESIZE_FILL").id("RESIZE_FILL").renderFit(RenderFit.RESIZE_FILL).margin(5)
      Text("RESIZE_CONTAIN").id("RESIZE_CONTAIN").renderFit(RenderFit.RESIZE_CONTAIN).margin(5)
      Text("RESIZE_CONTAIN_TOP_LEFT").id("RESIZE_CONTAIN_TOP_LEFT").renderFit(RenderFit.RESIZE_CONTAIN_TOP_LEFT).margin(5)
      Text("RESIZE_CONTAIN_BOTTOM_RIGHT").id("RESIZE_CONTAIN_BOTTOM_RIGHT").renderFit(RenderFit.RESIZE_CONTAIN_BOTTOM_RIGHT).margin(5)
      Text("RESIZE_COVER").id("RESIZE_COVER").renderFit(RenderFit.RESIZE_COVER).margin(5)
      Text("RESIZE_COVER_TOP_LEFT").id("RESIZE_COVER_TOP_LEFT").renderFit(RenderFit.RESIZE_COVER_TOP_LEFT).margin(5)
      Text("RESIZE_COVER_BOTTOM_RIGHT").id("RESIZE_COVER_BOTTOM_RIGHT").renderFit(RenderFit.RESIZE_COVER_BOTTOM_RIGHT).margin(5)
      Text("TOP").id("RenderFit_TOP").renderFit(RenderFit.TOP).margin(5)
    }.width('90%').height("90%")
  }
}