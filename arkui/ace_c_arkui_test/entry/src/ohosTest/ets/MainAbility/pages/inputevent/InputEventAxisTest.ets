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

import render from 'libnativerender.so'
import { CommonView } from '../../componet/CommonView';
import { InputEventTestFunctionData,InputEventTestFunctionStaticData } from './InputEventTest';
import router from '@ohos.router';

@Entry
@Component
struct InputEventAxisTest {
  private PAGE_TAG: string = (router.getParams() as InputEventTestFunctionData).pageTag;
  private funcName: string = (router.getParams() as InputEventTestFunctionData).funcName;

  build() {
    Column() {
      Button()
        .backgroundColor(Color.Transparent)
        .width(200)
        .height(100)
        .id('axisCallInputEvent')
        .onClick(() => {
          render.setFuncName(InputEventTestFunctionStaticData.funcName);
        })

      CommonView({
        pageTag: this.PAGE_TAG,
      }).onAppear(() => {
        render.inputEventAxisTest(this.PAGE_TAG,this.funcName);
      })
    }
  }
}
